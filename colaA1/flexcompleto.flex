/* Cabeçalho de opções do JFlex */
%%

%standalone         // Gera um analisador que não depende do sistema de scanner padrão
%class AnalisadorLexico   // Nome da classe Java que será gerada
%unicode            // Permite suportar Unicode (útil para nomes com acentos, etc.)
%cup                // Integra com o JCup (gera método `symbol()` com tokens)
%line               // Rastreia o número da linha
%column             // Rastreia a coluna do caractere lido

/* === Macros: trechos reutilizáveis de expressões regulares === */

DIGITO      = [0-9]                              // Um único dígito de 0 a 9
LETRA       = [a-zA-Z]                           // Uma letra maiúscula ou minúscula
IDENT       = {LETRA}({LETRA}|{DIGITO})*         // Identificadores: começam com letra, seguidos por letras ou dígitos
NUM_INT     = {DIGITO}+                          // Números inteiros: um ou mais dígitos
NUM_REAL    = {DIGITO}+"."{DIGITO}+              // Números reais: dígitos ponto dígitos (ex: 12.34)
ESPACO      = [ \t\r\n]+                         // Espaços em branco: espaço, tab, quebra de linha ou retorno de carro
COMENTARIO  = "//".*                             // Comentário de linha: inicia com // e vai até o fim da linha

%%

/* === Palavras-chave: retornam tokens fixos === */
"if"            { return sym(Sym.IF); }          // Palavra-chave: if
"else"          { return sym(Sym.ELSE); }        // Palavra-chave: else
"while"         { return sym(Sym.WHILE); }       // Palavra-chave: while
"for"           { return sym(Sym.FOR); }         // Palavra-chave: for
"int"           { return sym(Sym.INT); }         // Palavra-chave: int
"float"         { return sym(Sym.FLOAT); }       // Palavra-chave: float

/* === Operadores: símbolos comuns em linguagens de programação === */
"=="            { return sym(Sym.IGUAL); }       // Operador de igualdade
"="             { return sym(Sym.ATRIB); }       // Operador de atribuição
"!="            { return sym(Sym.DIF); }         // Operador de diferença
">="            { return sym(Sym.MAIORIGUAL); }  // Operador maior ou igual
"<="            { return sym(Sym.MENORIGUAL); }  // Operador menor ou igual
">"             { return sym(Sym.MAIOR); }       // Operador maior que
"<"             { return sym(Sym.MENOR); }       // Operador menor que
"+"             { return sym(Sym.MAIS); }        // Operador de adição
"-"             { return sym(Sym.MENOS); }       // Operador de subtração
"*"             { return sym(Sym.MULT); }        // Operador de multiplicação
"/"             { return sym(Sym.DIV); }         // Operador de divisão

/* === Identificadores e Números === */
{IDENT}         { return sym(Sym.ID, yytext()); }                // Identificadores: variáveis, nomes de funções, etc.
{NUM_REAL}      { return sym(Sym.NUM_REAL, Double.parseDouble(yytext())); } // Número real com ponto
{NUM_INT}       { return sym(Sym.NUM_INT, Integer.parseInt(yytext())); }    // Número inteiro

/* === Espaços em branco e comentários: ignorados === */
{ESPACO}        { /* ignora espaços e quebras de linha */ }
{COMENTARIO}    { /* ignora comentários de linha */ }

/* === Qualquer outra coisa: caractere não reconhecido === */
.               { System.err.println("Caractere inválido: " + yytext()); }

