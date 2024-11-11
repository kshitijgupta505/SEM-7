%{
#include <stdio.h>
#include <math.h>    // For computing the exponential values
int exponent_count = 0;
%}

%%

[0-9]+(\^[0-9]+)  {
                    exponent_count++;
                    int base, exponent;
                    sscanf(yytext, "%d^%d", &base, &exponent);
                    double result = pow(base, exponent);
                    printf("Exponential value found: %s = %.2f\n", yytext, result);
                }

.|\n    ; // Match any other characters and ignore

%%
int yywrap() {
    return 1;
}
int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            printf("Error: Cannot open file %s\n", argv[1]);
            return 1;
        }
        yyin = file;
        yylex();
        fclose(file);
        printf("Total exponential values found: %d\n", exponent_count);
    } else {
        printf("Usage: %s <filename>\n", argv[0]);
    }
    return 0;
}
