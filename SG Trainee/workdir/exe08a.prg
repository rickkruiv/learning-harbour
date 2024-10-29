clear

// variaveis
           nValorA := 0
           nValorB := 0
           nValorC := 0
      
      nQuantidadeA := 0
      nQuantidadeB := 0
      nQuantidadeC := 0
      
           nTotalA := 0
           nTotalB := 0
           nTotalC := 0
         
         nSubtotal := 0
         
         cProdutoA := Space(15)
         cProdutoB := Space(15)
         cProdutoC := Space(15)
// mascaras
     nMascaraValor := "@E 999.99"
nMascaraQuantidade := "999"
      cMascaraNome := "@!"

// "FRONT"
@ 00,00 to 12,49 double
@ 02,01 to 02,48
@ 03,16 to 04,16
@ 03,29 to 04,29
@ 03,39 to 04,39
@ 04,01 to 04,48
@ 06,01 to 06,48
@ 08,01 to 08,48
@ 10,01 to 10,48

@ 05,16 to 09,16
@ 05,29 to 09,29
@ 05,39 to 09,39

@ 01,12 say "Gerenciamento de estoque"

@ 03,05 say "Produto"
@ 03,18 say "Quantidade"
@ 03,32 say "Valor"
@ 03,42 say "Total"


// Produto A
@ 05,01 get cProdutoA    picture cMascaraNome        Valid !Empty( cProdutoA )
@ 05,22 get nQuantidadeA picture nMascaraQuantidade  Valid !Empty( nQuantidadeA ) .and. nQuantidadeA >= 0 .and. nQuantidadeA <= 100
@ 05,32 get nValorA      picture nMascaraValor       Valid !Empty( nValorA ) .and. nValorA > 0
Read

nTotalA := nQuantidadeA * nValorA

@ 05,40 say AllTrim(Str(nTotalA))


// Produto B
@ 07,01 get cProdutoB    picture cMascaraNome       Valid !Empty( cProdutoB )
@ 07,22 get nQuantidadeB picture nMascaraQuantidade Valid !Empty( nQuantidadeB ) .and. nQuantidadeB >= 0 .and. nQuantidadeB <= 100
@ 07,32 get nValorB      picture nMascaraValor      Valid !Empty( nValorB ) .and. nValorB > 0
Read

nTotalB := nQuantidadeB * nValorB

@ 07,40 say AllTrim(Str(nTotalB))


// Produto C
@ 09,01 get cProdutoC    picture cMascaraNome       Valid !Empty( cProdutoC )
@ 09,22 get nQuantidadeC picture nMascaraQuantidade Valid !Empty( nQuantidadeC ) .and. nQuantidadeC >= 0 .and. nQuantidadeC <= 100
@ 09,32 get nValorC      picture nMascaraValor      Valid !Empty( nValorC ) .and. nValorC > 0
Read

nTotalC := nQuantidadeC * nValorC

@ 09,40 say AllTrim( Str( nTotalC ) )

nSubtotal := nTotalA + nTotalB + nTotalC

@ 11,02 say "SubTotal: "
@ 11,12 say Replicate(".", 27)
@ 11,40 say AllTrim( Str( nSubtotal ) )

inkey(0)