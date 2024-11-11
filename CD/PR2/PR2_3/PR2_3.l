%{
#include <stdio.h>
%}
%option noyywrap
%%
"b"* {
   printf("String matched: a*b+\n");
   printf("String matched: b*\n");
}
"abb" {
   printf("String matched: abb\n");
}
("a")*("b")+ {
   printf("String matched: a*b+\n");
}
"a" {
   printf("String matched: a\n");
}
\n {
   // Ignore empty lines
}
. {
   printf("Invalid input\n");
}
%%
int main(int argc, char* argv[]) {
   if (argc != 2) {
       printf("Usage: %s <input_string>\n", argv[0]);
       return 1;
   }
   yy_scan_string(argv[1]);
   yylex();
   if (argv[1][0] == '\0') {
       printf("String matched: b*\n");
   }
   return 0;
}
