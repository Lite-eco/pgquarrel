#include "matview.h"

/*
 * CREATE MATERIALIZED VIEW
 * DROP MATERIALIZED VIEW
 * ALTER MATERIALIZED VIEW
 *
 * TODO
 *
 * CREATE MATERIALIZED VIEW ... TABLESPACE
 * ALTER MATERIALIZED VIEW ... CLUSTER ON
 * ALTER MATERIALIZED VIEW ... SET WITHOUT CLUSTER
 * ALTER MATERIALIZED VIEW ... RENAME TO
 * ALTER MATERIALIZED VIEW ... RENAME COLUMN ... TO
 * ALTER MATERIALIZED VIEW ... SET SCHEMA
 * ALTER MATERIALIZED VIEW ... SET TABLESPACE
 */

static void dumpAlterColumnSetStatistics(FILE *output, PQLMaterializedView a,
		int i, bool force);
static void dumpAlterColumnSetStorage(FILE *output, PQLMaterializedView a,
									  int i, bool force);
static void dumpAlterColumnSetOptions(FILE *output, PQLMaterializedView a,
									  PQLMaterializedView b, int i);

PQLMaterializedView *
getMaterializedViews(PGconn *c, int *n)
{
	PQLMaterializedView		*v;
	PGresult	*res;
	int			i;

	logNoise("materialized view: server version: %d", PQserverVersion(c));

	/* check postgres version */
	if (PQserverVersion(c) < 90300)
	{
		logWarning("version %d does not support materialized views",
				   PQserverVersion(c));
		return NULL;
	}

	res = PQexec(c,
				 "SELECT c.oid, n.nspname, c.relname, t.spcname AS tablespacename, pg_get_viewdef(c.oid) AS viewdef, array_to_string(c.reloptions, ', ') AS reloptions, relispopulated, obj_description(c.oid, 'pg_class') AS description, pg_get_userbyid(c.relowner) AS relowner FROM pg_class c INNER JOIN pg_namespace n ON (c.relnamespace = n.oid) LEFT JOIN pg_tablespace t ON (c.reltablespace = t.oid) WHERE relkind = 'm' AND nspname !~ '^pg_' AND nspname <> 'information_schema' ORDER BY nspname, relname");

	if (PQresultStatus(res) != PGRES_TUPLES_OK)
	{
		logError("query failed: %s", PQresultErrorMessage(res));
		PQclear(res);
		PQfinish(c);
		/* XXX leak another connection? */
		exit(EXIT_FAILURE);
	}

	*n = PQntuples(res);
	if (*n > 0)
		v = (PQLMaterializedView *) malloc(*n * sizeof(PQLMaterializedView));
	else
		v = NULL;

	logDebug("number of materialized views in server: %d", *n);

	for (i = 0; i < *n; i++)
	{
		int	len;

		v[i].obj.oid = strtoul(PQgetvalue(res, i, PQfnumber(res, "oid")), NULL, 10);
		v[i].obj.schemaname = strdup(PQgetvalue(res, i, PQfnumber(res, "nspname")));
		v[i].obj.objectname = strdup(PQgetvalue(res, i, PQfnumber(res, "relname")));
		if (PQgetisnull(res, i, PQfnumber(res, "tablespacename")))
			v[i].tbspcname = NULL;
		else
			v[i].tbspcname = strdup(PQgetvalue(res, i, PQfnumber(res, "tablespacename")));
		v[i].populated = (PQgetvalue(res, i, PQfnumber(res,
									 "relispopulated"))[0] == 't');

		/* FIXME don't load it only iff view will be DROPped */
		len = PQgetlength(res, i, PQfnumber(res, "viewdef"));
		/* allocate only len because semicolon will be stripped */
		v[i].viewdef = (char *) malloc(len * sizeof(char));
		strncpy(v[i].viewdef, PQgetvalue(res, i, PQfnumber(res, "viewdef")), len - 1);
		v[i].viewdef[len - 1] = '\0';

		if (PQgetisnull(res, i, PQfnumber(res, "reloptions")))
			v[i].reloptions = NULL;
		else
			v[i].reloptions = strdup(PQgetvalue(res, i, PQfnumber(res, "reloptions")));
		if (PQgetisnull(res, i, PQfnumber(res, "description")))
			v[i].comment = NULL;
		else
			v[i].comment = strdup(PQgetvalue(res, i, PQfnumber(res, "description")));

		v[i].owner = strdup(PQgetvalue(res, i, PQfnumber(res, "relowner")));

		logDebug("materialized view %s.%s", formatObjectIdentifier(v[i].obj.schemaname),
				 formatObjectIdentifier(v[i].obj.objectname));

		/*
		 * These values are not assigned here (see
		 * getMaterializedViewAttributes), but default values are essential to
		 * avoid having trouble in freeMaterializedViews.
		 */
		v[i].nattributes = 0;
		v[i].attributes = NULL;

		if (v[i].reloptions)
			logDebug("materialized view %s.%s: reloptions: %s",
					 formatObjectIdentifier(v[i].obj.schemaname),
					 formatObjectIdentifier(v[i].obj.objectname),
					 v[i].reloptions);
		else
			logDebug("materialized view %s.%s: no reloptions",
					 formatObjectIdentifier(v[i].obj.schemaname),
					 formatObjectIdentifier(v[i].obj.objectname));
	}

	PQclear(res);

	return v;
}

void
getMaterializedViewAttributes(PGconn *c, PQLMaterializedView *v)
{
	char		*query = NULL;
	int			nquery = PGQQRYLEN;
	PGresult	*res;
	int			i;
	int			r;

	do
	{
		query = (char *) malloc(nquery * sizeof(char));

		/* FIXME attcollation (9.1)? */
		r = snprintf(query, nquery,
					 "SELECT a.attnum, a.attname, a.attstattarget, a.attstorage, CASE WHEN t.typstorage <> a.attstorage THEN FALSE ELSE TRUE END AS defstorage, array_to_string(attoptions, ', ') AS attoptions FROM pg_attribute a LEFT JOIN pg_type t ON (a.atttypid = t.oid) WHERE a.attrelid = %u AND a.attnum > 0 AND attisdropped IS FALSE ORDER BY a.attname",
					 v->obj.oid);

		if (r < nquery)
			break;

		logNoise("query size: required (%u) ; initial (%u)", r, nquery);
		nquery = r + 1;	/* make enough room for query */
		free(query);
	}
	while (true);

	res = PQexec(c, query);

	free(query);

	if (PQresultStatus(res) != PGRES_TUPLES_OK)
	{
		logError("query failed: %s", PQresultErrorMessage(res));
		PQclear(res);
		PQfinish(c);
		/* XXX leak another connection? */
		exit(EXIT_FAILURE);
	}

	v->nattributes = PQntuples(res);
	if (v->nattributes > 0)
		v->attributes = (PQLAttribute *) malloc(v->nattributes * sizeof(PQLAttribute));
	else
		v->attributes = NULL;

	logDebug("number of attributes in materialized view %s.%s: %d",
			 formatObjectIdentifier(v->obj.schemaname),
			 formatObjectIdentifier(v->obj.objectname), v->nattributes);

	for (i = 0; i < v->nattributes; i++)
	{
		char	storage;

		v->attributes[i].attnum = strtoul(PQgetvalue(res, i, PQfnumber(res, "attnum")),
										  NULL, 10);
		v->attributes[i].attname = strdup(PQgetvalue(res, i, PQfnumber(res,
										  "attname")));

		/* those fields are not used in materialized views */
		v->attributes[i].attnotnull = false;
		v->attributes[i].atttypname = NULL;
		v->attributes[i].attdefexpr = NULL;
		v->attributes[i].attcollation = NULL;
		v->attributes[i].comment = NULL;

		/* statistics target */
		v->attributes[i].attstattarget = atoi(PQgetvalue(res, i, PQfnumber(res,
											  "attstattarget")));

		/* storage */
		storage = PQgetvalue(res, i, PQfnumber(res, "attstorage"))[0];
		switch (storage)
		{
			case 'p':
				v->attributes[i].attstorage = strdup("PLAIN");
				break;
			case 'e':
				v->attributes[i].attstorage = strdup("EXTERNAL");
				break;
			case 'm':
				v->attributes[i].attstorage = strdup("MAIN");
				break;
			case 'x':
				v->attributes[i].attstorage = strdup("EXTENDED");
				break;
			default:
				v->attributes[i].attstorage = NULL;
				break;
		}
		v->attributes[i].defstorage = (PQgetvalue(res, i, PQfnumber(res,
									   "defstorage"))[0] == 't');

		/* attribute options */
		if (PQgetisnull(res, i, PQfnumber(res, "attoptions")))
			v->attributes[i].attoptions = NULL;
		else
			v->attributes[i].attoptions = strdup(PQgetvalue(res, i, PQfnumber(res,
												 "attoptions")));
	}

	PQclear(res);
}

void
freeMaterializedViews(PQLMaterializedView *v, int n)
{
	if (n > 0)
	{
		int	i;

		for (i = 0; i < n; i++)
		{
			int	j;

			free(v[i].obj.schemaname);
			free(v[i].obj.objectname);
			if (v[i].tbspcname)
				free(v[i].tbspcname);
			free(v[i].viewdef);
			if (v[i].reloptions)
				free(v[i].reloptions);
			if (v[i].comment)
				free(v[i].comment);
			free(v[i].owner);

			/* attributes */
			for (j = 0; j < v[i].nattributes; j++)
			{
				free(v[i].attributes[j].attname);
				if (v[i].attributes[j].attstorage)
					free(v[i].attributes[j].attstorage);
				if (v[i].attributes[j].attoptions)
					free(v[i].attributes[j].attoptions);
			}

			if (v[i].attributes)
				free(v[i].attributes);
		}

		free(v);
	}
}

void
dumpDropMaterializedView(FILE *output, PQLMaterializedView v)
{
	fprintf(output, "\n\n");
	fprintf(output, "DROP MATERIALIZED VIEW %s.%s;",
			formatObjectIdentifier(v.obj.schemaname),
			formatObjectIdentifier(v.obj.objectname));
}

void
dumpCreateMaterializedView(FILE *output, PQLMaterializedView v)
{
	int	i;

	fprintf(output, "\n\n");
	fprintf(output, "CREATE MATERIALIZED VIEW %s.%s",
			formatObjectIdentifier(v.obj.schemaname),
			formatObjectIdentifier(v.obj.objectname));

	if (v.reloptions != NULL)
		fprintf(output, " WITH (%s)", v.reloptions);

	fprintf(output, " AS\n%s", v.viewdef);

	/*
	 * create a materialized view just like a view because the content will be
	 * refreshed above.
	 */
	fprintf(output, "\n\tWITH NO DATA");
	fprintf(output, ";");

	fprintf(output, "\n\n");
	fprintf(output, "REFRESH MATERIALIZED VIEW %s.%s",
			formatObjectIdentifier(v.obj.schemaname),
			formatObjectIdentifier(v.obj.objectname));
	fprintf(output, ";");

	/* statistics target */
	for (i = 0; i < v.nattributes; i++)
	{
		dumpAlterColumnSetStatistics(output, v, i, false);
		dumpAlterColumnSetStorage(output, v, i, false);
	}

	/* comment */
	if (options.comment && v.comment != NULL)
	{
		fprintf(output, "\n\n");
		fprintf(output, "COMMENT ON MATERIALIZED VIEW %s.%s IS '%s';",
				formatObjectIdentifier(v.obj.schemaname),
				formatObjectIdentifier(v.obj.objectname),
				v.comment);
	}

	/* owner */
	if (options.owner)
	{
		fprintf(output, "\n\n");
		fprintf(output, "ALTER MATERIALIZED VIEW %s.%s OWNER TO %s;",
				formatObjectIdentifier(v.obj.schemaname),
				formatObjectIdentifier(v.obj.objectname),
				v.owner);
	}
}

static void
dumpAlterColumnSetStatistics(FILE *output, PQLMaterializedView a, int i,
							 bool force)
{
	if (a.attributes[i].attstattarget != -1 || force)
	{
		fprintf(output, "\n\n");
		fprintf(output,
				"ALTER MATERIALIZED VIEW %s.%s ALTER COLUMN %s SET STATISTICS %d",
				formatObjectIdentifier(a.obj.schemaname),
				formatObjectIdentifier(a.obj.objectname),
				a.attributes[i].attname,
				a.attributes[i].attstattarget);
		fprintf(output, ";");
	}
}

static void
dumpAlterColumnSetStorage(FILE *output, PQLMaterializedView a, int i,
						  bool force)
{
	if (!a.attributes[i].defstorage || force)
	{
		fprintf(output, "\n\n");
		fprintf(output, "ALTER MATERIALIZED VIEW %s.%s ALTER COLUMN %s SET STORAGE %s",
				formatObjectIdentifier(a.obj.schemaname),
				formatObjectIdentifier(a.obj.objectname),
				a.attributes[i].attname,
				a.attributes[i].attstorage);
		fprintf(output, ";");
	}
}

/*
 * Set attribute options if needed
 */
static void
dumpAlterColumnSetOptions(FILE *output, PQLMaterializedView a,
						  PQLMaterializedView b, int i)
{
	if (a.attributes[i].attoptions == NULL && b.attributes[i].attoptions != NULL)
	{
		fprintf(output, "\n\n");
		fprintf(output, "ALTER MATERIALIZED VIEW %s.%s ALTER COLUMN %s SET (%s)",
				formatObjectIdentifier(b.obj.schemaname),
				formatObjectIdentifier(b.obj.objectname),
				b.attributes[i].attname,
				b.attributes[i].attoptions);
	}
	else if (a.attributes[i].attoptions != NULL &&
			 b.attributes[i].attoptions == NULL)
	{
		stringList	*rlist;

		rlist = diffRelOptions(a.attributes[i].attoptions, b.attributes[i].attoptions,
							   PGQ_EXCEPT);
		if (rlist)
		{
			char	*resetlist;

			resetlist = printRelOptions(rlist);
			fprintf(output, "\n\n");
			fprintf(output, "ALTER MATERIALIZED VIEW %s.%s ALTER COLUMN %s RESET (%s)",
					formatObjectIdentifier(b.obj.schemaname),
					formatObjectIdentifier(b.obj.objectname),
					b.attributes[i].attname,
					resetlist);
			fprintf(output, ";");

			free(resetlist);
			freeStringList(rlist);
		}
	}
	else if (a.attributes[i].attoptions != NULL &&
			 b.attributes[i].attoptions != NULL &&
			 strcmp(a.attributes[i].attoptions, b.attributes[i].attoptions) != 0)
	{
		stringList	*rlist, *slist;

		rlist = diffRelOptions(a.attributes[i].attoptions, b.attributes[i].attoptions,
							   PGQ_EXCEPT);
		if (rlist)
		{
			char	*resetlist;

			resetlist = printRelOptions(rlist);
			fprintf(output, "\n\n");
			fprintf(output, "ALTER MATERIALIZED VIEW %s.%s ALTER COLUMN %s RESET (%s)",
					formatObjectIdentifier(b.obj.schemaname),
					formatObjectIdentifier(b.obj.objectname),
					b.attributes[i].attname,
					resetlist);
			fprintf(output, ";");

			free(resetlist);
			freeStringList(rlist);
		}

		/*
		 * FIXME we used to use diffRelOptions with PGQ_INTERSECT kind but it
		 * is buggy. Instead, we use all options from b. It is not wrong, but
		 * it would be nice to remove unnecessary options (e.g. same
		 * option/value).
		 */
		slist = buildRelOptions(b.attributes[i].attoptions);
		if (slist)
		{
			char	*setlist;

			setlist = printRelOptions(slist);
			fprintf(output, "\n\n");
			fprintf(output, "ALTER MATERIALIZED VIEW %s.%s ALTER COLUMN %s SET (%s)",
					formatObjectIdentifier(b.obj.schemaname),
					formatObjectIdentifier(b.obj.objectname),
					b.attributes[i].attname,
					setlist);
			fprintf(output, ";");

			free(setlist);
			freeStringList(slist);
		}
	}
}

void
dumpAlterMaterializedView(FILE *output, PQLMaterializedView a,
						  PQLMaterializedView b)
{
	int i;

	/* the attributes are sorted by name */
	for (i = 0; i < a.nattributes; i++)
	{
		/* do attribute options change? */
		dumpAlterColumnSetOptions(output, a, b, i);

		/* column statistics changed */
		if (a.attributes[i].attstattarget != b.attributes[i].attstattarget)
			dumpAlterColumnSetStatistics(output, b, i, true);

		/* storage changed */
		if (a.attributes[i].defstorage != b.attributes[i].defstorage)
			dumpAlterColumnSetStorage(output, b, i, true);
	}

	/* reloptions */
	if ((a.reloptions == NULL && b.reloptions != NULL))
	{
		fprintf(output, "\n\n");
		fprintf(output, "ALTER MATERIALIZED VIEW %s.%s SET (%s)",
				formatObjectIdentifier(b.obj.schemaname),
				formatObjectIdentifier(b.obj.objectname),
				b.reloptions);
		fprintf(output, ";");
	}
	else if (a.reloptions != NULL && b.reloptions != NULL &&
			 strcmp(a.reloptions, b.reloptions) != 0)
	{
		stringList	*rlist, *slist;

		rlist = diffRelOptions(a.reloptions, b.reloptions, PGQ_EXCEPT);
		if (rlist)
		{
			char	*resetlist;

			resetlist = printRelOptions(rlist);
			fprintf(output, "\n--\n");
			fprintf(output, "ALTER MATERIALIZED VIEW %s.%s RESET (%s)",
					formatObjectIdentifier(b.obj.schemaname),
					formatObjectIdentifier(b.obj.objectname),
					resetlist);
			fprintf(output, ";");

			free(resetlist);
			freeStringList(rlist);
		}

		/*
		 * FIXME we used to use diffRelOptions with PGQ_INTERSECT kind but it
		 * is buggy. Instead, we use all options from b. It is not wrong, but
		 * it would be nice to remove unnecessary options (e.g. same
		 * option/value).
		 */
		slist = buildRelOptions(b.reloptions);
		if (slist)
		{
			char	*setlist;

			setlist = printRelOptions(slist);
			fprintf(output, "\n\n");
			fprintf(output, "ALTER MATERIALIZED VIEW %s.%s SET (%s)",
					formatObjectIdentifier(b.obj.schemaname),
					formatObjectIdentifier(b.obj.objectname),
					setlist);
			fprintf(output, ";");

			free(setlist);
			freeStringList(slist);
		}
	}
	else if (a.reloptions != NULL && b.reloptions == NULL)
	{
		stringList	*rlist;

		rlist = diffRelOptions(a.reloptions, b.reloptions, PGQ_EXCEPT);
		if (rlist)
		{
			char	*resetlist;

			resetlist = printRelOptions(rlist);
			fprintf(output, "\n\n");
			fprintf(output, "ALTER MATERIALIZED VIEW %s.%s RESET (%s)",
					formatObjectIdentifier(b.obj.schemaname),
					formatObjectIdentifier(b.obj.objectname),
					resetlist);
			fprintf(output, ";");

			free(resetlist);
			freeStringList(rlist);
		}
	}

	/* comment */
	if (options.comment)
	{
		if ((a.comment == NULL && b.comment != NULL) ||
				(a.comment != NULL && b.comment != NULL &&
				 strcmp(a.comment, b.comment) != 0))
		{
			fprintf(output, "\n\n");
			fprintf(output, "COMMENT ON MATERIALIZED VIEW %s.%s IS '%s';",
					formatObjectIdentifier(b.obj.schemaname),
					formatObjectIdentifier(b.obj.objectname),
					b.comment);
		}
		else if (a.comment != NULL && b.comment == NULL)
		{
			fprintf(output, "\n\n");
			fprintf(output, "COMMENT ON MATERIALIZED VIEW %s.%s IS NULL;",
					formatObjectIdentifier(b.obj.schemaname),
					formatObjectIdentifier(b.obj.objectname));
		}
	}

	/* owner */
	if (options.owner)
	{
		if (strcmp(a.owner, b.owner) != 0)
		{
			fprintf(output, "\n\n");
			fprintf(output, "ALTER MATERIALIZED VIEW %s.%s OWNER TO %s;",
					formatObjectIdentifier(b.obj.schemaname),
					formatObjectIdentifier(b.obj.objectname),
					b.owner);
		}
	}
}
