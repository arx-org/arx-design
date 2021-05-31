/* options */
%option noyywrap
%option nodefault

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "fenix.h"
#include "fenix.tab.h"

extern "C" int yylex();


char string_buf[MAX_STR_CONST];
char *string_buf_ptr;

int comment_counter = 0;
int lineno = 0;

%}


/* operators */

OP_ADD      "+"
OP_SUB      "-"
OP_MUL      "*"
OP_DIV      "/"
OP_ASSIGN   "="
OP_NEGATE   "~"
OP_EQ       "=="
OP_LT       "<"
OP_LE       "<="
OP_GT       ">"
OP_GE       ">="
OP_DIFF     "!="
OP_POW      "^"
OP_SQRT     "\/"
OP_MOD      "%"


/* COMMENTS */

COMMENT_SINGLE_LINE     #.*\n
COMMENT_OPEN            "/*"
COMMENT_CLOSE           "*/"


/* punctuactions */

DOT                     "."
BRACKET_ANGLE_OPEN      "<"
BRACKET_ANGLE_CLOSE     ">"
BRACKET_CURLY_OPEN      "{"
BRACKET_CURLY_CLOSE     "}"
BRACKET_SQUARE_OPEN     "["
BRACKET_SQUARE_CLOSE    "]"
NEWLINE                 \n
PAREN_OPEN              "("
PAREN_CLOSE             ")"
QUOTE_FORMAT            \"
QUOTE_SIMPLE            \'
SEMICOLON               ";"
WHITESPACE              [ \t\r\n\f]


/* data types */

DIGIT       [0-9]
INT         {DIGIT}+
FLOAT       {DIGIT}+{DOT}{DIGIT}+
LETTER      [a-zA-Z]
STRING      {LETTER}+
BOOL        {TRUE}|{FALSE}
CHAR        .

ALL      .


/* keywords */

CLASS               classs
FUNCTION            function
FROM                from
IMPORT              import
WITH                with
IF                  if
CASE                case
WHILE               while
FOR                 for
IN                  in
IS                  is
HAS                 has
RAISE               raise
VAR                 var
CONST               const
TEMPLATE            template
INHERITS            inherits
INTERFACE           interface
NOT                 not
DELETE              delete
TRUE                true
FALSE               false
NUL                 null
OR                  or
AND                 and

%x COMMENT
%x STRING_SIMPLE
%x STRING_FORMAT

%%

 /* COMMENTS */
<INITIAL,COMMENT>{NEWLINE} {
    lineno++;
}
<INITIAL,COMMENT>{COMMENT_OPEN}	{
    comment_counter++;
    BEGIN(COMMENT);
}
<INITIAL>{COMMENT_CLOSE} {
    return ERROR;
}
<COMMENT>{COMMENT_CLOSE} {
    comment_counter--;
    if (comment_counter <= 0) {
        BEGIN(INITIAL);
        comment_counter = 0;
    }
}
<COMMENT>{CHAR} ;
<COMMENT><<EOF>> {
    BEGIN(INITIAL);
    return ERROR;
}

{COMMENT_SINGLE_LINE} ;


 /* DATATYPES */

 /* FORMAT STRING */
<INITIAL>{QUOTE_FORMAT} {
    string_buf[0] = '\0';
    string_buf_ptr = string_buf;
    BEGIN(STRING_FORMAT);
}
<STRING_FORMAT>{QUOTE_FORMAT} {
    yylval.string_ = string_buf;
    printf("STRING_FORMAT: %s\n", yylval.string_);

    BEGIN(INITIAL);
    return LITERAL_STRING;
}
<STRING_FORMAT>{CHAR} {
    printf("CHAR: %s\n", yytext);
    *string_buf_ptr = yytext[0];
    string_buf_ptr++;
}
<STRING_FORMAT><<EOF>> {
    BEGIN(INITIAL);
    return ERROR;
}

 /* SIMPLE STRING */
<INITIAL>{QUOTE_SIMPLE} {
    string_buf[0] = '\0';
    string_buf_ptr = string_buf;
    BEGIN(STRING_SIMPLE);
}
<STRING_SIMPLE>{QUOTE_SIMPLE} {
    yylval.string_ = string_buf;
    printf("STRING_SIMPLE: %s\n", yylval.string_);

    BEGIN(INITIAL);
    return LITERAL_STRING;
}
<STRING_SIMPLE>{CHAR} {
    printf("CHAR: %s\n", yytext);
    *string_buf_ptr = yytext[0];
    string_buf_ptr++;
}
<STRING_SIMPLE><<EOF>> {
    BEGIN(INITIAL);
    return ERROR;
}

 /* data type */

{INT}               { printf("INT %s\n", yytext); yylval.integer_ = atoi(yytext); return LITERAL_INTEGER; }
{FLOAT}             { printf("FLOAT %s\n", yytext); yylval.float_ = atof(yytext); return LITERAL_FLOAT; }
{BOOL}              { printf("BOOL %s\n", yytext); yylval.boolean_ = (yytext=="true"? 1 : 0); return LITERAL_BOOL; }


 /* keywords */

{CLASS}             { printf("CLASS\n"); return CLASS; }
{FUNCTION}          { printf("FUNCTION\n"); return FUNCTION; }
{FROM}              { printf("FROM\n"); return FROM; }
{IMPORT}            { printf("IMPORT\n"); return IMPORT; }
{WITH}              { printf("WITH\n"); return WITH; }
{IF}                { printf("IF\n"); return IF; }
{CASE}              { printf("CASE\n"); return CASE; }
{WHILE}             { printf("WHILE\n"); return WHILE; }
{FOR}               { printf("FOR\n"); return FOR; }
{IN}                { printf("IN\n"); return IN; }
{IS}                { printf("IS\n"); return IS; }
{HAS}               { printf("HAS\n"); return HAS; }
{RAISE}             { printf("RAISE\n"); return RAISE; }
{VAR}               { printf("VAR\n"); return VAR; }
{CONST}             { printf("CONST\n"); return CONST; }
{TEMPLATE}          { printf("TEMPLATE\n"); return TEMPLATE; }
{INHERITS}          { printf("INHERITS\n"); return INHERITS; }
{INTERFACE}         { printf("INTERFACE\n"); return INTERFACE; }
{NOT}               { printf("NOT\n"); return NOT; }
{DELETE}            { printf("DELETE\n"); return DELETE; }
{TRUE}              { printf("TRUE\n"); return TRUE; }
{FALSE}             { printf("FALSE\n"); return FALSE; }
{NUL}               { printf("NULL\n"); return NUL; }
{OR}                { printf("OR\n"); return OR; }
{AND}               { printf("AND\n"); return AND; }


 /* operations */

{OP_ADD}            { printf("OP_ADD\n"); return OP_ADD; }
{OP_SUB}            { printf("OP_SUB\n"); return OP_SUB; }
{OP_MUL}            { printf("OP_MUL\n"); return OP_MUL; }
{OP_DIV}            { printf("OP_DIV\n"); return OP_DIV; }
{OP_ASSIGN}         { printf("OP_ASSIGN\n"); return OP_ASSIGN; }
{OP_NEGATE}         { printf("OP_NEGATE\n"); return OP_NEGATE; }
{OP_EQ}             { printf("OP_EQ\n"); return OP_EQ; }
{OP_LT}             { printf("OP_LT\n"); return OP_LT; }
{OP_LE}             { printf("OP_LE\n"); return OP_LE; }
{OP_GT}             { printf("OP_GT\n"); return OP_GT; }
{OP_GE}             { printf("OP_GE\n"); return OP_GE; }
{OP_DIFF}           { printf("OP_DIFF\n"); return OP_DIFF; }
{OP_POW}            { printf("OP_POW\n"); return OP_POW; }
{OP_SQRT}           { printf("OP_SQRT\n"); return OP_SQRT; }
{OP_MOD}            { printf("OP_MOD\n"); return OP_MOD; }

 /* punctuactions */

{BRACKET_ANGLE_OPEN}    { printf("BRACKET_ANGLE_OPEN\n"); return BRACKET_ANGLE_OPEN; }
{BRACKET_ANGLE_CLOSE}   { printf("BRACKET_ANGLE_CLOSE\n"); return BRACKET_ANGLE_CLOSE; }
{BRACKET_CURLY_OPEN}    { printf("BRACKET_CURLY_OPEN\n"); return BRACKET_CURLY_OPEN; }
{BRACKET_CURLY_CLOSE}   { printf("BRACKET_CURLY_CLOSE\n"); return BRACKET_CURLY_CLOSE; }
{BRACKET_SQUARE_OPEN}   { printf("BRACKET_SQUARE_OPEN\n"); return BRACKET_SQUARE_OPEN; }
{BRACKET_SQUARE_CLOSE}  { printf("BRACKET_SQUARE_CLOSE\n"); return BRACKET_SQUARE_CLOSE; }
{NEWLINE}               { printf("NEWLINE\n"); return NEWLINE; }
{PAREN_OPEN}            { printf("PAREN_OPEN\n"); return PAREN_OPEN; }
{PAREN_CLOSE}           { printf("PAREN_CLOSE\n"); return PAREN_CLOSE; }
{SEMICOLON}             { printf("SEMICOLON\n"); return SEMICOLON; }
{WHITESPACE}            ; /* ignore whitespace */

 /* errors */

{ALL}                   { printf("No match for text (%s)\n", yytext); return ERROR; }

%%


int main(int argc, char **argv) {
    int i;

    /* just read stdin */
    if(argc < 2) {
        while (yylex() != 0);
        return 0;
    }

    for(i = 1; i < argc; i++) {
        FILE *f = fopen(argv[i], "r");

        if(!f) {
            perror(argv[i]);
            return (1);
        }

        yyrestart(f);
        while (yylex() != 0) ;
        fclose(f);
    }

    return 0;
}
