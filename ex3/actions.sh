#!/bin/sh

lex ch1-04.l
cc lex.yy.c -o prog -ll
