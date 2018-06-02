%{
#include "a.tab.h"

int site=0;

%}

%%
\n							 { return(0); /* EOF */ }
[\t ]+						 { site+=yyleng; /* do nothing */ }
[1-9]|[1-9][0-9]+			 { site+=yyleng; yylval.ival = atoi(yytext); return(NUM); }
"*"|"^"|"+"|"-" 		 	 { site+=yyleng; yylval.loc = site; return(yytext[0]); }
"("|")"|"["|"]"|"T"|","	  	 { site+=yyleng; return(yytext[0]); }
.							 { return(yytext[0]); }
%%	
