%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* to use yylex from C */
extern "C" int yylex();

/* yyval struct */
struct yylval_struct {
    int intVal;
    float floatVal;
    bool boolVal;
};

/* tokens */

enum yytokentype {
    /* operators */
    OP_ADD = 258,
    OP_SUB = 259,
    OP_MUL = 260,
    OP_DIV = 261,
    OP_EQ = 262,
    OP_ASSIGN = 263,
    OP_NEGATE = 264,
    OP_LT = 265,
    OP_LE = 266,
    OP_GT = 267,
    OP_GE = 268,
    OP_DIFF = 269,

    /* punctuactions */
    SEMICOLON = 300,
    DOT = 301,
    BRACKET_ANGLE_OPEN = 302,
    BRACKET_ANGLE_CLOSE = 303,
    BRACKET_CURLY_OPEN = 304,
    BRACKET_CURLY_CLOSE = 305,
    BRACKET_SQUARE_OPEN = 306,
    BRACKET_SQUARE_CLOSE = 307,
    PAREN_OPEN = 308,
    PAREN_CLOSE = 309,
    NEWLINE = 310,
    QUOTE_FORMAT = 311,
    QUOTE_SIMPLE = 312,

    /* data types */
    LITERAL_INTEGER = 400,
    LITERAL_FLOAT = 401,
    LITERAL_BOOL = 402,

    /* system */
    ERROR = 500,

    /* keywords */
    CLASS = 600,
    FUNCTION = 601,
    FROM = 602,
    IMPORT = 603,
    WITH = 604,
    IF = 605,
    CASE = 606,
    WHILE = 607,
    FOR = 608,
    IN = 609,
    IS = 610,
    HAS = 611,
    RAISE = 612,
    VAR = 613,
    CONST = 614,
    TEMPLATE = 615,
    INHERITS = 616,
    INTERFACE = 617,
    NOT = 618,
    DELETE = 619,
    TRUE = 620,
    FALSE = 621,
    _NULL_ = 622,
    OR = 623,
    AND = 624,

    /* comments */

    COMMENT_SINGLE = 800

};

struct yylval_struct yylval;

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


/* COMMENTS */

COMMENT_SINGLE          #.*\n


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
NULL                null
OR                  or
AND                 and


%%

 /* data type */

{INT}               { printf("INT %s\n", yytext); yylval.intVal = atoi(yytext); return LITERAL_INTEGER; }
{FLOAT}             { printf("FLOAT %s\n", yytext); yylval.floatVal = atof(yytext); return LITERAL_FLOAT; }
{BOOL}              { printf("BOOL %s\n", yytext); yylval.boolVal = (yytext=="true"? true : false); return LITERAL_BOOL; }

 /* comments */

{COMMENT_SINGLE}    ;

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
{NULL}              { printf("NULL\n"); return _NULL_; }
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

{ALL}               { printf("No match for text (%s)\n", yytext); return ERROR; }
