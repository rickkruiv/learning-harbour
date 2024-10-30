clear

cPalavra          := Space(50)
cPalavraInvertida := ""

nCont := 0

@ 01,01 say "Informe uma palavra: "

@ 01,23 get cPalavra picture "@!" Valid !Empty( cPalavra )
read

nCont := len( cPalavra )

do while nCont > 0
   cPalavraInvertida += SubStr( cPalavra, nCont, 1 )
   nCont --
enddo

@ 02,01 say AllTrim( cPalavraInvertida )

Inkey(0)
