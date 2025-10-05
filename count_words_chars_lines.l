%{
    
    int lines = 1, words = 0, characters = 0;

%}

%%

[a-zA-Z]        {characters++;}
" "             {words++;}
"\n"            {words++;lines++;}
end             {printf("Total no.of characters : %d\nTotal no.of words : %d\nTotal no.of lines : %d\n",characters,words,lines);}

%%

int main() {
    printf("Enter a string (should end with 'end') : ");
    yylex();
}

int yywrap() {
    return 1;
}
