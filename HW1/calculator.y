%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int yylex(void);
void yyerror(char *);
%}

%token INTEGER
%token ENTER
%token POW
%left '+' '-'
%left '*' '/'
%right POW
%right '(' ')'

%%
program:
    program statement ENTER {printf("Cevap : %d\nişlem girin : ", $2);}
    |
    ;
statement:
    expr { $$ = $1; }
    ;

expr:
    INTEGER { $$ = $1; }
    | '(' expr ')' { $$ = $2; } /* Parantezlere öncelik veriyoruz */
    | expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr POW expr { $$ = pow($1, $3); }
    | expr '/' expr {
        if ($3 == 0) {
            yyerror("Hata: Sıfıra bölme!");
            exit(EXIT_FAILURE);
        } else {
            $$ = $1 / $3;
        }
    }
    ;

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    printf("işlem girin: ");
    yyparse();
    return 0;
}