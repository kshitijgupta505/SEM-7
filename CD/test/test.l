%{
#include <stdio.h>
int valid = 0;
%}

%%

[+-]?[0-9]+ { 
    printf("Integer: %s\n", yytext);
    valid++;
}

[+-]?[0-9]*\.[0-9]+ { 
    printf("Float: %s\n", yytext);
    valid++;
}

[+-]?[0-9]*\.[0-9]+([eE][+-]?[0-9]+)? { 
    printf("Exponential: %s\n", yytext); 
    valid++;
}

int|char|float|void|main|if|else|for|scanf|printf { 
    printf("Keyword: %s\n", yytext); 
    valid++;
}

"/*"([^*]|\*+[^*/])*\*+"/" { 
    // Ignoring comments
}

"//".* { 
    // Ignoring single-line comments
}

[a-zA-Z_][a-zA-Z0-9_]* { 
    printf("Identifier: %s\n", yytext); 
    valid++;
}

\"([^\\\"]|\\.)*\" { 
    printf("String: %s\n", yytext);
    valid++;
}

[\(\)\[\]\{\}\+\-\*\/\=\>\<\!\&\|\%\^\;\,\.\?] {
    printf("Operator/Bracket: %s\n", yytext); 
    valid++;
}

\+\+|\-\-|\+=|-=|\*=|\/=|%=|\&=|\|=|\^=|\!=|\>=|\<=|\|\| { 
    printf("Operator: %s\n", yytext); 
    valid++;
}

\#.* { 
    printf("Preprocessor Directive: %s\n", yytext);
    valid++;
}

\'([^\\\']|\\.)*\' { 
    printf("Character: %s\n", yytext);
    valid++;
}

[ \t\n]+ { 
    // Ignoring whitespaces and newlines
}

. { 
    printf("Unrecognized Character: %s\n", yytext);
}

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Starting lexical analysis...\n");
    yyin = fopen("p5.c", "r");
    yylex();
    printf("Valid Tokens: %d\n", valid);
    return 0;
}
