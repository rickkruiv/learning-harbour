clear

nNumero1 := 0
nNumero2 := 0
nNumero3 := 0

@ 00,00 to 06,20
@ 04,01 to 04,19

@ 01,01 say "Primeiro Numero:"
@ 02,01 say "Segundo Numero:"
@ 03,01 say "Terceiro Numero:"

@ 01,18 get nNumero1 picture "99"
@ 02,18 get nNumero2 picture "99"
@ 03,18 get nNumero3 picture "99"
Read

nMedia := ( nNumero1 + nNumero2 + nNumero3 ) / 3

@ 05,01 say "Media: " + ALLTrim( Str( nMedia, 0 , 1 ) )

inkey(0)