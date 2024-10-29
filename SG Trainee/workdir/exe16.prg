clear

nCont := 1
nRepeticoes := 0
cNome := Space(30)

@ 01,01 say "Informe seu nome: "
@ 02,01 say "Informe quantas vezes repetir: "

@ 01,19 get cNome       picture "@!"  Valid !Empty( cNome )
@ 02,32 get nRepeticoes picture "999" Valid !Empty( nRepeticoes ) 
Read

@ 01,01 clear to 02,80


do while ncont <= nRepeticoes
   @ nCont,01 say Alltrim( Str( nCont ) ) + ". " +  cNome
   nCont++
enddo