# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.21

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.21.4/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.21.4/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/mlo/git/lite-pgquarrel

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/mlo/git/lite-pgquarrel

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target install/local
install/local: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing only the local directory..."
	/usr/local/Cellar/cmake/3.21.4/bin/cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake
.PHONY : install/local

# Special rule for the target install/local
install/local/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing only the local directory..."
	/usr/local/Cellar/cmake/3.21.4/bin/cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake
.PHONY : install/local/fast

# Special rule for the target install/strip
install/strip: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing the project stripped..."
	/usr/local/Cellar/cmake/3.21.4/bin/cmake -DCMAKE_INSTALL_DO_STRIP=1 -P cmake_install.cmake
.PHONY : install/strip

# Special rule for the target install/strip
install/strip/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing the project stripped..."
	/usr/local/Cellar/cmake/3.21.4/bin/cmake -DCMAKE_INSTALL_DO_STRIP=1 -P cmake_install.cmake
.PHONY : install/strip/fast

# Special rule for the target install
install: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Install the project..."
	/usr/local/Cellar/cmake/3.21.4/bin/cmake -P cmake_install.cmake
.PHONY : install

# Special rule for the target install
install/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Install the project..."
	/usr/local/Cellar/cmake/3.21.4/bin/cmake -P cmake_install.cmake
.PHONY : install/fast

# Special rule for the target list_install_components
list_install_components:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Available install components are: \"Unspecified\""
.PHONY : list_install_components

# Special rule for the target list_install_components
list_install_components/fast: list_install_components
.PHONY : list_install_components/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/local/Cellar/cmake/3.21.4/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake cache editor..."
	/usr/local/Cellar/cmake/3.21.4/bin/ccmake -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /Users/mlo/git/lite-pgquarrel/CMakeFiles /Users/mlo/git/lite-pgquarrel//CMakeFiles/progress.marks
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /Users/mlo/git/lite-pgquarrel/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named pgquarrel

# Build rule for target.
pgquarrel: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 pgquarrel
.PHONY : pgquarrel

# fast build rule for target.
pgquarrel/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/build
.PHONY : pgquarrel/fast

#=============================================================================
# Target rules for targets named style

# Build rule for target.
style: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 style
.PHONY : style

# fast build rule for target.
style/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/style.dir/build.make CMakeFiles/style.dir/build
.PHONY : style/fast

#=============================================================================
# Target rules for targets named mini

# Build rule for target.
mini: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mini
.PHONY : mini

# fast build rule for target.
mini/fast:
	$(MAKE) $(MAKESILENT) -f mini/CMakeFiles/mini.dir/build.make mini/CMakeFiles/mini.dir/build
.PHONY : mini/fast

src/aggregate.o: src/aggregate.c.o
.PHONY : src/aggregate.o

# target to build an object file
src/aggregate.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/aggregate.c.o
.PHONY : src/aggregate.c.o

src/aggregate.i: src/aggregate.c.i
.PHONY : src/aggregate.i

# target to preprocess a source file
src/aggregate.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/aggregate.c.i
.PHONY : src/aggregate.c.i

src/aggregate.s: src/aggregate.c.s
.PHONY : src/aggregate.s

# target to generate assembly for a file
src/aggregate.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/aggregate.c.s
.PHONY : src/aggregate.c.s

src/am.o: src/am.c.o
.PHONY : src/am.o

# target to build an object file
src/am.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/am.c.o
.PHONY : src/am.c.o

src/am.i: src/am.c.i
.PHONY : src/am.i

# target to preprocess a source file
src/am.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/am.c.i
.PHONY : src/am.c.i

src/am.s: src/am.c.s
.PHONY : src/am.s

# target to generate assembly for a file
src/am.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/am.c.s
.PHONY : src/am.c.s

src/cast.o: src/cast.c.o
.PHONY : src/cast.o

# target to build an object file
src/cast.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/cast.c.o
.PHONY : src/cast.c.o

src/cast.i: src/cast.c.i
.PHONY : src/cast.i

# target to preprocess a source file
src/cast.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/cast.c.i
.PHONY : src/cast.c.i

src/cast.s: src/cast.c.s
.PHONY : src/cast.s

# target to generate assembly for a file
src/cast.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/cast.c.s
.PHONY : src/cast.c.s

src/collation.o: src/collation.c.o
.PHONY : src/collation.o

# target to build an object file
src/collation.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/collation.c.o
.PHONY : src/collation.c.o

src/collation.i: src/collation.c.i
.PHONY : src/collation.i

# target to preprocess a source file
src/collation.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/collation.c.i
.PHONY : src/collation.c.i

src/collation.s: src/collation.c.s
.PHONY : src/collation.s

# target to generate assembly for a file
src/collation.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/collation.c.s
.PHONY : src/collation.c.s

src/common.o: src/common.c.o
.PHONY : src/common.o

# target to build an object file
src/common.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/common.c.o
.PHONY : src/common.c.o

src/common.i: src/common.c.i
.PHONY : src/common.i

# target to preprocess a source file
src/common.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/common.c.i
.PHONY : src/common.c.i

src/common.s: src/common.c.s
.PHONY : src/common.s

# target to generate assembly for a file
src/common.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/common.c.s
.PHONY : src/common.c.s

src/conversion.o: src/conversion.c.o
.PHONY : src/conversion.o

# target to build an object file
src/conversion.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/conversion.c.o
.PHONY : src/conversion.c.o

src/conversion.i: src/conversion.c.i
.PHONY : src/conversion.i

# target to preprocess a source file
src/conversion.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/conversion.c.i
.PHONY : src/conversion.c.i

src/conversion.s: src/conversion.c.s
.PHONY : src/conversion.s

# target to generate assembly for a file
src/conversion.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/conversion.c.s
.PHONY : src/conversion.c.s

src/domain.o: src/domain.c.o
.PHONY : src/domain.o

# target to build an object file
src/domain.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/domain.c.o
.PHONY : src/domain.c.o

src/domain.i: src/domain.c.i
.PHONY : src/domain.i

# target to preprocess a source file
src/domain.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/domain.c.i
.PHONY : src/domain.c.i

src/domain.s: src/domain.c.s
.PHONY : src/domain.s

# target to generate assembly for a file
src/domain.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/domain.c.s
.PHONY : src/domain.c.s

src/eventtrigger.o: src/eventtrigger.c.o
.PHONY : src/eventtrigger.o

# target to build an object file
src/eventtrigger.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/eventtrigger.c.o
.PHONY : src/eventtrigger.c.o

src/eventtrigger.i: src/eventtrigger.c.i
.PHONY : src/eventtrigger.i

# target to preprocess a source file
src/eventtrigger.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/eventtrigger.c.i
.PHONY : src/eventtrigger.c.i

src/eventtrigger.s: src/eventtrigger.c.s
.PHONY : src/eventtrigger.s

# target to generate assembly for a file
src/eventtrigger.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/eventtrigger.c.s
.PHONY : src/eventtrigger.c.s

src/extension.o: src/extension.c.o
.PHONY : src/extension.o

# target to build an object file
src/extension.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/extension.c.o
.PHONY : src/extension.c.o

src/extension.i: src/extension.c.i
.PHONY : src/extension.i

# target to preprocess a source file
src/extension.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/extension.c.i
.PHONY : src/extension.c.i

src/extension.s: src/extension.c.s
.PHONY : src/extension.s

# target to generate assembly for a file
src/extension.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/extension.c.s
.PHONY : src/extension.c.s

src/fdw.o: src/fdw.c.o
.PHONY : src/fdw.o

# target to build an object file
src/fdw.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/fdw.c.o
.PHONY : src/fdw.c.o

src/fdw.i: src/fdw.c.i
.PHONY : src/fdw.i

# target to preprocess a source file
src/fdw.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/fdw.c.i
.PHONY : src/fdw.c.i

src/fdw.s: src/fdw.c.s
.PHONY : src/fdw.s

# target to generate assembly for a file
src/fdw.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/fdw.c.s
.PHONY : src/fdw.c.s

src/function.o: src/function.c.o
.PHONY : src/function.o

# target to build an object file
src/function.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/function.c.o
.PHONY : src/function.c.o

src/function.i: src/function.c.i
.PHONY : src/function.i

# target to preprocess a source file
src/function.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/function.c.i
.PHONY : src/function.c.i

src/function.s: src/function.c.s
.PHONY : src/function.s

# target to generate assembly for a file
src/function.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/function.c.s
.PHONY : src/function.c.s

src/index.o: src/index.c.o
.PHONY : src/index.o

# target to build an object file
src/index.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/index.c.o
.PHONY : src/index.c.o

src/index.i: src/index.c.i
.PHONY : src/index.i

# target to preprocess a source file
src/index.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/index.c.i
.PHONY : src/index.c.i

src/index.s: src/index.c.s
.PHONY : src/index.s

# target to generate assembly for a file
src/index.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/index.c.s
.PHONY : src/index.c.s

src/language.o: src/language.c.o
.PHONY : src/language.o

# target to build an object file
src/language.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/language.c.o
.PHONY : src/language.c.o

src/language.i: src/language.c.i
.PHONY : src/language.i

# target to preprocess a source file
src/language.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/language.c.i
.PHONY : src/language.c.i

src/language.s: src/language.c.s
.PHONY : src/language.s

# target to generate assembly for a file
src/language.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/language.c.s
.PHONY : src/language.c.s

src/matview.o: src/matview.c.o
.PHONY : src/matview.o

# target to build an object file
src/matview.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/matview.c.o
.PHONY : src/matview.c.o

src/matview.i: src/matview.c.i
.PHONY : src/matview.i

# target to preprocess a source file
src/matview.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/matview.c.i
.PHONY : src/matview.c.i

src/matview.s: src/matview.c.s
.PHONY : src/matview.s

# target to generate assembly for a file
src/matview.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/matview.c.s
.PHONY : src/matview.c.s

src/operator.o: src/operator.c.o
.PHONY : src/operator.o

# target to build an object file
src/operator.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/operator.c.o
.PHONY : src/operator.c.o

src/operator.i: src/operator.c.i
.PHONY : src/operator.i

# target to preprocess a source file
src/operator.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/operator.c.i
.PHONY : src/operator.c.i

src/operator.s: src/operator.c.s
.PHONY : src/operator.s

# target to generate assembly for a file
src/operator.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/operator.c.s
.PHONY : src/operator.c.s

src/policy.o: src/policy.c.o
.PHONY : src/policy.o

# target to build an object file
src/policy.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/policy.c.o
.PHONY : src/policy.c.o

src/policy.i: src/policy.c.i
.PHONY : src/policy.i

# target to preprocess a source file
src/policy.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/policy.c.i
.PHONY : src/policy.c.i

src/policy.s: src/policy.c.s
.PHONY : src/policy.s

# target to generate assembly for a file
src/policy.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/policy.c.s
.PHONY : src/policy.c.s

src/privileges.o: src/privileges.c.o
.PHONY : src/privileges.o

# target to build an object file
src/privileges.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/privileges.c.o
.PHONY : src/privileges.c.o

src/privileges.i: src/privileges.c.i
.PHONY : src/privileges.i

# target to preprocess a source file
src/privileges.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/privileges.c.i
.PHONY : src/privileges.c.i

src/privileges.s: src/privileges.c.s
.PHONY : src/privileges.s

# target to generate assembly for a file
src/privileges.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/privileges.c.s
.PHONY : src/privileges.c.s

src/publication.o: src/publication.c.o
.PHONY : src/publication.o

# target to build an object file
src/publication.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/publication.c.o
.PHONY : src/publication.c.o

src/publication.i: src/publication.c.i
.PHONY : src/publication.i

# target to preprocess a source file
src/publication.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/publication.c.i
.PHONY : src/publication.c.i

src/publication.s: src/publication.c.s
.PHONY : src/publication.s

# target to generate assembly for a file
src/publication.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/publication.c.s
.PHONY : src/publication.c.s

src/quarrel.o: src/quarrel.c.o
.PHONY : src/quarrel.o

# target to build an object file
src/quarrel.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/quarrel.c.o
.PHONY : src/quarrel.c.o

src/quarrel.i: src/quarrel.c.i
.PHONY : src/quarrel.i

# target to preprocess a source file
src/quarrel.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/quarrel.c.i
.PHONY : src/quarrel.c.i

src/quarrel.s: src/quarrel.c.s
.PHONY : src/quarrel.s

# target to generate assembly for a file
src/quarrel.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/quarrel.c.s
.PHONY : src/quarrel.c.s

src/rule.o: src/rule.c.o
.PHONY : src/rule.o

# target to build an object file
src/rule.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/rule.c.o
.PHONY : src/rule.c.o

src/rule.i: src/rule.c.i
.PHONY : src/rule.i

# target to preprocess a source file
src/rule.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/rule.c.i
.PHONY : src/rule.c.i

src/rule.s: src/rule.c.s
.PHONY : src/rule.s

# target to generate assembly for a file
src/rule.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/rule.c.s
.PHONY : src/rule.c.s

src/schema.o: src/schema.c.o
.PHONY : src/schema.o

# target to build an object file
src/schema.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/schema.c.o
.PHONY : src/schema.c.o

src/schema.i: src/schema.c.i
.PHONY : src/schema.i

# target to preprocess a source file
src/schema.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/schema.c.i
.PHONY : src/schema.c.i

src/schema.s: src/schema.c.s
.PHONY : src/schema.s

# target to generate assembly for a file
src/schema.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/schema.c.s
.PHONY : src/schema.c.s

src/sequence.o: src/sequence.c.o
.PHONY : src/sequence.o

# target to build an object file
src/sequence.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/sequence.c.o
.PHONY : src/sequence.c.o

src/sequence.i: src/sequence.c.i
.PHONY : src/sequence.i

# target to preprocess a source file
src/sequence.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/sequence.c.i
.PHONY : src/sequence.c.i

src/sequence.s: src/sequence.c.s
.PHONY : src/sequence.s

# target to generate assembly for a file
src/sequence.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/sequence.c.s
.PHONY : src/sequence.c.s

src/server.o: src/server.c.o
.PHONY : src/server.o

# target to build an object file
src/server.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/server.c.o
.PHONY : src/server.c.o

src/server.i: src/server.c.i
.PHONY : src/server.i

# target to preprocess a source file
src/server.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/server.c.i
.PHONY : src/server.c.i

src/server.s: src/server.c.s
.PHONY : src/server.s

# target to generate assembly for a file
src/server.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/server.c.s
.PHONY : src/server.c.s

src/statistics.o: src/statistics.c.o
.PHONY : src/statistics.o

# target to build an object file
src/statistics.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/statistics.c.o
.PHONY : src/statistics.c.o

src/statistics.i: src/statistics.c.i
.PHONY : src/statistics.i

# target to preprocess a source file
src/statistics.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/statistics.c.i
.PHONY : src/statistics.c.i

src/statistics.s: src/statistics.c.s
.PHONY : src/statistics.s

# target to generate assembly for a file
src/statistics.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/statistics.c.s
.PHONY : src/statistics.c.s

src/subscription.o: src/subscription.c.o
.PHONY : src/subscription.o

# target to build an object file
src/subscription.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/subscription.c.o
.PHONY : src/subscription.c.o

src/subscription.i: src/subscription.c.i
.PHONY : src/subscription.i

# target to preprocess a source file
src/subscription.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/subscription.c.i
.PHONY : src/subscription.c.i

src/subscription.s: src/subscription.c.s
.PHONY : src/subscription.s

# target to generate assembly for a file
src/subscription.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/subscription.c.s
.PHONY : src/subscription.c.s

src/table.o: src/table.c.o
.PHONY : src/table.o

# target to build an object file
src/table.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/table.c.o
.PHONY : src/table.c.o

src/table.i: src/table.c.i
.PHONY : src/table.i

# target to preprocess a source file
src/table.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/table.c.i
.PHONY : src/table.c.i

src/table.s: src/table.c.s
.PHONY : src/table.s

# target to generate assembly for a file
src/table.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/table.c.s
.PHONY : src/table.c.s

src/textsearch.o: src/textsearch.c.o
.PHONY : src/textsearch.o

# target to build an object file
src/textsearch.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/textsearch.c.o
.PHONY : src/textsearch.c.o

src/textsearch.i: src/textsearch.c.i
.PHONY : src/textsearch.i

# target to preprocess a source file
src/textsearch.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/textsearch.c.i
.PHONY : src/textsearch.c.i

src/textsearch.s: src/textsearch.c.s
.PHONY : src/textsearch.s

# target to generate assembly for a file
src/textsearch.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/textsearch.c.s
.PHONY : src/textsearch.c.s

src/transform.o: src/transform.c.o
.PHONY : src/transform.o

# target to build an object file
src/transform.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/transform.c.o
.PHONY : src/transform.c.o

src/transform.i: src/transform.c.i
.PHONY : src/transform.i

# target to preprocess a source file
src/transform.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/transform.c.i
.PHONY : src/transform.c.i

src/transform.s: src/transform.c.s
.PHONY : src/transform.s

# target to generate assembly for a file
src/transform.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/transform.c.s
.PHONY : src/transform.c.s

src/trigger.o: src/trigger.c.o
.PHONY : src/trigger.o

# target to build an object file
src/trigger.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/trigger.c.o
.PHONY : src/trigger.c.o

src/trigger.i: src/trigger.c.i
.PHONY : src/trigger.i

# target to preprocess a source file
src/trigger.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/trigger.c.i
.PHONY : src/trigger.c.i

src/trigger.s: src/trigger.c.s
.PHONY : src/trigger.s

# target to generate assembly for a file
src/trigger.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/trigger.c.s
.PHONY : src/trigger.c.s

src/type.o: src/type.c.o
.PHONY : src/type.o

# target to build an object file
src/type.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/type.c.o
.PHONY : src/type.c.o

src/type.i: src/type.c.i
.PHONY : src/type.i

# target to preprocess a source file
src/type.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/type.c.i
.PHONY : src/type.c.i

src/type.s: src/type.c.s
.PHONY : src/type.s

# target to generate assembly for a file
src/type.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/type.c.s
.PHONY : src/type.c.s

src/usermapping.o: src/usermapping.c.o
.PHONY : src/usermapping.o

# target to build an object file
src/usermapping.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/usermapping.c.o
.PHONY : src/usermapping.c.o

src/usermapping.i: src/usermapping.c.i
.PHONY : src/usermapping.i

# target to preprocess a source file
src/usermapping.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/usermapping.c.i
.PHONY : src/usermapping.c.i

src/usermapping.s: src/usermapping.c.s
.PHONY : src/usermapping.s

# target to generate assembly for a file
src/usermapping.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/usermapping.c.s
.PHONY : src/usermapping.c.s

src/view.o: src/view.c.o
.PHONY : src/view.o

# target to build an object file
src/view.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/view.c.o
.PHONY : src/view.c.o

src/view.i: src/view.c.i
.PHONY : src/view.i

# target to preprocess a source file
src/view.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/view.c.i
.PHONY : src/view.c.i

src/view.s: src/view.c.s
.PHONY : src/view.s

# target to generate assembly for a file
src/view.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/pgquarrel.dir/build.make CMakeFiles/pgquarrel.dir/src/view.c.s
.PHONY : src/view.c.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... install"
	@echo "... install/local"
	@echo "... install/strip"
	@echo "... list_install_components"
	@echo "... rebuild_cache"
	@echo "... style"
	@echo "... mini"
	@echo "... pgquarrel"
	@echo "... src/aggregate.o"
	@echo "... src/aggregate.i"
	@echo "... src/aggregate.s"
	@echo "... src/am.o"
	@echo "... src/am.i"
	@echo "... src/am.s"
	@echo "... src/cast.o"
	@echo "... src/cast.i"
	@echo "... src/cast.s"
	@echo "... src/collation.o"
	@echo "... src/collation.i"
	@echo "... src/collation.s"
	@echo "... src/common.o"
	@echo "... src/common.i"
	@echo "... src/common.s"
	@echo "... src/conversion.o"
	@echo "... src/conversion.i"
	@echo "... src/conversion.s"
	@echo "... src/domain.o"
	@echo "... src/domain.i"
	@echo "... src/domain.s"
	@echo "... src/eventtrigger.o"
	@echo "... src/eventtrigger.i"
	@echo "... src/eventtrigger.s"
	@echo "... src/extension.o"
	@echo "... src/extension.i"
	@echo "... src/extension.s"
	@echo "... src/fdw.o"
	@echo "... src/fdw.i"
	@echo "... src/fdw.s"
	@echo "... src/function.o"
	@echo "... src/function.i"
	@echo "... src/function.s"
	@echo "... src/index.o"
	@echo "... src/index.i"
	@echo "... src/index.s"
	@echo "... src/language.o"
	@echo "... src/language.i"
	@echo "... src/language.s"
	@echo "... src/matview.o"
	@echo "... src/matview.i"
	@echo "... src/matview.s"
	@echo "... src/operator.o"
	@echo "... src/operator.i"
	@echo "... src/operator.s"
	@echo "... src/policy.o"
	@echo "... src/policy.i"
	@echo "... src/policy.s"
	@echo "... src/privileges.o"
	@echo "... src/privileges.i"
	@echo "... src/privileges.s"
	@echo "... src/publication.o"
	@echo "... src/publication.i"
	@echo "... src/publication.s"
	@echo "... src/quarrel.o"
	@echo "... src/quarrel.i"
	@echo "... src/quarrel.s"
	@echo "... src/rule.o"
	@echo "... src/rule.i"
	@echo "... src/rule.s"
	@echo "... src/schema.o"
	@echo "... src/schema.i"
	@echo "... src/schema.s"
	@echo "... src/sequence.o"
	@echo "... src/sequence.i"
	@echo "... src/sequence.s"
	@echo "... src/server.o"
	@echo "... src/server.i"
	@echo "... src/server.s"
	@echo "... src/statistics.o"
	@echo "... src/statistics.i"
	@echo "... src/statistics.s"
	@echo "... src/subscription.o"
	@echo "... src/subscription.i"
	@echo "... src/subscription.s"
	@echo "... src/table.o"
	@echo "... src/table.i"
	@echo "... src/table.s"
	@echo "... src/textsearch.o"
	@echo "... src/textsearch.i"
	@echo "... src/textsearch.s"
	@echo "... src/transform.o"
	@echo "... src/transform.i"
	@echo "... src/transform.s"
	@echo "... src/trigger.o"
	@echo "... src/trigger.i"
	@echo "... src/trigger.s"
	@echo "... src/type.o"
	@echo "... src/type.i"
	@echo "... src/type.s"
	@echo "... src/usermapping.o"
	@echo "... src/usermapping.i"
	@echo "... src/usermapping.s"
	@echo "... src/view.o"
	@echo "... src/view.i"
	@echo "... src/view.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

