Clear

nNumeroA := 0
nNumeroB := 0
nNumeroC := 0

nMascaraNumeros := "99"

@ 00,00 to 05,25 double

@ 01,01 say "Primeiro numero: "
@ 02,01 say "Segundo numero:"
@ 03,01 say "Terceiro numero:"

@ 01,20 get nNumeroA picture nMascaraNumeros Valid !Empty(nNumeroA)
@ 02,20 get nNumeroB picture nMascaraNumeros Valid !Empty(nNumeroB)
@ 03,20 get nNumeroC picture nMascaraNumeros Valid !Empty(nNumeroC)
read

if nNumeroA >= nNumeroB .and. nNumeroA >= nNumeroC
   @ 04,01 say AllTrim(Str(nNumeroA)) + "e o maior"
else
   if nNumeroB >= nNumeroA .and. nNumeroB >= nNumeroC
      @ 04,01 say AllTrim( Str( nNumeroB ) ) + " e o maior"
   else 
      @ 04,01 say AllTrim( Str( nNumeroC ) ) + " e o maior"
   endif
endif