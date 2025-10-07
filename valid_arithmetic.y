%{
    #include <stdio.h>
    int valid = 1;
%}

%token id num op

%%

start : id '=' s';'
s     : id x
      | num x
      | '-'num x
      | '('s')'x;

x     : op s
      | '-'s
      |;

%%

int main() {
    printf("Enter the expression : ");
    yyparse();
    if(valid) {
        printf("Expression is valid\n");
    }
    return 0;
}

int yyerror (){
    valid = 0;
    printf("Expression is invalid\n");
    return 0;
}
