clear

nNumero1 := 28
nNumero2 := 10

nProduto := ( nNumero1 * nNumero2 )

@ 00,00 to 04,35
@ 02,01 say "Primeiro numero: " + ALLTrim( Str( nNumero1 ) )
@ 03,01 say "Segundo numero: " + ALLTrim( Str( nNumero2 ) )

@ 04,00 to 08,35
@ 06,01 say "O produto dos valores e = " + ALLTrim( Str( nProduto ) )
@ 09,00 say ""