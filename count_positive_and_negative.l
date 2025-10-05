%{

    int positives = 0, negatives = 0;

%}

%%

[a-zA-Z]        {}
[0-9]*          {positives++;}
-[0-9]*         {negatives++;}
end             {printf("No.of positives : %d\nNo.of negatives : %d\n", positives,negatives);exit(0);}

%%

int main() {
    printf("Enter the string containing numbers : ");
    yylex();
}

int yywrap() {
    return 1;
}