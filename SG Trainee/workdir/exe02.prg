clear 

nMediaIdade := 0
nMediaPeso  := 0
nCont       := 0

do while .t.

   cNome  := Space(25)
   nIdade := 0
   nPeso  := 0

   @ 00,00 to 04,50 double
   @ 01,01 SAY "NOME: "
   @ 02,01 SAY "IDADE: "
   @ 03,01 SAY "PESO: "

   @ 01,07 get cNome  picture "@!"  Valid !Empty( cNome )
   @ 02,07 get nIdade picture "99"  Valid !Empty( nIdade )
   @ 03,07 get nPeso  picture "999" Valid !Empty( nPeso )
   Read

   nMediaIdade += nIdade
   nMediaPeso += nPeso

   if LastKey() == 27
      
      Clear
      Exit

   endif
   
   nCont ++

enddo

nMediaIdade := nMediaIdade / nCont
nMediaPeso := nMediaPeso / nCont


@ 01,01 say "Media idade: " + AllTrim( Str( nMediaIdade ) )
@ 02,01 say "Media peso: " + AllTrim( Str( nMediaPeso ) )
InKey( 0 )
