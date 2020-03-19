#!/bin/sh
lex ch1-03.l
cc lex.yy.c -o prog -ll
