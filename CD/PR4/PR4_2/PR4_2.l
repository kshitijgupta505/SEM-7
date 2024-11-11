%{
#include <stdio.h>

int single_line_comment_count = 0;
int multi_line_comment_count = 0;

%}

%%

"//".*                             { single_line_comment_count++; }
"/*"([^*]|\*+[^/])*\*+"/"          { multi_line_comment_count++; }

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

    printf("Single-line comment count: %d\n", single_line_comment_count);
    printf("Multi-line comment count: %d\n", multi_line_comment_count);

    fclose(file);
    return 0;
}
