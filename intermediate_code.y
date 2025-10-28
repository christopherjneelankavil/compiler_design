%{
    #include <stdio.h>
    #include <stdlib.h>
    char p = 'A';
%}

%union {char dval;}
%token NUM
%left  '+' '-'
%left  '*' '/'
%type  <dval> S
%type  <dval> E

%%

S: E        {printf("X = %c\n",$$);}
 ;

E: NUM      {}
 | E '+' E  {printf("%c = %c + %c\n", p, $1, $3); $$ = p; p++; }
 | E '-' E  {printf("%c = %c - %c\n", p, $1, $3); $$ = p; p++; }
 | E '*' E  {printf("%c = %c * %c\n", p, $1, $3); $$ = p; p++; }
 | E '/' E  {printf("%c = %c / %c\n", p, $1, $3); $$ = p; p++; }
 ;

%%

int yyerror() {
    printf("The expression is invalid");
    exit(0);
}

int main() {
    printf("Enter the expression : ");
    yyparse();
    printf("\nThe expression is valid");
    return 0;
}

