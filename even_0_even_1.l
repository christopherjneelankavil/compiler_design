%{
%}

%s q0 q1 q2 q3 qd

%%

<q0>0               BEGIN q3;
<q0>1               BEGIN q1;
<q0>[^01\n]         BEGIN qd;
<q0>\n              {printf("Accepted\n"); exit(0);}

<q1>0               BEGIN q2;
<q1>1               BEGIN q0;
<q1>[^01\n]         BEGIN qd;
<q1>\n              {printf("Not Accepted\n"); exit(0);}

<q2>0               BEGIN q1;
<q2>1               BEGIN q3;
<q2>[^01\n]         BEGIN qd;
<q2>\n              {printf("Not Accepted\n"); exit(0);}

<q3>0               BEGIN q0;
<q3>1               BEGIN q2;
<q3>[^01\n]         BEGIN qd;
<q3>\n              {printf("Not Accepted\n"); exit(0);}

<qd>[^01\n]         BEGIN qd;
<qd>\n              {printf("Not Accepted\n"); exit(0);}

%%

int main() {
    printf("Enter the expression : ");
    BEGIN q0;
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

