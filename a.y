%{
#include <stdio.h>
#include <string.h>
int wrong=0;
void yyerror(const char *message);
void semerror(int site);
%}

%union {
int 	ival;
int 	loc;
struct def{
	int i;
	int j;
	} mat;
}
%type <mat> matrix
%token <ival> NUM
%token <loc> '+'
%token <loc> '*'
%token <loc> '-'
%left '+' '-'
%left '*'
%left '^'
%%
line	:	matrix					{if (wrong==0){ printf("Accepted");}}
		;
matrix	:	'[' NUM ',' NUM ']'		{$$.i = $2;$$.j = $4;}
		|	matrix '+' matrix		{
										if ($1.i==$3.i && $1.j==$3.j){
											$$.i = $1.i;
											$$.j = $1.j;
										}
										else {
											if (wrong==0){
												semerror($2);
												wrong++;
											}
										}
									}
		|	matrix '-' matrix		{
										if ($1.i==$3.i && $1.j==$3.j){
											$$.i = $1.i;
											$$.j = $1.j;
										}
										else {
											if (wrong==0){
												semerror($2);
												wrong++;
											}
										}
									}
		|	matrix '*' matrix		{
										if ($1.j==$3.i){
											$$.i = $1.i;
											$$.j = $3.j;
										}
										else {
											if (wrong==0){
												semerror($2);
												wrong++;
											}
										}
									}
		|	matrix '^' 'T'			{$$.i = $1.j; $$.j = $1.i;}
		| 	'(' matrix ')'			{$$.i = $2.i; $$.j = $2.j;}
		;

%%
void semerror(int site){
	printf("Semantic error on col %d\n", site);
}

void yyerror (const char *message)
{
    fprintf (stderr, "%s\n",message);
}

int main(int argc, char *argv[]) {
        yyparse();
        return(0);
}
