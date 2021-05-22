%debug
/* TODO: use c++ */
/* %language "c++" */

%{
#include <stdio.h>
#include <math.h>
/* #include <string> */
/* #include <bits/stdc++.h> */
#include "fenix.h"

void yyerror(const char* s);

%}

/* declare tokens */

/* datatypes */

%token LITERAL_INTEGER
%token LITERAL_FLOAT
%token LITERAL_BOOL

/* comments */

%token COMMENT_SINGLE

/* keywords */

%token CLASS
%token FUNCTION
%token FROM
%token IMPORT
%token WITH
%token IF
%token CASE
%token WHILE
%token FOR
%token IN
%token IS
%token HAS
%token RAISE
%token VAR
%token CONST
%token TEMPLATE
%token INHERITS
%token INTERFACE
%token NOT
%token DELETE
%token TRUE
%token FALSE
%token _NULL_
%token OR
%token AND


/* operations */

%token OP_ADD
%token OP_SUB
%token OP_MUL
%token OP_DIV
%token OP_ASSIGN
%token OP_NEGATE
%token OP_EQ
%token OP_LT
%token OP_LE
%token OP_GT
%token OP_GE
%token OP_DIFF
%token OP_POW
%token OP_SQRT
%token OP_MOD

/* punctuactions */

%token BRACKET_ANGLE_OPEN
%token BRACKET_ANGLE_CLOSE
%token BRACKET_CURLY_OPEN
%token BRACKET_CURLY_CLOSE
%token BRACKET_SQUARE_OPEN
%token BRACKET_SQUARE_CLOSE
%token NEWLINE
%token PAREN_OPEN
%token PAREN_CLOSE
%token SEMICOLON
%token WHITESPACE

/* errors */

%token ERROR


/* Declare types for the grammar's non-terminals. */
%type <program> program
%type <program> expr

%%

program: /* nothing */
    expr
;

expr:
;

%%
