%option noyywrap

%{
#include <stdio.h>

int keywords = 0;
int identifiers = 0;
int numbers = 0;
int operators = 0;
int special_characters = 0;
%}

%%

"int"|"float"|"char"|"if"|"else"|"while"|"return"  { keywords++; }

[a-zA-Z_][a-zA-Z0-9_]*  { identifiers++; }

[0-9]+  { numbers++; }

"=="|"!="|"+"|"-"|"*"|"/"|"="|"<"|">"  { operators++; }

[{}();,\[\]]  { special_characters++; }

[ \t\r\n]+  { /* Ignore whitespace */ }

.  { printf("Unknown character: %s\n", yytext); }

%%

int main(void)
{
    yyin = fopen("input_example4.txt", "r");

    if (yyin == NULL) {
        printf("Could not open input_example4.txt\n");
        return 1;
    }

    yylex();

    printf("\nLexical Analysis Results:\n");
    printf("-------------------------\n");
    printf("Keywords           : %d\n", keywords);
    printf("Identifiers        : %d\n", identifiers);
    printf("Numbers            : %d\n", numbers);
    printf("Operators          : %d\n", operators);
    printf("Special characters : %d\n", special_characters);

    fclose(yyin);
    return 0;
}

