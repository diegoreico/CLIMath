cmake_minimum_required(VERSION 3.5)
project(CLIMath)

execute_process(COMMAND bison -d mfcalc.y
				COMMAND flex --header-file=lex.yy.h lexicalAnalyzer.l)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}  -std=c11 ")

set(SOURCE_FILES errors.c errors.h lex.yy.c lex.yy.h main.c mfcalc.tab.c mfcalc.tab.h preload.c preload.h SymbolTable.c SymbolTable.h)
add_executable(CLIMath ${SOURCE_FILES})
target_link_libraries(CLIMath m)
