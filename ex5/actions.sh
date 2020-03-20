#!/bin/sh

lex ch1-06.l
yacc -d -v ch1-06.y
cc -c lex.yy.c y.tab.c
cc -o prog lex.yy.o y.tab.o -ll
