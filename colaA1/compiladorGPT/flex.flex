%%

%class Scanner
%unicode
%cup
%line
%column

%%

"+"             { return new Symbol(sym.PLUS); }
"-"             { return new Symbol(sym.MINUS); }
"*"             { return new Symbol(sym.TIMES); }
"/"             { return new Symbol(sym.DIV); }
"("             { return new Symbol(sym.LPAREN); }
")"             { return new Symbol(sym.RPAREN); }

[0-9]+          { return new Symbol(sym.NUM, Integer.parseInt(yytext())); }

[\t\n\r ]+      { /* ignora espaços em branco */ }

.               { System.err.println("Caractere inválido: " + yytext()); }