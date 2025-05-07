%%
%class Sim09
%standalone
%unicode
%public

LETRAS = [a-zA-Z]+
DIGITOS = [0-9]+

%%
{LETRAS}     { System.out.println("Palavra: LETRAS"); }
{DIGITOS}    { System.out.println("Palavra: DIGITOS"); }
.|[\n\r\t]   { /* Ignora qualquer outro */ }
