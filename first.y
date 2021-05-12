%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>
#include "h1.h"

double y;
double t,u,h;
%}

%union{
    int ival;
    float fval;
    double dval;
    char* cval;
    struct ast *tree;
}

%token LF
%token <dval> NUMBER
%token PLUS MINUS DIV MULTI
%token <cval> IDENTIFIER
%type <dval> list expr input

%left '+' '-'
%left '*' '/'
%left '!'

%%
input : /* empty */             
        | input list
        ;

list    : expr LF               {
                                    y = $1;
                                    printf("r>%g\n",y);
                                }

expr    : NUMBER
        /*| IDENTIFIER*/                
        | expr '+' expr         {$$ = $1 + $3;}
        | expr '-' expr         {$$ = $1 - $3;}
        | expr '*' expr         {$$ = $1 * $3;}
        | expr '/' expr         {$$ = $1 / $3;}
        | expr '!'              {
                                    t = $1;
                                    factorial(&t);
                                    $$ = t;
                                }
        | expr '=' expr         {printf("a");}
        ;


%%

int main(void){
    //yyparse();
    if(yyparse()){
        printf("Err:%s",stderr);
        return 1;
    }
}


