#include <stdio.h>
#include "cli.tab.h"  
#include "commands/commands.h"

int yyparse(void);

int main(void) {
    yyparse();
    return 0;
}