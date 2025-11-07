%{
#include <stdio.h>
#include <stdlib.h>
#include "cli.tab.h"
#include "commands/commands.h"

int yylex(void);
void yyerror(const char *s);
%}

%union {
    char *string;
}

%token CREATE PROJECT INSTALL TEMPLATE
%token <string> IDENTIFIER STRING
%token NEWLINE

%%

commands:
    | command commands
;

command:
      create_project NEWLINE
    | install_template NEWLINE
;

install_template: 
    INSTALL TEMPLATE STRING { install_template($3); }

create_project:
    CREATE PROJECT { create_project(); }
;



%%

void yyerror(const char *s) {
    fprintf(stderr, "Parse error: %s\n", s);
    fflush(stderr);
    fflush(stdout);
}