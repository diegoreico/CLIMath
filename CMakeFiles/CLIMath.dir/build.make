# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/entakitos/repositorios/CLIMath

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/entakitos/repositorios/CLIMath

# Include any dependencies generated for this target.
include CMakeFiles/CLIMath.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/CLIMath.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/CLIMath.dir/flags.make

CMakeFiles/CLIMath.dir/errors.c.o: CMakeFiles/CLIMath.dir/flags.make
CMakeFiles/CLIMath.dir/errors.c.o: errors.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/entakitos/repositorios/CLIMath/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/CLIMath.dir/errors.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/CLIMath.dir/errors.c.o   -c /home/entakitos/repositorios/CLIMath/errors.c

CMakeFiles/CLIMath.dir/errors.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/CLIMath.dir/errors.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/entakitos/repositorios/CLIMath/errors.c > CMakeFiles/CLIMath.dir/errors.c.i

CMakeFiles/CLIMath.dir/errors.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/CLIMath.dir/errors.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/entakitos/repositorios/CLIMath/errors.c -o CMakeFiles/CLIMath.dir/errors.c.s

CMakeFiles/CLIMath.dir/errors.c.o.requires:

.PHONY : CMakeFiles/CLIMath.dir/errors.c.o.requires

CMakeFiles/CLIMath.dir/errors.c.o.provides: CMakeFiles/CLIMath.dir/errors.c.o.requires
	$(MAKE) -f CMakeFiles/CLIMath.dir/build.make CMakeFiles/CLIMath.dir/errors.c.o.provides.build
.PHONY : CMakeFiles/CLIMath.dir/errors.c.o.provides

CMakeFiles/CLIMath.dir/errors.c.o.provides.build: CMakeFiles/CLIMath.dir/errors.c.o


CMakeFiles/CLIMath.dir/lex.yy.c.o: CMakeFiles/CLIMath.dir/flags.make
CMakeFiles/CLIMath.dir/lex.yy.c.o: lex.yy.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/entakitos/repositorios/CLIMath/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/CLIMath.dir/lex.yy.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/CLIMath.dir/lex.yy.c.o   -c /home/entakitos/repositorios/CLIMath/lex.yy.c

CMakeFiles/CLIMath.dir/lex.yy.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/CLIMath.dir/lex.yy.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/entakitos/repositorios/CLIMath/lex.yy.c > CMakeFiles/CLIMath.dir/lex.yy.c.i

CMakeFiles/CLIMath.dir/lex.yy.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/CLIMath.dir/lex.yy.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/entakitos/repositorios/CLIMath/lex.yy.c -o CMakeFiles/CLIMath.dir/lex.yy.c.s

CMakeFiles/CLIMath.dir/lex.yy.c.o.requires:

.PHONY : CMakeFiles/CLIMath.dir/lex.yy.c.o.requires

CMakeFiles/CLIMath.dir/lex.yy.c.o.provides: CMakeFiles/CLIMath.dir/lex.yy.c.o.requires
	$(MAKE) -f CMakeFiles/CLIMath.dir/build.make CMakeFiles/CLIMath.dir/lex.yy.c.o.provides.build
.PHONY : CMakeFiles/CLIMath.dir/lex.yy.c.o.provides

CMakeFiles/CLIMath.dir/lex.yy.c.o.provides.build: CMakeFiles/CLIMath.dir/lex.yy.c.o


CMakeFiles/CLIMath.dir/main.c.o: CMakeFiles/CLIMath.dir/flags.make
CMakeFiles/CLIMath.dir/main.c.o: main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/entakitos/repositorios/CLIMath/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/CLIMath.dir/main.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/CLIMath.dir/main.c.o   -c /home/entakitos/repositorios/CLIMath/main.c

CMakeFiles/CLIMath.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/CLIMath.dir/main.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/entakitos/repositorios/CLIMath/main.c > CMakeFiles/CLIMath.dir/main.c.i

CMakeFiles/CLIMath.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/CLIMath.dir/main.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/entakitos/repositorios/CLIMath/main.c -o CMakeFiles/CLIMath.dir/main.c.s

CMakeFiles/CLIMath.dir/main.c.o.requires:

.PHONY : CMakeFiles/CLIMath.dir/main.c.o.requires

CMakeFiles/CLIMath.dir/main.c.o.provides: CMakeFiles/CLIMath.dir/main.c.o.requires
	$(MAKE) -f CMakeFiles/CLIMath.dir/build.make CMakeFiles/CLIMath.dir/main.c.o.provides.build
.PHONY : CMakeFiles/CLIMath.dir/main.c.o.provides

CMakeFiles/CLIMath.dir/main.c.o.provides.build: CMakeFiles/CLIMath.dir/main.c.o


CMakeFiles/CLIMath.dir/mfcalc.tab.c.o: CMakeFiles/CLIMath.dir/flags.make
CMakeFiles/CLIMath.dir/mfcalc.tab.c.o: mfcalc.tab.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/entakitos/repositorios/CLIMath/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/CLIMath.dir/mfcalc.tab.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/CLIMath.dir/mfcalc.tab.c.o   -c /home/entakitos/repositorios/CLIMath/mfcalc.tab.c

CMakeFiles/CLIMath.dir/mfcalc.tab.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/CLIMath.dir/mfcalc.tab.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/entakitos/repositorios/CLIMath/mfcalc.tab.c > CMakeFiles/CLIMath.dir/mfcalc.tab.c.i

CMakeFiles/CLIMath.dir/mfcalc.tab.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/CLIMath.dir/mfcalc.tab.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/entakitos/repositorios/CLIMath/mfcalc.tab.c -o CMakeFiles/CLIMath.dir/mfcalc.tab.c.s

CMakeFiles/CLIMath.dir/mfcalc.tab.c.o.requires:

.PHONY : CMakeFiles/CLIMath.dir/mfcalc.tab.c.o.requires

CMakeFiles/CLIMath.dir/mfcalc.tab.c.o.provides: CMakeFiles/CLIMath.dir/mfcalc.tab.c.o.requires
	$(MAKE) -f CMakeFiles/CLIMath.dir/build.make CMakeFiles/CLIMath.dir/mfcalc.tab.c.o.provides.build
.PHONY : CMakeFiles/CLIMath.dir/mfcalc.tab.c.o.provides

CMakeFiles/CLIMath.dir/mfcalc.tab.c.o.provides.build: CMakeFiles/CLIMath.dir/mfcalc.tab.c.o


CMakeFiles/CLIMath.dir/preload.c.o: CMakeFiles/CLIMath.dir/flags.make
CMakeFiles/CLIMath.dir/preload.c.o: preload.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/entakitos/repositorios/CLIMath/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/CLIMath.dir/preload.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/CLIMath.dir/preload.c.o   -c /home/entakitos/repositorios/CLIMath/preload.c

CMakeFiles/CLIMath.dir/preload.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/CLIMath.dir/preload.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/entakitos/repositorios/CLIMath/preload.c > CMakeFiles/CLIMath.dir/preload.c.i

CMakeFiles/CLIMath.dir/preload.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/CLIMath.dir/preload.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/entakitos/repositorios/CLIMath/preload.c -o CMakeFiles/CLIMath.dir/preload.c.s

CMakeFiles/CLIMath.dir/preload.c.o.requires:

.PHONY : CMakeFiles/CLIMath.dir/preload.c.o.requires

CMakeFiles/CLIMath.dir/preload.c.o.provides: CMakeFiles/CLIMath.dir/preload.c.o.requires
	$(MAKE) -f CMakeFiles/CLIMath.dir/build.make CMakeFiles/CLIMath.dir/preload.c.o.provides.build
.PHONY : CMakeFiles/CLIMath.dir/preload.c.o.provides

CMakeFiles/CLIMath.dir/preload.c.o.provides.build: CMakeFiles/CLIMath.dir/preload.c.o


CMakeFiles/CLIMath.dir/SymbolTable.c.o: CMakeFiles/CLIMath.dir/flags.make
CMakeFiles/CLIMath.dir/SymbolTable.c.o: SymbolTable.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/entakitos/repositorios/CLIMath/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/CLIMath.dir/SymbolTable.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/CLIMath.dir/SymbolTable.c.o   -c /home/entakitos/repositorios/CLIMath/SymbolTable.c

CMakeFiles/CLIMath.dir/SymbolTable.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/CLIMath.dir/SymbolTable.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/entakitos/repositorios/CLIMath/SymbolTable.c > CMakeFiles/CLIMath.dir/SymbolTable.c.i

CMakeFiles/CLIMath.dir/SymbolTable.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/CLIMath.dir/SymbolTable.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/entakitos/repositorios/CLIMath/SymbolTable.c -o CMakeFiles/CLIMath.dir/SymbolTable.c.s

CMakeFiles/CLIMath.dir/SymbolTable.c.o.requires:

.PHONY : CMakeFiles/CLIMath.dir/SymbolTable.c.o.requires

CMakeFiles/CLIMath.dir/SymbolTable.c.o.provides: CMakeFiles/CLIMath.dir/SymbolTable.c.o.requires
	$(MAKE) -f CMakeFiles/CLIMath.dir/build.make CMakeFiles/CLIMath.dir/SymbolTable.c.o.provides.build
.PHONY : CMakeFiles/CLIMath.dir/SymbolTable.c.o.provides

CMakeFiles/CLIMath.dir/SymbolTable.c.o.provides.build: CMakeFiles/CLIMath.dir/SymbolTable.c.o


# Object files for target CLIMath
CLIMath_OBJECTS = \
"CMakeFiles/CLIMath.dir/errors.c.o" \
"CMakeFiles/CLIMath.dir/lex.yy.c.o" \
"CMakeFiles/CLIMath.dir/main.c.o" \
"CMakeFiles/CLIMath.dir/mfcalc.tab.c.o" \
"CMakeFiles/CLIMath.dir/preload.c.o" \
"CMakeFiles/CLIMath.dir/SymbolTable.c.o"

# External object files for target CLIMath
CLIMath_EXTERNAL_OBJECTS =

CLIMath: CMakeFiles/CLIMath.dir/errors.c.o
CLIMath: CMakeFiles/CLIMath.dir/lex.yy.c.o
CLIMath: CMakeFiles/CLIMath.dir/main.c.o
CLIMath: CMakeFiles/CLIMath.dir/mfcalc.tab.c.o
CLIMath: CMakeFiles/CLIMath.dir/preload.c.o
CLIMath: CMakeFiles/CLIMath.dir/SymbolTable.c.o
CLIMath: CMakeFiles/CLIMath.dir/build.make
CLIMath: CMakeFiles/CLIMath.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/entakitos/repositorios/CLIMath/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking C executable CLIMath"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/CLIMath.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/CLIMath.dir/build: CLIMath

.PHONY : CMakeFiles/CLIMath.dir/build

CMakeFiles/CLIMath.dir/requires: CMakeFiles/CLIMath.dir/errors.c.o.requires
CMakeFiles/CLIMath.dir/requires: CMakeFiles/CLIMath.dir/lex.yy.c.o.requires
CMakeFiles/CLIMath.dir/requires: CMakeFiles/CLIMath.dir/main.c.o.requires
CMakeFiles/CLIMath.dir/requires: CMakeFiles/CLIMath.dir/mfcalc.tab.c.o.requires
CMakeFiles/CLIMath.dir/requires: CMakeFiles/CLIMath.dir/preload.c.o.requires
CMakeFiles/CLIMath.dir/requires: CMakeFiles/CLIMath.dir/SymbolTable.c.o.requires

.PHONY : CMakeFiles/CLIMath.dir/requires

CMakeFiles/CLIMath.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/CLIMath.dir/cmake_clean.cmake
.PHONY : CMakeFiles/CLIMath.dir/clean

CMakeFiles/CLIMath.dir/depend:
	cd /home/entakitos/repositorios/CLIMath && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/entakitos/repositorios/CLIMath /home/entakitos/repositorios/CLIMath /home/entakitos/repositorios/CLIMath /home/entakitos/repositorios/CLIMath /home/entakitos/repositorios/CLIMath/CMakeFiles/CLIMath.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/CLIMath.dir/depend
