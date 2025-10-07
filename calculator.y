%{
    #include <stdio.h>
    int flag = 0;
%}

%token NUMBER
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%

ArithmeticExpression : E {
    printf("Result : %d", $$);
    return 0;
}
;

E : E '+' E {$$ = $1 + $3;}
  | E '-' E {$$ = $1 - $3;}
  | E '*' E {$$ = $1 * $3;}
  | E '/' E {$$ = $1 / $3;}
  | E '%' E {$$ = $1 % $3;}
  | '('E')' {$$ = $2;}
  | NUMBER  {$$ = $1;}
;

%%

int main() {
    printf("Enter the arithmetic expression : ");
    yyparse();
    if(!flag) {
      printf("VALID\n");
    }
    return 0;
}

int yyerror() {
    flag = 1;
    printf("INVALID\n");
    return 0;
}



