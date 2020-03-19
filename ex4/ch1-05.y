%{
/*
 * A lexer for the basic grammar to use for recognizing english sentences.
 */
#include <stdio.h>
%}

%token NOUN PRONOUN VERB ADVERB ADJECTIVE PREPOSITION CONJUNCTION

%%
sentence: subject VERB object	{ printf("Sentence is valid.\n"); }
	;

subject:	NOUN				{printf("Subject recognized\n"); }
	|	PRONOUN
	;

object:		NOUN				{printf("Object recognized\n"); }
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
