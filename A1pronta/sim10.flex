import java_cup.runtime.Symbol;

%%
%class Sim10
%cup
%unicode
%line
%column
%public

%{
//codigo java para funcionar entrada via teclado. Explicação abaixo.
public Sim10(java.io.InputStream in) {
    this( new java.io.InputStreamReader( in,
          java.nio.charset.Charset.forName("UTF-8")));
}
%}

// Expressões regulares
LETRAS = [a-zA-Z]+
DIGITOS = [0-9]+

%%
{LETRAS}     { return new Symbol(sym.LETRAS, yytext()); }
{DIGITOS}    { return new Symbol(sym.DIGITOS, Integer.parseInt(yytext())); }
[\ \t\r\n]+   { /* ignora espaços, tabulações e novas linhas */ }
.             { System.err.println("Caractere inválido: " + yytext()); }
