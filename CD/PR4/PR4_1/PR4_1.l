%{

#include <stdio.h>
int int_count = 0;
int float_count = 0;
int exp_count = 0;

%}

%%

[+-]?[0-9]+                   { int_count++; }
[+-]?[0-9]*\.[0-9]+([0-9]+)? { float_count++; }
[+-]?[0-9]+(\.[0-9]*)?[eE][+-]?[0-9]+ { exp_count++; }

%%

int yywrap() {
   // Return 1 to indicate the end of input
   return 1;
}

int main(int argc, char* argv[]) {
    if (argc != 2) {
        printf("Usage: %s <test.txt>\n", argv[0]);
        return 1;
    }

    FILE* file = fopen(argv[1], "r");
    if (file == NULL) {
        printf("Error opening file: %s\n", argv[1]);
        return 1;
    }

    yyin = file;
    yylex();

    printf("Integer count: %d\n", int_count);
    printf("Float count: %d\n", float_count);
    printf("Exponential count: %d\n", exp_count);

    fclose(file);
    return 0;
}
