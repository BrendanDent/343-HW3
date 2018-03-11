/*****************************************************************
Grammar file for zoomjoystrong drawing language.

@author Brendan Dent
@version Winter 2018
*****************************************************************/
%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "zoomjoystrong.h"
	void yyerror(const char* msg);
	int yylex();
%}

%error-verbose

%union { int i; float f; }

%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token END_STATEMENT
%token END
%token INT
%token FLOAT
%token ERROR

%type<i> INT
%type<f> FLOAT

%%

statements: 	statement END_STATEMENT
	|	statement  END_STATEMENT statements
	|	end
;

statement: 	point
	|	line 
	|	circle
	|	rectangle
	|	set_color
	|	errorOccured
	|
;

point:		POINT INT INT 
		{ point($2, $3); }
;

line:		LINE INT INT INT INT
		{ line( $2, $3, $4, $5);}
;

circle:		CIRCLE INT INT INT
		{ circle( $2, $3, $4); }
;

rectangle:	RECTANGLE INT INT INT INT
		{ rectangle( $2, $3, $4, $5); }

set_color:	SET_COLOR INT INT INT
		{set_color($2, $3, $4);}

errorOccured:		ERROR
		{printf("Error. Try again.");}
;

end:		END
		{finish(); exit(0);}
;
%%
int main(int argc, char** argv){
	setup();
	yyparse();
	return 0;
}
void yyerror(const char* msg){
	fprintf(stderr, "ERROR! %s\n", msg);
}