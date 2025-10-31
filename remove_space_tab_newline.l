%{
    #include<stdio.h>
    FILE *fp_out;
%}

%%

[ \t\r\n]+          {}
.                   {fprintf(fp_out, "%s", yytext);}

%%

int yywrap() {
    return 1;
}

int main() {
    FILE *fp = fopen("files/input.txt", "r");
    fp_out = fopen("files/output.txt","w");
    if(!fp || !fp_out) {
        printf("File not found\n");
    } 

    yyin = fp;
    yylex();
    return 0;
}