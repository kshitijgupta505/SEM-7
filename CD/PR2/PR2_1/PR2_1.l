%{
#include <stdio.h>

int word_count = 0;
int digit_count = 0;
%}

%%
[0-9]+      { digit_count += yyleng; }   // Count each digit
[ \t\n]+    { /* Ignore whitespace */ }
[a-zA-Z]+   { word_count++; }            // Count each word
.           { /* Ignore other characters */ }
%%

int main(int argc, char **argv)
{
    yylex();
    printf("Number of words: %d\n", word_count);
    printf("Number of digits: %d\n", digit_count);
    return 0;
}

int yywrap()
{
    return 1;
}
