%{
    int comment = 0;
%}

IDENTIFIER    [a-zA-Z_][a-zA-Z0-9_]*
KEYWORD     int|float|char|double|while|for|struct|typedef|do|if|break|continue|void|switch|else|return|goto

%%

#.*                                 { printf("\n%s is a preprocessor directive", yytext); }
{KEYWORD}                           { printf("\n%s is a keyword", yytext); }
"/*"                        		{ comment = 1; printf("\n%s is a comment", yytext); }
"*/"                        		{ comment = 0; printf("\nEnd of comment"); }
{IDENTIFIER}"("                     { if(!comment) printf("\n%s is a function", yytext); }
"{"                         		{ if(!comment) printf("\nblock begins"); }
"}"                         		{ if(!comment) printf("\nblock ends"); }
{IDENTIFIER}(\[[0-9]+\])?           { if(!comment) printf("\n%s is an identifier", yytext); }
\"([^\"\n]|\\.)*\"           		{ if(!comment) printf("\n%s is a string", yytext); }
[0-9]+                     		    { if(!comment) printf("\n%s is a number", yytext); }
"="                         		{ if(!comment) printf("\n%s is an assignment operator", yytext); }
">="|"<="|"=="|"<"|">"              { if(!comment) printf("\n%s is a relational operator", yytext); }
.|\n                                {}

             
%%

int main(int argc, char **argv){

    FILE *fp; 
    fp = fopen("files/code.txt", "r");
    
    if(!fp){
        printf("File not found\n");
        exit(0);
    }
    
    yyin = fp;
    yylex();
    printf("\n");
    
    return 0;
}

int yywrap(){
        return 0;
}
        
