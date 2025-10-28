#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    char intermediateCode[10][30], string[30], operators[10];

    printf("Enter the intermediate code (should end with exit) : ");
    int i = 0;

    do{
        scanf("%s", intermediateCode[i]);
    }while(strcmp(intermediateCode[i++], "exit") != 0);

    printf("\n************************************************************");
    printf("\n*                                                          *");
    printf("\n*                   TARGET CODE GENERATION                 *");
    printf("\n*                                                          *");
    printf("\n************************************************************\n");

    i = 0;
    do{
        if(strcmp(intermediateCode[i], "exit") == 0) break;
        strcpy(string, intermediateCode[i]);

        switch(string[3]){
            case '+' : strcpy(operators, "ADD"); break;
            case '-' : strcpy(operators, "SUB"); break;
            case '*' : strcpy(operators, "MUL"); break;
            case '/' : strcpy(operators, "DIV"); break;
            default  : printf("Invalid operator\n"); exit(0);
        }

        printf("\nMOV %c, R%d", string[2], i);
        printf("\n%s %c, R%d", operators, string[4], i);
        printf("\nMOV R%d, %c", i, string[0]);

    }while(strcmp(intermediateCode[i++], "exit") != 0);
    printf("\n");

    return EXIT_SUCCESS;
}