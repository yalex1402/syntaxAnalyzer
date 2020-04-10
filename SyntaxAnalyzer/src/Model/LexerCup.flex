package Model;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
letter=[a-zA-Z_]+
digits=[0-9]+
toIgnore=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%
{toIgnore} {/*Ignore*/}

/* Comments */
( "//"(.)* ) {/*Ignore*/}

/* Quotes */
( "\"" ) {return new Symbol(sym.Quotes, yychar, yyline, yytext());}

/* Data type */
( byte | int | char | long | float | double ) {return new Symbol(sym.dataType, yychar, yyline, yytext());}

( String ) {return new Symbol(sym.stringType, yychar, yyline, yytext());}

( if ) {return new Symbol(sym.If, yychar, yyline, yytext());}

( else ) {return new Symbol(sym.Else, yychar, yyline, yytext());}

( do ) {return new Symbol(sym.Do, yychar, yyline, yytext());}

( while ) {return new Symbol(sym.While, yychar, yyline, yytext());}

( for ) {return new Symbol(sym.For, yychar, yyline, yytext());}

( "=" ) {return new Symbol(sym.opAssignment, yychar, yyline, yytext());}

( "+" ) {return new Symbol(sym.opAdd, yychar, yyline, yytext());}

( "-" ) {return new Symbol(sym.opSubstract, yychar, yyline, yytext());}

( "*" ) {return new Symbol(sym.opMultiply, yychar, yyline, yytext());}

( "/" ) {return new Symbol(sym.opDivide, yychar, yyline, yytext());}

( "&&" | "||" | "!" | "&" | "|" ) {return new Symbol(sym.opBoolean, yychar, yyline, yytext());}

( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {return new Symbol(sym.opRelational, yychar, yyline, yytext());}

( "+=" | "-="  | "*=" | "/=" | "%=" ) {return new Symbol(sym.opAttribution, yychar, yyline, yytext());}

( "++" | "--" ) {return new Symbol(sym.opAutoIncrement, yychar, yyline, yytext());}

(true | false) {return new Symbol(sym.Boolean, yychar, yyline, yytext());}

( "(" ) {return new Symbol(sym.leftParen, yychar, yyline, yytext());}

( ")" ) {return new Symbol(sym.rightParen, yychar, yyline, yytext());}

( "{" ) {return new Symbol(sym.leftBrace, yychar, yyline, yytext());}

( "}" ) {return new Symbol(sym.rightBrace, yychar, yyline, yytext());}

( "[" ) {return new Symbol(sym.leftBracket, yychar, yyline, yytext());}

( "]" ) {return new Symbol(sym.rightBracket, yychar, yyline, yytext());}

( "main" ) {return new Symbol(sym.Main, yychar, yyline, yytext());}

( ";" ) {return new Symbol(sym.semmiColon, yychar, yyline, yytext());}

/* Identifier */
{letter}({letter}|{digits})* {return new Symbol(sym.Identifier, yychar, yyline, yytext());}

/* Number */
("(-"{digits}+")")|{digits}+ {return new Symbol(sym.Number, yychar, yyline, yytext());}

/* Any Error */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}

