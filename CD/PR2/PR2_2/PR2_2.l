%{
#include <stdio.h>
int charCount = 0;
int wordCount = 0;
int digitCount = 0;
int vowelCount = 0;
int consonantCount = 0;
int specialCharCount = 0;
int lineCount = 0;
int inWord = 0;  // Flag to keep track of whether we are inside a word
%}
%%
[a-zA-Z] {
   charCount++;
   if (!inWord) {
       wordCount++;
       inWord = 1;
   }
   char ch = yytext[0];
   if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u' || ch == 'A' || ch == 'E' || ch == 'I' || ch == 'O' || ch == 'U') {
       vowelCount++;
   } else {
       consonantCount++;
   }
}
[0-9] {
   charCount++;
   digitCount++;
   if (!inWord) {
       //wordCount++;
       inWord = 1;
   }
}
[^a-zA-Z0-9\ \n\s] {
   charCount++;
   specialCharCount++;
   if (!inWord) {
       wordCount++;
       inWord = 1;
   }
}
\n {
   charCount++;
   lineCount++;
   inWord = 0;
}
[ \t]+ {
   inWord = 0;
}
. {
   charCount++;
   if (!inWord) {
       wordCount++;
       inWord = 1;
   }
}
%%
int yywrap() {
   // Return 1 to indicate the end of input
   return 1;
}
int main(int argc, char* argv[]) {
   if (argc < 2) {
       printf("Usage: %s <test.txt>\n", argv[0]);
       return 1;
   }
   FILE* file = fopen(argv[1], "r");
   if (file == NULL) {
       printf("Error opening file %s\n", argv[1]);
       return 1;
   }
   yyin = file;
   yylex();
   printf("Number of characters: %d\n", charCount);
   printf("Number of words: %d\n", wordCount);
   printf("Number of digits: %d\n", digitCount);
   printf("Number of vowels: %d\n", vowelCount);
   printf("Number of consonants: %d\n", consonantCount);
   printf("Number of special characters: %d\n", specialCharCount);
   printf("Number of lines: %d\n", lineCount);
   fclose(file);
   return 0;
}
