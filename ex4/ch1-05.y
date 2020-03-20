%{
/*
 * A lexer for the basic grammar to use for recognizing english sentences.
 */
#include <stdio.h>
%}

%token NOUN VERB 

%error-verbose

%%
sentence: NOUN VERB NOUN { printf("Sentence is valid.\n"); }
	;
%%

extern FILE *yyin;

main()
{
	yyin = stdin;		/* Otherwise crashes */
	while(!feof(yyin)) {
		yyparse();		/* Parser calls yylex(); yylex() returns tokens 
						   one by one
						   Lexer and parser need argeements about token codes.
						   Agreeement is written in header file
						   yyparse() parses single sentence
						   0 returned by yylex means end of sentence
						*/
	}
}

yyerror(char *s)
{
    fprintf(stderr, "%s\n", s);
}
