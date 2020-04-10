package Model;
import static Model.Tokens.*;
%%
%class Lexer
%type Tokens
letter=[a-zA-Z_]+
digits=[0-9]+
toIgnore=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%

{toIgnore} {/*Ignore*/}

/* Comments */
( "//"(.)* ) {/*Ignore*/}

/* Quotes */
( "\"" ) {lexeme=yytext(); return Quotes;}

/* Data type */
( byte | int | char | long | float | double ) {lexeme=yytext(); return dataType;}

( String ) {lexeme=yytext(); return stringType;}

( if ) {lexeme=yytext(); return If;}

( else ) {lexeme=yytext(); return Else;}

( do ) {lexeme=yytext(); return Do;}

( while ) {lexeme=yytext(); return While;}

( for ) {lexeme=yytext(); return For;}

( "=" ) {lexeme=yytext(); return opAssignment;}

( "+" ) {lexeme=yytext(); return opAdd;}

( "-" ) {lexeme=yytext(); return opSubstract;}

( "*" ) {lexeme=yytext(); return opMultiply;}

( "/" ) {lexeme=yytext(); return opDivide;}

( "&&" | "||" | "!" | "&" | "|" ) {lexeme=yytext(); return opBoolean;}

( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexeme = yytext(); return opRelational;}

( "+=" | "-="  | "*=" | "/=" | "%=" ) {lexeme = yytext(); return opAttribution;}

( "++" | "--" ) {lexeme = yytext(); return opAutoIncrement;}

(true | false) {lexeme = yytext(); return Boolean;}

( "(" ) {lexeme=yytext(); return leftParen;}

( ")" ) {lexeme=yytext(); return rightParen;}

( "{" ) {lexeme=yytext(); return leftBrace;}

( "}" ) {lexeme=yytext(); return rightBrace;}

( "[" ) {lexeme = yytext(); return leftBracket;}

( "]" ) {lexeme = yytext(); return rightBracket;}

( "main" ) {lexeme=yytext(); return Main;}

( ";" ) {lexeme=yytext(); return semmiColon;}

/* Identifier */
{letter}({letter}|{digits})* {lexeme=yytext(); return Identifier;}

/* Number */
("(-"{digits}+")")|{digits}+ {lexeme=yytext(); return Number;}

/* Any Error */
 . {return ERROR;}
