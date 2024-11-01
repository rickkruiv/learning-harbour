Clear
Set Date To British
Set Century On


// Máscaras
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

Do While .T.
// Variáveis
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

   @ 01,18 Say "SUPERMERCADAO"

   @ 03,02 Say "Cliente: "
   @ 05,02 Say "Idade: "
   @ 05,15 Say "Data: "

   @ 07,02 Say "Descricao"
   @ 07,25 Say "QTD"
   @ 07,31 Say "Valor"
   @ 07,41 Say "Total"

   @ 09,02 Say "1."
   @ 11,02 Say "2."
   @ 13,02 Say "3."

   @ 16,02 Say "Valor total: "
   @ 16,30 Say "QTD. Itens:"

   @ 19,02 Say "Endereco:"
   @ 20,02 Say "Data de Entrega:"

   @ 01,60 Say "Nota fiscal"
   @ 10,53 Say "Aguardando preenchimento."

   // Cliente, idade, data
   @ 03,10 Get cCliente     Picture cMascaraTexto  Valid !Empty( cCliente )
   @ 05,09 Get nIdade       Picture nMascaraNumero Valid !Empty( nIdade ) .And. nIdade >= 18
   @ 05,21 Get dCompra                           Valid !(dCompra < Date())
   @ 09,04 Get cProdutoA    Picture cMascaraTexto  Valid !Empty( cProdutoA )
   @ 09,25 Get nQuantidadeA Picture nMascaraNumero Valid !Empty( nQuantidadeA ) .And. nQuantidadeA >= 0 .And. nQuantidadeA <= 100
   @ 09,32 Get nValorA      Picture nMascaraValor  Valid !Empty( nValorA ) .And. nValorA > 0
   @ 11,04 Get cProdutoB    Picture cMascaraTexto  Valid !Empty( cProdutoB )
   @ 11,25 Get nQuantidadeB Picture nMascaraNumero Valid !Empty( nQuantidadeB ) .And. nQuantidadeB >= 0 .And. nQuantidadeB <= 100
   @ 11,32 Get nValorB      Picture nMascaraValor  Valid !Empty( nValorB ) .And. nValorB > 0
   @ 13,04 Get cProdutoC    Picture cMascaraTexto  Valid !Empty( cProdutoC )
   @ 13,25 Get nQuantidadeC Picture nMascaraNumero Valid !Empty( nQuantidadeC ) .And. nQuantidadeC >= 0 .And. nQuantidadeC <= 100
   @ 13,32 Get nValorC      Picture nMascaraValor  Valid !Empty( nValorC ) .And. nValorC > 0
   read
   
   nTotalA := nQuantidadeA * nValorA
   @ 09,40 Say AllTrim( Str( nTotalA ) )
   nTotalB := nQuantidadeB * nValorB
   @ 11,40 Say AllTrim( Str( nTotalB ) )
   nTotalC := nQuantidadeC * nValorC
   @ 13,40 Say AllTrim( Str( nTotalC ) )
   
   nSubtotal := nTotalA + nTotalB + nTotalC
   nTotalItens := nQuantidadeA + nQuantidadeB + nQuantidadeC
   
   @ 16,15 Say AllTrim( Str( nSubtotal ) )
   @ 16,42 Say AllTrim( Str( nTotalItens ) )

   // Finalizando compra
   dEntrega := dCompra + 3

   @ 19,12 Get cEndereco    Picture cMascaraTexto Valid !Empty( cEndereco )
   @ 20,19 Get dEntrega                           Valid !Empty( dEntrega ) .And. !(dEntrega < (Date() + 3))
   Read

   If LastKey() == 27
      
      nEscolha := Alert("O QUE DESEJA?", {"CONTINUAR", "CANCELAR", "SAIR"})

      If nEscolha == 3
         Clear
         Exit
      ElseIf nEscolha == 2 
         Loop
      EndIf

   EndIf

   @ 10,52 Clear To 10,78
   @ 05,52 To 05,78
   @ 09,52 To 09,78

   @ 11,52 To 11,78
   @ 13,52 To 13,78

   @ 16,51 To 21,79 Double
   
   @ 03,52 Say "Nome: " + cCliente
   @ 04,52 Say "Idade: " + AllTrim( Str( nIdade ) )
   @ 06,52 Say "Lista de Produtos"
   @ 08,53 Say "Item"
   @ 08,66 Say "QTD"
   @ 08,72 Say "Valor"

   @ 10,52 Say "1." + AllTrim( cProdutoA )
   @ 12,52 Say "2." + AllTrim( cProdutoB )
   @ 14,52 Say "3." + AllTrim( cProdutoC )

   @ 10,65 Say Str( nTotalA )
   @ 12,65 Say Str( nTotalB )
   @ 14,65 Say Str( nTotalC )

   @ 10,67 Say AllTrim( Str( nQuantidadeA ) )
   @ 12,67 Say AllTrim( Str( nQuantidadeB ) )
   @ 14,67 Say AllTrim( Str( nQuantidadeC ) )

   @ 17,52 Say "Data da compra: " + DToC(dCompra) 
   @ 18,52 Say "Data de entrega: " + DToC(dEntrega) 
   @ 19,52 Say "Endereco:"
   @ 20,52 Say cEndereco

   If LastKey() == 27
         
      nEscolha := Alert("SAIR", {"SIM","NAO"})

      If nEscolha == 1 
         Clear
         Exit
      EndIf
   EndIf

EndDo
