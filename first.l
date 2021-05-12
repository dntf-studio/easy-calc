%{
#include "first.tab.h"
#include <string.h>
%}

none    [ \t]
float_  [0-9]+\.[0-9]+
int_    [0-9]+
icon    [=+\-\*/!]
text    [a-zA-z]+
other   .

%%
{none}+  
{int_}   {sscanf(yytext,"%lf",&yylval.dval); return(NUMBER);}
{float_} {sscanf(yytext,"%lf",&yylval.dval); return(NUMBER);}
{icon}   {return(yytext[0]);}
{text}   {yylval.cval = yytext; return(IDENTIFIER);}
\n       {return(LF);}
{other}  {printf("[error token:%s]",yytext);}

%%

/*int main(int argc,char** argv){
    if(argc > 1){
        yyin = fopen(argv[1], "r");
    }
    return yylex();
}*/
