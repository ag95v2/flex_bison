%{ 
/* Definition section */
#include "y.tab.h" 

%} 
  
%% 

[aA]	{return A;}

[bB]	{return B;}

\n		{return 0;}

.		{return yytext[0];}


%% 

int yywrap()  
{  
	return 1;  
} 
