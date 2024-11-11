%{

#include <stdio.h>
#include <stdbool.h>

#define MAX_STACK_SIZE 100

char stack[MAX_STACK_SIZE];
int top = -1;

void push(char c) {
   if (top >= MAX_STACK_SIZE - 1) {
       //printf("Stack overflow.\n");
       printf("");
   } else {
       top++;
       stack[top] = c;
   }
}

char pop() {
   if (top < 0) {
       //printf("Stack underflow.\n");
       printf("");
       return '\0';
   } else {
       char c = stack[top];
       top--;
       return c;
   }
}
%}

%option noyywrap

%%

[(){}\[\]]       {
                   char input_char = yytext[0];
                   if (input_char == '(' || input_char == '{' || input_char == '[') {
                       push(input_char);
                   } else {
                       char popped_char = pop();
                       if ((input_char == ')' && popped_char != '(') ||
                           (input_char == '}' && popped_char != '{') ||
                           (input_char == ']' && popped_char != '[')) {
                           printf("Invalid\n");
                           top = -1; // Reset the stack for the next line
                           return 0; // Skip the rest of the line
                       }
                   }
                }

\n               {
                   if (top == -1) {
                       printf("Valid\n");
                   } else {
                       printf("valid\n");
                   }
                   top = -1; // Reset the stack for the next line
                }

%%

int main(int argc, char *argv[]) {
   if (argc != 2) {
       printf("Usage: %s <input_file>\n", argv[0]);
       return 1;
   }

   FILE *inputFile = fopen(argv[1], "r");
   if (!inputFile) {
       printf("Error opening the file.\n");
       return 1;
   }

   char input_line[MAX_STACK_SIZE];
   while (fgets(input_line, MAX_STACK_SIZE, inputFile) != NULL) {
       printf("\n%s", input_line);
       yy_scan_string(input_line); // Pass the input line to the lexer
       yylex();
   }

   fclose(inputFile);
   return 0;
}


