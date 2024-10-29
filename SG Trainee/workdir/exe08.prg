clear

nProdutoA := 10.00
nProdutoB := 5.25
nProdutoC := 20.00

nQuantidadeA := 0
nQuantidadeB := 0
nQuantidadeC := 0

nTotal := 0

@ 00,00 to 06,29
@ 04,01 to 04,28

@ 01,01 say "Informe a quantidade A: "
@ 02,01 say "Informe a quantidade B: "
@ 03,01 say "Informe a quantidade C: "

@ 01,26 get nQuantidadeA picture "999"
@ 02,26 get nQuantidadeB picture "999"
@ 03,26 get nQuantidadeC picture "999"
Read

nTotal := ( nQuantidadeA * nProdutoA ) + ( nQuantidadeB * nProdutoB ) + ( nQuantidadeC * nProdutoC )

@ 05,01 say "Valor total: $ " + ALLTrim( Str( nTotal,0 ,2 ) )

inkey(0)