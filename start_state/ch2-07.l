%s MAGIC

%%
<MAGIC>.+	{  printf("Magic:"); ECHO; } /*BEGIN 0;  To restore state*/
magic		BEGIN MAGIC;
.+		ECHO;
%%

main()
{
	yylex();
}
