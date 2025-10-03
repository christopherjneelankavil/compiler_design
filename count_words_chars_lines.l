%{
    #include <stdio.h>
    int lines = 0;
    int characters = 0;
    int words = 0;
}%

%%

[a-zA-Z]    {characters++;}
" "         {words++;}
"\n"        {words++;lines++;}
end         {printf("No.of characters : %d\nNo.of words : %d\nNo.of lines : %d\n",characters,words,lines); return 0;}

%%

int main() {
    printf("Enter the string : ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}