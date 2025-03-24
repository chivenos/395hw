%{
#include "y.tab.h"
#include <stdlib.h>
void yyerror(char *);
%}

%%
[0-9]+ {yylval=atoi(yytext);return INTEGER;}
"-"[0-9]+ {yylval=atoi(yytext);return INTEGER;}
[-+*/] {return *yytext;}
 "**"        {return POW;}
" "    {}
.      { return yytext[0]; }
\n     {return ENTER;}
%%
int yywrap(void) {
return 1;
}