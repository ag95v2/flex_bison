#!/bin/sh
lex ch1-02.l
cc lex.yy.c -o first -ll
