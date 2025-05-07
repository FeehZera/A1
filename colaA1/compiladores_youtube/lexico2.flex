%%
%standalone
digito = [0-9]
letra = [a-zA-Z]
numero = {digito}
palavra = {letra}*
espaco = " "

%%

{espaco} {System.out.print("aqui tem um espaco, linha: " + yyline + " coluna: " + yycolumn + " nome: " + yytext);}