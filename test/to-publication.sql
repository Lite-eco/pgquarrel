CREATE PUBLICATION same_pub_1;
CREATE PUBLICATION same_pub_2;
CREATE PUBLICATION "same_PUB_3";

CREATE PUBLICATION to_pub_4;

ALTER PUBLICATION same_pub_2 OWNER TO same_role_1;

ALTER PUBLICATION same_pub_1 ADD TABLE ONLY customers;

ALTER PUBLICATION same_pub_2 ADD TABLE ONLY products;
ALTER PUBLICATION same_pub_2 ADD TABLE ONLY orderlines;

ALTER PUBLICATION to_pub_4 ADD TABLE ONLY customers;
ALTER PUBLICATION to_pub_4 ADD TABLE ONLY products;
