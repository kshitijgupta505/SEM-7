%{
#include <stdio.h>
#include <string.h>

int keyword_count = 0;
int identifier_count = 0;
int operator_count = 0;
int punctuation_count = 0;

%}

%%

"scanf" | "printf"             { keyword_count++; }
[a-zA-Z_][a-zA-Z0-9_]*         { identifier_count++; }
"(" | ")" | "," | ";"         { punctuation_count++; }
"=" | "==" | "!=" | "<" | ">" | "<=" | ">=" | "+" | "-" | "*" | "/" | "%" { operator_count++; }
[ \t\n]+                       ;  // Ignore whitespace

%%

int yywrap() {
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

    printf("Keyword count: %d\n", keyword_count);
    printf("Identifier count: %d\n", identifier_count);
    printf("Operator count: %d\n", operator_count);
    printf("Punctuation count: %d\n", punctuation_count);

    fclose(file);
    return 0;
}
