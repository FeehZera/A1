%%

%cup
%class scanner
%line
%column

//MACROS DO FLEX
digito = [0-9]
letra = [a-zA-Z]
numero = {digito}
ident = letra (letra|digito)*
fimdeLinha = \r|\n|\r\n
espaco = {fimdeLinha} | [ \t\f]

%%

{ident} {return new Symbol(sym.IDENT,yyline,yycolumn, yytext()); }