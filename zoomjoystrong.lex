/*****************************************************************
Lexical file for zoomjoystrong drawing language.

@author Brendan Dent
@version Winter 2018
*****************************************************************/
%{
	#include "zoomjoystrong.tab.h"
	#include <stdlib.h>
	#include <stdio.h>
%}
%option noyywrap
%%


[0-9]+				{ yylval.i = atoi(yytext); return INT; }
[0-9]*\.[0-9]+		{ yylval.f = atof(yytext); return FLOAT; }
point				{ return POINT; }
line				{ return LINE; }
circle				{ return CIRCLE; }
rectangle			{ return RECTANGLE; }
set_color			{ return SET_COLOR; }
;					{ return END_STATEMENT; }
end					{ return END; }
[ \t\n]+			;
.					{ return ERROR;}
%%
