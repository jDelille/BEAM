#include <stdio.h>
#include "cli.tab.h"
#include "commands/commands.h"

int yyparse(void);

int main(void)
{
    clear_terminal_cmd();
    print_prompt();

    while (1)
    {
        yyparse();
    }
    return 0;
}