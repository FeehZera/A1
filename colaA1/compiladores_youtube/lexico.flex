%%

%standalone

//MACROS DO FLEX
digito = [0-9]
letra = [a-zA-Z]
numero = {digito}
palavra = {letra}*

%%

a(a + b)* {System.out.print("começa com A");}
b(a + b)* {System.out.print("começa com A");}
{numero} {System.out.print("e um numero buceta");} // USAR MACRO SEMPRE DENTRO DE CHAVES {}
{letra} {System.out.print("e uma letra bosta");}
 