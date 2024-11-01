clear
Set Date to British
Set Century On

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
nTotalItens := 0
         
cProdutoA := Space(18)
cProdutoB := Space(18)
cProdutoC := Space(18)
         
nIdade := 0
cCliente := Space(21)
cEndereco := Space(28)

dCompra := Date()
dEntrega := Date() + 3

// mascaras
nMascaraValor := "@E 999.99"
nMascaraNumero := "99"
cMascaraTexto := "@!"

// "FRONT"

// Quadros e linhas
@ 00,00 to 18,50 double
@ 18,00 to 21,50 double

@ 00,51 to 21,79 double

@ 02,01 to 02,49

@ 04,01 to 04,49
@ 06,01 to 06,49
@ 08,01 to 08,49

@ 10,01 to 10,49
@ 12,01 to 12,49
@ 14,01 to 14,49

@ 07,23 to 13,23
@ 07,29 to 13,29
@ 07,39 to 13,39

@ 02,52 to 02,78

// topicos
@ 01,18 say "SUPERMERCADAO"

@ 03,02 say "Cliente: "
@ 05,02 say "Idade: "
@ 05,15 say "Data: "

@ 07,02 say "Descricao"
@ 07,25 say "QTD"
@ 07,31 say "Valor"
@ 07,41 say "Total"

@ 09,02 say "1."
@ 11,02 say "2."
@ 13,02 say "3."

@ 16,02 say "Valor total: "
@ 16,30 say "QTD. Itens:"

@ 19,02 say "Endereco:"
@ 20,02 say "Data de Entrega:"

@ 01,60 say "Nota fiscal"
@ 10,53 say "Aguardando preenchimento."

// cliente, idade, data
@ 03,10 get cCliente     picture cMascaraTexto  Valid !Empty( cCliente )
@ 05,09 get nIdade       picture nMascaraNumero Valid !Empty( nIdade ) .and. nIdade >= 18
@ 05,21 get dCompra                             Valid !(dCompra < Date())
read

// Produto A
@ 09,04 get cProdutoA    picture cMascaraTexto  Valid !Empty( cProdutoA )
@ 09,25 get nQuantidadeA picture nMascaraNumero Valid !Empty( nQuantidadeA ) .and. nQuantidadeA >= 0 .and. nQuantidadeA <= 100
@ 09,32 get nValorA      picture nMascaraValor  Valid !Empty( nValorA ) .and. nValorA > 0
read

nTotalA := nQuantidadeA * nValorA
@ 09,40 say AllTrim( Str( nTotalA ) )

// Produto B
@ 11,04 get cProdutoB    picture cMascaraTexto  Valid !Empty( cProdutoB )
@ 11,25 get nQuantidadeB picture nMascaraNumero Valid !Empty( nQuantidadeB ) .and. nQuantidadeB >= 0 .and. nQuantidadeB <= 100
@ 11,32 get nValorB      picture nMascaraValor  Valid !Empty( nValorB ) .and. nValorB > 0
read

nTotalB := nQuantidadeB * nValorB
@ 11,40 say AllTrim( Str( nTotalB ) )

// Produto C
@ 13,04 get cProdutoC    picture cMascaraTexto  Valid !Empty( cProdutoC )
@ 13,25 get nQuantidadeC picture nMascaraNumero Valid !Empty( nQuantidadeC ) .and. nQuantidadeC >= 0 .and. nQuantidadeC <= 100
@ 13,32 get nValorC      picture nMascaraValor  Valid !Empty( nValorC ) .and. nValorC > 0
Read

nTotalC := nQuantidadeC * nValorC
@ 13,40 say AllTrim( Str( nTotalC ) )

nSubtotal := nTotalA + nTotalB + nTotalC
nTotalItens := nQuantidadeA + nQuantidadeB + nQuantidadeC

@ 16,15 say AllTrim( Str( nSubtotal ) )
@ 16,42 say AllTrim( Str( nTotalItens ) )

// finalizndo compra
dEntrega := dCompra + 3

@ 19,12 get cEndereco    picture cMascaraTexto Valid !Empty( cEndereco )
@ 20,19 get dEntrega                           Valid !Empty( dEntrega ) .and. !(dEntrega < (Date() + 3))
read

@ 10,52 clear to 10,78
@ 05,52 to 05,78
@ 09,52 to 09,78

@ 11,52 to 11,78
@ 13,52 to 13,78

@ 16,51 to 21,79 double

@ 03,52 say "Nome: " + cCliente
@ 04,52 say "Idade: " + AllTrim( Str( nIdade ) )
@ 06,52 say "Lista de Produtos"
@ 08,53 say "Item"
@ 08,66 say "QTD"
@ 08,72 say "Valor"

@ 10,52 say "1." + AllTrim( cProdutoA )
@ 12,52 say "2." + AllTrim( cProdutoB )
@ 14,52 say "3." + AllTrim( cProdutoC )

@ 10,65 say Str( nTotalA )
@ 12,65 say Str( nTotalB )
@ 14,65 say Str( nTotalC )

@ 10,67 say AllTrim( Str( nQuantidadeA ) )
@ 12,67 say AllTrim( Str( nQuantidadeB ) )
@ 14,67 say AllTrim( Str( nQuantidadeC ) )

@ 17,52 say "Data da compra: " + DToC(dCompra) 
@ 18,52 say "Data de entrega: " + DToC(dEntrega) 
@ 19,52 say "Endereco:"
@ 20,52 say cEndereco

inkey(0)
