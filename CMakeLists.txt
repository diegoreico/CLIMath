cmake_minimum_required(VERSION 3.5)
project(mfclalSeparado)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}  -std=c11 ")

set(SOURCE_FILES errors.c errors.h lex.yy.c lex.yy.h main.c mfcalc.tab.c mfcalc.tab.h preload.c preload.h SymbolTable.c SymbolTable.h)
add_executable(mfclalSeparado ${SOURCE_FILES})
target_link_libraries(mfclalSeparado m)