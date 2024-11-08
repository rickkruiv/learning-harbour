// HENRIQUE FERREIRA POLIZER
clear

Set Date to British
Set epoch to 1945
Set message to 23 Center
Set Wrap On

cUsuarioAcesso := "HENRIQUE"
cSnehaAcesso   := "Senha1234*"

nPedido     := 0

// produtos

nCodigoAmoraPreta      := 5500
cDescricaoAmoraPreta   := "AMORA PRETA"
nPrecoAmoraPreta       := 1.50
nDescontoMaxAmoraPreta := 12
nEstoqueAmoraPreta     := 110.00


nCodigoUvaRubi      := 7744
cDescricaoUvaRubi   := "UVA RUBI"
nPrecoUvaRubi       := 8
nDescontoMaxUvaRubi := 11
nEstoqueUvaRubi     := 198.50


nCodigoPepino      := 4445
cDescricaoPepino   := "PEPINO"
nPrecoPepino       := 3.99
nDescontoMaxPepino := 2
nEstoquePepino     := 445.00


nCodigoMorango      := 6565
cDescricaoMorango   := "MORANGO"
nPrecoMorango       := 15.49
nDescontoMaxMorango := 6
nEstoqueMorango     := 200.00

nTotal := 0

do while .t.

   cUsuario := Space(20)
   cSenha   := Space(20)

   lUsuarioValido := .f.
   lSenhaValida   := .f.

   @ 00,00 clear to 24,79
   @ 00,00 to 24,79 double
   @ 02,01 to 02,78

   @ 01,02 say "FRUTARIA HENRIQUE"

   @ 03,02 say "LOGIN"
   @ 05,02 say "USUARIO..: "
   @ 07,02 say "SENHA....: "

   @ 05,13 get cUsuario picture "@!" Valid !Empty( cUsuario )
   @ 07,13 get cSenha                Valid !Empty( cSenha )
   read

   if LastKey() == 27 

      nEscolha := Alert("SAIR", {"SIM", "NAO"})

      if nEscolha == 1

         clear
         exit
         
      endif
      loop  
   endif
   
   if AllTrim(cUsuario) == cUsuarioAcesso

      lUsuarioValido := .t.
         
   endif

   if AllTrim(cSenha) == cSnehaAcesso

      lSenhaValida := .t.

   endif

   if !lUsuarioValido .or. (!lSenhaValida .and. !lUsuarioValido)

      nEscolha := Alert("USUARIO INVALIDO", {"OK"})
      loop

   elseif !lSenhaValida
   
      nEscolha := ALert("SENHA INVALIDA", {"OK"})
      loop
   
   else

      do while .t.
         
         cCliente       := Spac( 30 )
         nLimiteCredito := 0
         dPedido        := Date()
         
         nQuantidadeAmoraPreta := 0
         nQuantidadeMorango    := 0
         nQuantidadePepino     := 0
         nQuantidadeUvaRubi    := 0
         
         nLinha := 10
         
         @ 03,01 clear to 23,78

         if LastKey() == 27 

            nOpcao := 2

         endif

         nOpcao := 1

         @ 04,02 prompt "EFETUAR PEDIDOS" message "EFETUAR NOVOS PEDIDOS"
         @ 06,02 prompt "SAIR" message "DESCONECTAR"
         menu to nOpcao

         if nOpcao == 1
            
            nPedido ++

            @ 03,01 clear to 23,78
            
            @ 03,02 say "NUMERO DO PEDIDO: " + AllTrim(Transform(nPedido, "999"))
            @ 05,02 say "CLIENTE: "
            @ 07,02 say "LIMITE DE CREDITO: "
            @ 07,50 say "DATA DO PEDIDO: "

            @ 05,11 get cCliente       picture "@!"           Valid !Empty( cCliente )
            @ 07,21 get nLimiteCredito picture "@E 99,999.99" Valid !Empty( nLimiteCredito ) .and. nLimiteCredito > 0
            @ 07,67 get dPedido                               Valid !Empty( dPedido ) .and. dPedido <= Date()
            read

            @ 10,02 say "CODIGO"
            @ 10,11 say "DESCRICAO"
            @ 10,23 say "QTDe"
            @ 10,30 say "PRECO Un"
            @ 10,41 say "%DESC"
            @ 10,49 say "TOTAL"

            do while .t.

               nLinha += 2

               if nLinha > 20
                  @ 12,01 clear to 22,78
                  nLinha := 12
               endif
               
               cDescricao        := ''
               nCodigo           := 0
               nPreco            := 0
               nDescontoMax      := 0
               nEstoque          := 0
               nDesconto         := 0
               nQuantidadePedido := 0
               
               if LastKey() == 27 

                  nEscolha := Alert("DESEJA:", {"FINALIZAR", "CONTINUAR", "ABANDONAR"})

                  if nOpcao == 1

                     if nTotal > nLimiteCredito

                        nEscolha := Alert("CREDITO INSUFICIENTE", {"OK"})
                        exit
                     else

                        @ 04,01 clear to 23,78

                        @ 05,02 say "CLIENTE: " + AllTrim( cCliente )
                        @ 07,02 say "DATA DO PEDIDO: " + DToC(dPedido)
                        @ 09,02 say "VALOR DO PEDIDO: R$" + AllTrim(Transform(nTotal, "@E 99.999,99"))
                        @ 11,02 say "DESCRICAO DO PEDIDO"
                        @ 13,02 say "AMORA PRETA..: " + AllTrim(Str(nQuantidadeAmoraPreta)) + "Un"
                        @ 14,02 say "UVA RUBI.....: " + AllTrim(Str(nQuantidadeUvaRubi)) + "Un"
                        @ 15,02 say "PEPINO.......: " + AllTrim(Str(nQuantidadePepino)) + "Un"
                        @ 16,02 say "MORANGO......: " + AllTrim(Str(nQuantidadeMorango)) + "Un"

                        inkey(0)
                        exit
                     endif

                  elseif nEscolha == 2

                     nPedido --
                     loop

                  elseif nEscolha == 3

                     nPedido --
                     
                     nEstoqueAmoraPreta += nQuantidadeAmoraPreta
                     nEstoqueMorango    += nQuantidadeMorango
                     nEstoquePepino     += nQuantidadePepino
                     nEstoqueUvaRubi    += nQuantidadeUvaRubi
         
                     exit
                     
                  endif

               endif

               @ nLinha,02 get nCodigo picture "9999"   Valid !Empty( nCodigo )
               read

               if nCodigo == nCodigoAmoraPreta

                  cDescricao   := cDescricaoAmoraPreta
                  nPreco       := nPrecoAmoraPreta
                  nDescontoMax := nDescontoMaxAmoraPreta 
                  nEstoque     := nEstoqueAmoraPreta

               elseif nCodigo == nCodigoMorango

                  cDescricao   := cDescricaoMorango
                  nPreco       := nPrecoMorango
                  nDescontoMax := nDescontoMaxMorango
                  nEstoque     := nEstoqueMorango

               elseif nCodigo == nCodigoPepino

                  cDescricao   := cDescricaoPepino
                  nPreco       := nPrecoPepino
                  nDescontoMax := nDescontoMaxPepino 
                  nEstoque     := nEstoquePepino

               elseif nCodigo == nCodigoUvaRubi

                  cDescricao   := cDescricaoUvaRubi
                  nPreco       := nPrecoUvaRubi
                  nDescontoMax := nDescontoMaxUvaRubi
                  nEstoque     := nEstoqueUvaRubi

               elseif Empty( nCodigo )

                  loop

               else

                  nEscolha := Alert("CODIGO INVALIDO. TENTE NOVAMENTE")
                  nLinha -=2
                  loop

               endif

               @ nLinha,11 say cDescricao
               @ nLinha,30 say AllTrim(Transform(nPreco, "@E 99.99"))

               @ nLinha,23 get nQuantidadePedido picture "999"    Valid !Empty( nQuantidadePedido ) .and. nQuantidadePedido > 0
               read

               if nQuantidadePedido > nEstoque

                  nEscolha := Alert("ESTOQUE INSUFICIENTE", {"OK"})
                  nLinha -= 2
                  loop

               else

                  if nCodigo == nCodigoAmoraPreta

                     nEstoqueAmoraPreta -= nQuantidadePedido
                     nQuantidadeAmoraPreta := nQuantidadePedido
                  
                  elseif nCodigo == nCodigoMorango

                     nEstoqueMorango -= nQuantidadePedido
                     nQuantidadeMorango := nQuantidadePedido

                  elseif nCodigo == nCodigoPepino

                     nEstoquePepino -= nQuantidadePedido
                     nQuantidadePepino := nQuantidadePedido

                  elseif nCodigo == nCodigoUvaRubi

                     nEstoqueUvaRubi -= nQuantidadePedido
                     nQuantidadeUvaRubi := nQuantidadePedido

                  endif

               endif

               @ nLinha,41 get nDesconto   picture "@E 999.99%" Valid nDesconto >= 0 .and. nDesconto <= 100
               read

               if nDesconto > nDescontoMax 

                  nEscolha := Alert("ACIMA DO DESCONTO MAXIMO PERMITIDO DE " + AllTrim(Transform(nDescontoMax, "@E 999.99%")), {"OK"} )
                  nLinha -= 2
                  loop
               
               endif

               nSubTotal := nQuantidadePedido * nPreco - (nQuantidadePedido * nPreco * nDesconto/100)
               nTotal    += nSubTotal

               @ nLinha,49 say AllTrim(Transform(nSubTotal, "@E 9,999.99"))

               @ 23,02 say "TOTAL: " + AllTrim(Transform( nTotal, "@E 99,999.99" ))

            enddo

         elseif nOpcao == 2

            nEscolha := Alert("SAIR", {"SIM", "NAO"})
            if nEscolha == 1
               
               exit

            endif

            loop

         endif
         
      enddo
      
   endif   
enddo