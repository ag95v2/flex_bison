
all:
	lex tok.l  
	yacc -d gr.y  
	gcc -g -Wall -I . lex.yy.c y.tab.c -o prog

