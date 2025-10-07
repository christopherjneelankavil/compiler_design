%{
    #include <stdio.h>
    int valid = 1;    
%}

%token letter digit

%% 

start : letter s
s : letter s | digit s |;

%%

int main() {
    printf("Enter a string to be evaluated: "); 
    yyparse();

    if(valid) {
        printf("The string is a valid identifier\n");
    }
    return 0;
}

int yyerror() {
    valid = 0;
    printf("Cannot be used as a variable name\n");
}