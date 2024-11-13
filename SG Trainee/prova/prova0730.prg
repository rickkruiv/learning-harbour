// HENRIQUE FERREIRA POLIZER

clear 
Set Epoch to 1945
Set Date to British
Set message to 23 Center
Set Wrap On

cUsuarioAcesso := "ADMIN"
cSenhaAcesso   := "123mudar"
cSupervisorUsuarioAcesso := "SUPERVISOR"
cSupervisorSenhaAcesso   := "123LIBERA"

nOrdemServico := 0
nAcrecimo     := 0
nDesconto     := 0
nGarantia     := 0

cMascaraTexto := "@!"

lLiberado := .t.

do while .t.
   
   cUsuario := Space( 20 )
   cSenha   := Space( 20 )
   
   lUsuarioValido := .t.
   lSenhaValida   := .t.
   
   @ 00,00 clear to 24,78
   @ 00,00 to 24,78 double

   @ 01,02 say "ASSISTENCIA TECNICA"

   @ 03,02 say "LOGIN"
   @ 05,02 say "USUARIO..: "
   @ 07,02 say "SENHA....:"

   @ 05,13 get cUsuario Valid !Empty( cUsuario )
   @ 07,13 get cSenha   Valid !Empty( cSenha ) Color("W/W")
   read

   if LastKey() == 27
      nEscolha := Alert("SAIR?", {"SIM","NAO"})

      if nEscolha == 1

         clear
         exit

      endif

      loop

   endif

   
   if AllTrim(cUsuario) == cUsuarioAcesso

      lUsuarioValido := .t.
         
   endif

   if AllTrim(cSenha) == cSenhaAcesso

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

         cCliente             := Space( 40 )
         cAtendente           := Space( 30 )
         cDescricaoEquipamento:= Space( 40 )
         cReferencia          := Space( 20 )
         cEndereco            := Space( 20 )
         cBairro              := Space( 20 )
         cUsuarioSupervisor   := Space( 15 )
         cSenhaSupervisor     := Space( 15 )
         cEntregarDomicilio   := Space( 1 ) 
         cTipoContrato        := Space( 1 )
         cFormaDePagamento    := Space( 1 )
         dServico             := CToD("")
         dCompra              := CToD("")
         nValorCompra         := 0
         nLimiteCredito       := 0
         nTelefone            := 0
         nTotal               := 0
         nTotalComissao       := 0

         cCNPJ       := Space( 14 )
         nNumeroNota := 0
         dNota       := Date()

         lSupervisorValido        := .f.
         lSupervisorSenhaValida   := .f.
         lFinalizado              := .t.

         @ 02,01 clear to 23,78

         if LastKey() == 27
            nOpcao := 2
         endif

         @ 03,02 prompt "EFETUAR PEDIDOS" message "NOVO PEDIDO"
         @ 05,02 prompt "SAIR" message "DESCONECTAR"
         menu to nOpcao

         if nOpcao == 1

            @ 02,01 clear to 23,78
            nOrdemServico++

            @ 03,02 say "ORDEM DO SERVICO......: " + AllTrim(Transform(nOrdemServico, "99999999"))
            @ 05,02 say "NOME CLIENTE..........:" 
            @ 06,55 say "DATA SERVICO:"
            @ 07,02 say "NOME ATENDENTE........:"
            @ 09,02 say "DESCRICAO EQUIPAMENTO.:"
            @ 10,55 say "DATA COMPRA.: "
            @ 11,02 say "ENTREGAR A DOMICILIO..:     [S]SIM [N]NAO"
            @ 11,45 say "LIMITE DE CREDITO.....:"
            
            @ 05,26 get cCliente              picture cMascaraTexto  Valid !Empty( cCliente )
            @ 06,70 get dServico                                     Valid !Empty( dServico )
            @ 07,26 get cAtendente            picture cMascaraTexto  Valid !Empty( cAtendente )
            @ 09,26 get cDescricaoEquipamento picture cMascaraTexto  Valid !Empty( cDescricaoEquipamento )
            @ 10,69 get dCompra                                      Valid !Empty( dCompra ) .and. dCompra <= Date()
            @ 11,26 get cEntregarDomicilio    picture cMascaraTexto  Valid !Empty( cEntregarDomicilio )  .and. cEntregarDomicilio $ "S" .or. cEntregarDomicilio $ "N"
            @ 11,69 get nLimiteCredito        picture "@E 99,999.99" Valid !Empty( nLimiteCredito ) .and. nLimiteCredito > 0
            read
            
            if cEntregarDomicilio $ "S"
               
               @ 13,02 say "ENDERECO..............:"
               @ 14,02 say "BAIRRO................:"
               @ 15,02 say "REFERENCIA............:"
               @ 16,02 say "TELEFONE..............:"

               @ 13,26 get cEndereco   picture cMascaraTexto         Valid !Empty( cEndereco )
               @ 14,26 get cBairro     picture cMascaraTexto         Valid !Empty( cBairro )
               @ 15,26 get cReferencia picture cMascaraTexto         Valid !Empty( cReferencia )
               @ 16,26 get nTelefone   picture "@E (99) 9 9999-9999" Valid !Empty( nTelefone)
               read

               nAcrecimo += 3

            endif

            @ 02,01 clear to 23,78
            @ 03,02 say "[P]PRODUTO [S]SERVICO"
            @ 04,02 say "TIPO DE CONTRATO: "

            @ 04,20 get cTipoContrato picture cMascaraTexto Valid !Empty( cTipoContrato ) .and. cTipoContrato $ "S" .or. cTipoContrato $ "P"
            read

            // ========================================================================================================================== produto
            if cTipoContrato $ "P"
               nGarantia   := 2
               nLinha      := 07
               lFinalizado := .f.
               
               @ 05,02 say "PRODUTO"
               @ 07,02 say "DESCRICAO                      QTDe   PRECO UNI   %DESC    VALOR"
               @ 05,24 say "GARANTIA DE " + AllTrim(Str(nGarantia)) + "ANOS"
               
               do while .t.

                  nTotal += nValorCompra
                  @ 23,02 say "TOTAL: " + AllTrim(Transform(nTotal, "@E 999,999.99"))

                  cDescricaoProduto    := Space( 30 )
                  nQuantidadeProduto   := 0
                  nPrecoProduto        := 0
                  nDescontoOferecido   := 0
                  nValorCompra         := 0

                  if nLinha >= 21

                     nLinha := 07

                  endif

                  nLinha+= 2
                  @ nLinha,02 get cDescricaoProduto  picture cMascaraTexto   Valid !Empty( cDescricaoProduto ) 
                  @ nLinha,33 get nQuantidadeProduto picture "99"            Valid !Empty( nQuantidadeProduto ) .and. nQuantidadeProduto > 0
                  @ nLinha,40 get nPrecoProduto      picture "@E R$9,999.99" Valid !Empty( nPrecoProduto ) 
                  @ nLinha,52 get nDescontoOferecido picture "@E 999.99%"    Valid nDescontoOferecido >= 0 .and. nDescontoOferecido <= 100
                  read
                  
                  if LastKey() == 27
                     nEscolha := Alert("FINALIZAR?", {"SIM","NAO"})
                     if nEscolha == 1
                        lFinalizado := .t.
                        exit
                     endif
                     loop
                     nLinha-=2
                  endif

                  nValorCompra := nQuantidadeProduto * nPrecoProduto
                  nValorCompra -= (nValorCompra * nDescontoOferecido/100)
                  
                  @ nlinha,61 say nValorCompra

               enddo

               // ========================================================================================================================== servico
            elseif cTipoContrato $ "S"
               nGarantia   := 1
               nLinha      := 07
               lFinalizado := .f.
                              
               @ 05,02 say "SERVICO"
               @ 05,24 say "GARANTIA DE " + AllTrim(Str(nGarantia)) + "ANO"
               @ 07,02 say "DESCRICAO                         PRECO     %DESC     COMICAO    VALOR"

               do while .t.

                  nTotal += nValorCompra
                  @ 23,02 say "TOTAL: " + AllTrim(Transform(nTotal, "@E 999,999.99"))

                  cDescricaoServico    := Space( 25 )
                  nPrecoServico        := 0
                  nDescontoOferecido   := 0
                  nComicao             := 0
                  nValorCompra         := 0

                  if nLinha >= 21

                     nLinha := 07

                  endif

                  nLinha+= 2
                  @ nLinha,02 get cDescricaoServico  picture cMascaraTexto   Valid !Empty( cDescricaoServico ) 
                  @ nLinha,32 get nPrecoServico      picture "@E R$9,999.99" Valid !Empty( nPrecoServico ) 
                  @ nLinha,45 get nDescontoOferecido picture "@E 999.99%"    Valid nDescontoOferecido >= 0 .and. nDescontoOferecido <= 100
                  @ nLinha,56 get nComicao           picture "@E 999.99%"    Valid nComicao >= 0 .and. nComicao <= 100
                  read

                  if nComicao > 0

                     nTotalComissao += nComicao
                     
                  endif
                  
                  if LastKey() == 27
                     nEscolha := Alert("FINALIZAR?", {"SIM","NAO"})
                     if nEscolha == 1
                        lFinalizado := .t.
                        exit
                     endif
                     loop
                     nLinha-=2
                  endif

                  nValorCompra := nPrecoServico
                  nValorCompra -= (nValorCompra * nDescontoOferecido/100) - (nValorCompra * nComicao/100)
                  
                  @ nlinha,61 say nValorCompra

               enddo

            endif

            if lFinalizado
               // ========================================================================================================================== supervisor
               if nLimiteCredito > nValorCompra
                  @ 02,01 clear to 23,78
                  do while .t.

                     @ 03,02 say "APROVACAO SUPERTVISOR"
                     @ 05,02 say "LOGIN..:"
                     @ 07,02 say "SENHA..:"

                     @ 05,11 get cUsuarioSupervisor Valid !Empty( cUsuarioSupervisor )
                     @ 07,11 get cSenhaSupervisor   Valid !Empty( cSenhaSupervisor ) Color("W/W")
                     read
               
                     if LastKey() == 27
                        nEscolha := Alert("sair?", {"SIM", "NAO"})
                        if nEscolha == 1
                           exit
                        endif
                        loop
                     endif

                     if AllTrim(cUsuarioSupervisor) == cSupervisorUsuarioAcesso

                        lSupervisorValido := .t.
         
                     endif

                     if AllTrim(cSenhaSupervisor) == cSupervisorSenhaAcesso

                        lSupervisorSenhaValida := .t.

                     endif

                     if !lSupervisorValido .or. (!lSupervisorSenhaValida .and. !lSupervisorValido)

                        nEscolha := Alert("USUARIO INVALIDO", {"OK"})
                        loop

                     elseif !lSupervisorSenhaValida
   
                        nEscolha := ALert("SENHA INVALIDA", {"OK"})
                        loop

                     endif

                     nEscolha := Alert("LIBERAR?", {"SIM", "NAO"})
                     if nEscolha == 2
                        lLiberado := .f.
                        exit
                     endif
                     
                     lLiberado := .t.
                     exit

                  enddo
               endif

               if lLiberado

                  @ 02,01 clear to 23,78

                  @ 03,02 say "FORMA DE PAGAMENTO..: "
                  @ 05,02 say "[D]Dinheiro  [E]CHEQUE  [A]CARTAO"

                  @ 03,24 get cFormaDePagamento picture cMascaraTexto Valid !Empty(cFormaDePagamento) .and. cFormaDePagamento $ "D" .or. cFormaDePagamento $ "E" .or. cFormaDePagamento $ "A"
                  read

                  if ( Year(Date()) - Year(dCompra) ) <= nGarantia

                     @ 05,02 say "GRANTIA COBRIRA TODO O CONSERTO"
                  
                  else
                     
                     @ 05,02 say "GRANTIA COBRIRA TODO O CONSERTO"

                  endif

                  @ 07,02 say "CNPJ............:"
                  @ 09,02 say "NUMERO DA NOTA..:"
                  @ 11,02 say "DATA DA NOTA....:"

                  @ 07,20 get cCNPJ       picture cMascaraTexto Valid !Empty( cCNPJ ) .and. Len(AllTrim(cCNPJ)) == 14
                  @ 09,20 get nNumeroNota picture "9999999999"  Valid !Empty( nNumeroNota ) .and. Len(AllTrim(nNumeroNota)) == 10
                  @ 11,20 get dNota                             Valid !Empty( dNota ) .and. dNota <= Date()

                  @ 13,02 say "CLIENTE..........: " + AllTrim(cCliente)
                  @ 15,02 say "ATENDENTE........: " + AllTrim(cAtendente)
                  @ 17,02 say "VALOR DA COMPRA..: " + AllTrim(Transform(nTotal, "@E 999.999,99"))

                  inkey(0)
               endif
            endif

         elseif nOpcao == 2

            exit
         
         endif
         
      enddo
      
   endif

enddo