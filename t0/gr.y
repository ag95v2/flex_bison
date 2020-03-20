
%{ 
   /* Definition section */
   #include <stdio.h> 
   #include <stdlib.h> 
%} 

%token A B NL

%% 
stmt: A A B 	{ printf("valid string\n"); } //exit(0); 
	; 

%% 

int yyerror(char *msg) 
{ 
	printf("invalid string\n"); 
	//exit(0); 
} 

main() 
{ 
	while (!feof(stdin))
	{
		printf("enter the string\n"); 
		yyparse(); 
	}
} 
