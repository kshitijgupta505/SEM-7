#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main() {
    char keywords[10][10] = {"auto", "break", "case", "char", "const", "continue", "default", "do","double", "else", "enum", "extern", "float", "for", "goto", "if","int", "long", "register", "return", "short", "signed", "sizeof", "static","struct", "switch", "typedef", "union","unsigned", "void", "volatile", "while"};

    char identifier[10];
    printf("Enter Identifier: ");
    scanf("%s", identifier);

    // Check if the identifier is a keyword
    for (int i = 0; i < 10; i++) {
        if (strcmp(keywords[i], identifier) == 0) {
            printf("\n%s is a Keyword.\n", identifier);
            return 0;
        }
    }

    // Check if the identifier is a valid identifier
    if ((isalpha(identifier[0]) || identifier[0] == '_')) {
        for (int i = 1; identifier[i] != '\0'; i++) {
            if (!isalnum(identifier[i]) && identifier[i] != '_') {
                printf("\n%s is Not a valid Identifier.\n", identifier);
                return 0;
            }
        }
        printf("\n%s is a valid Identifier.\n", identifier);
    } else {
        printf("\n%s is Not a valid Identifier.\n", identifier);
    }

    return 0;
}
