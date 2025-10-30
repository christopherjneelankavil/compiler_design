%{
    #include<stdio.h>
    int comment = 0;
%}

IDENTIFIER                 [a-zA-Z_][a-zA-Z_0-9]*
KEYWORD                    int|float|double|char|if|else|elseif|for|while|do|goto

%%

#.*                         {printf("%s is a preprocessor directive\n", yytext); }
{KEYWORD}                   {printf("%s is a keyword\n", yytext); }
"/*"                        {comment = 1; printf("%s is a comment\n", yytext); }
"*/"                        {comment = 0; printf("comment ends\n"); }
{IDENTIFIER}"("             {if(!comment) printf("%s) is a function\n", yytext); }
"{"                         {if(!comment) printf("Block begins\n"); }
"}"                         {if(!comment) printf("Block ends\n"); }
[0-9]+                      {if(!comment) printf("%s is a digit\n", yytext); }
{IDENTIFIER}(\[[0-9]+\])?   {if(!comment) printf("%s is an IDENTIFIER\n", yytext); }
\"([^\"\n]|\\.)*\"          {if(!comment) printf("%s is a string\n", yytext); }
"<"|"<="|"=="|">"|">="      {if(!comment) printf("%s is a relational operator\n", yytext); }
"="                         {if(!comment) printf("%s is an assignment operator\n", yytext); }
.|\n                        {}

%%

int yywrap() {
    return 1;
}

int main(){
    FILE *fp = fopen("files/code.txt","r");
    yyin = fp;
    yylex();
    return 0;
}
