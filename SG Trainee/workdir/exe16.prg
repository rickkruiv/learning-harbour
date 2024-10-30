clear

nRepeticoes := 0
nLinha := 1
nColuna := 1
nCont := 1
cNome := Space(50)

@ 00,00 to 24,79

@ 01,01 say "Informe seu nome: "
@ 02,01 say "Informe quantas vezes repetir: "

@ 01,19 get cNome       picture "@!"  Valid !Empty( cNome )
@ 02,32 get nRepeticoes picture "9999" Valid !Empty( nRepeticoes ) 
Read

@ 01,01 clear to 02,80

do while nCont <= nRepeticoes
   @ nLinha++,nColuna say Transform(nCont, "9999") + "." +  cNome

   nCont ++
   
   if nLinha > 23
      nLinha := 1
      nColuna += len(AllTrim(cNome)) + 5

      if (nColuna + len(AllTrim(cNome))) > 77
         @ 01,01 clear to 23,78
         nColuna := 1
      endif
   endif

   inkey(0.01)

enddo

Inkey(0)