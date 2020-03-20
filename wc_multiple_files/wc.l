%{
/*
 * ch2-03.l
 *
 * The word counter example for multiple files
 *
 */

unsigned long charCount = 0, wordCount = 0, lineCount = 0;

#undef yywrap	/* sometimes a macro by default */

%}

word [^ \t\n]+
eol  \n
%%
{word}	{ wordCount++; charCount += yyleng; }
{eol}	{ charCount++; lineCount++; }
.	charCount++;
%%

char **files;
unsigned long totalCC = 0;
unsigned long totalWC = 0;
unsigned long totalLC = 0;

int	last_file = 0;

void	update_count(void)
{
	totalCC += charCount;
	totalWC += wordCount;
	totalLC += lineCount;
}


int		main(int argc, char **argv)
{
	FILE	*file;
	int		i;

	if (argc == 1)
	{
		printf("Single arg\n");
		last_file = 1;
		yylex();
		update_count();
		printf("%8lu %8lu %8lu total\n",totalLC, totalWC, totalCC);
		return (0);
	}

	i = 0;
	while (++i < argc)
	{
		if (!(file = fopen(argv[i], "r")))
		{
			printf("%s %s\n", "Error, could not open file:", argv[i]);
			exit(1);
		}

		if (i == argc - 1)
			last_file = 1;
		yylex();
		update_count();
		printf("%8lu %8lu %8lu %s\n", lineCount, wordCount, charCount, argv[i]);
	}

	if (argc > 2)
		printf("%8lu %8lu %8lu total\n",totalLC, totalWC, totalCC);
	return (0);
}


int		yywrap()
{
	return (!last_file ? 0 : 1);	/* 0 means there's more input */
}
