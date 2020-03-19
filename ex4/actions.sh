#!/bin/sh

lex ch1-05.l
yacc -d -v ch1-05.y
cc -c lex.yy.c y.tab.c
cc -o prog lex.yy.o y.tab.o -ll
