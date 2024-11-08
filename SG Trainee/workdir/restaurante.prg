clear

Set message to 23 center
Set Wrap On

cUsuarioAcesso := "GERENTE"
cSenhaAcesso   := "123"

do while .t.

   cUsuario := Space( 15 )
   cSenha   := Space( 15 )

   lValidarUsuario := .f.
   lValidarSenha   := .f.

   cVerde      := "W/G"
   cVermelho   := "W/R"
   cCorMesa1   := ""
   cCorMesa2   := ""
   cCorMesa3   := ""
   
   lMesa1Livre := .t.
   lMesa2Livre := .t.
   lMesa3Livre := .t.

   nTotal      := 0
   nTotalMesa1 := 0
   nTotalMesa2 := 0
   nTotalMesa3 := 0

   @ 00,00 clear to 24,79
   @ 00,00 to 24,79 double
   @ 02,01 to 02,78 double

   @ 01,28 say "RESTAURANTE SG SISTEMAS"
   @ 03,02 say "LOGIN"
   @ 05,02 say "USUARIO..: "
   @ 07,02 say "SENHA....:"

   @ 05,13 get cUsuario picture "@!" Valid !Empty( cUsuario )
   @ 07,13 get cSenha                Valid !Empty( cSenha )
   read

   if LastKey() == 27 
      nEscolha := Alert("SAIR?", { "SIM", "NAO"})

      if nEscolha == 1

         clear
         exit

      endif
      loop
   endif
   
   if AllTrim( cSenha ) == cSenhaAcesso

      lValidarSenha := .t.

   endif

   if AllTrim( cUsuario ) == cUsuarioAcesso

      lValidarUsuario := .t.

   endif

   if !lValidarUsuario .or. (!lValidarUsuario .and. !lValidarSenha)

      nEscolha := Alert("USUARIO INVALIDO", {"OK"})
      loop
      
   elseif !lValidarSenha 
      
      nEscolha := Alert("SENHA INVALIDA", {"OK"})
      loop

   elseif lValidarUsuario .and. lValidarSenha

      do while .t.

         nMesaEscolhida := 0
         nLinha := 11
         
         @ 03,01 clear to 23,78
         @ 04,01 to 04,78

         @ 03,33 say "ATENDIMENTO"

         if lMesa1Livre == .t.

            cCorMesa1 := cVerde 

         else

            cCorMesa1 := cVermelho

         endif

         if lMesa2Livre == .t.

            cCorMesa2 := cVerde 

         else

            cCorMesa2 := cVermelho

         endif

         if lMesa3Livre == .t.
         
            cCorMesa3 := cVerde 

         else

            cCorMesa3 := cVermelho

         endif

         SetColor(cCorMesa1)
         @ 05,12 say " 1 "  

         SetColor(cCorMesa2)
         @ 05,16 say " 2 "  

         SetColor(cCorMesa3)
         @ 05,20 say " 3 "  

         SetColor("W/N")
         
         @ 05,02 say "MESAS: " 

         @ 05,09 get nMesaEscolhida picture "9" Valid !Empty( nMesaEscolhida )
         read

         if nMesaEscolhida == 1 .and. !(lMesa1Livre)
            nEscolha := Alert("DESEJA:", {"DIGITAR OUTRA MESA","PAGAMENTOS", "CANCELAR PEDIDO"})

            if nEscolha == 1
               loop
            elseif nEscolha == 3 

               if nMesaEscolhida == 1

                  nTotalMesa1 := 0
                  lMesa1Livre  := .t.
   
               elseif nMesaEscolhida == 2
   
                  nTotalMesa2 := 0
                  lMesa2Livre  := .t. 
   
               elseif nMesaEscolhida == 3
   
                  nTotalMesa3 := 0
                  lMesa3Livre  := .t. 
   
               endif

               loop
               
            endif

         endif

         do while .t.
            nMesa       := nMesaEscolhida
            nQuantidade := 0
            nPreco      := 0

            cProduto := Space( 25)

            nLinha += 2

            if nLinha > 21

               nLinha := 13
               
            endif

            @ 10,01 to 10,78

            @ 09,35 say "PEDIDO"
            @ 11,02 say "PRODUTO"
            @ 11,30 say "QTDe"
            @ 11,40 say "PRECO"
            @ 11,50 say "VALOR"

            @ nLinha,02 get cProduto    picture "@!"        Valid !Empty( cProduto )
            @ nLinha,30 get nQuantidade picture "@E 99"     Valid !Empty( nQuantidade ) .and. nQuantidade >= 0
            @ nLinha,40 get nPreco      picture "@E 999.99" Valid !Empty( nPreco ) .and. nPreco >= 0
            read

            if LastKey() == 27

               nEscolha := Alert("DESEJA:", {"ENVIAR PEDIDO", "CONTINUAR", "ABANDONAR"})

               if nEscolha == 1
                  
                  exit
                  
               elseif nEscolha == 2
                  
                  nLinha -= 2
                  loop

               elseif nEscolha == 3

                  if nMesa == 1

                     nTotalMesa1 := 0
                     lMesa1Livre  := .t.
      
                  elseif nMesa == 2
      
                     nTotalMesa2 := 0
                     lMesa2Livre  := .t. 
      
                  elseif nMesa == 3
      
                     nTotalMesa3 := 0
                     lMesa3Livre  := .t. 
      
                  endif

                  exit

               endif
                  


            endif

            nSubTotal := nQuantidade * nPreco
            nTotal    += nSubTotal 

            if nMesa == 1

               nTotalMesa1 := nTotal
               lMesa1Livre  := .f.

            elseif nMesa == 2

               nTotalMesa2 := nTotal
               lMesa2Livre  := .f. 

            elseif nMesa == 3

               nTotalMesa3 := nTotal
               lMesa3Livre  := .f. 

            endif

            @ nLinha,50 say AllTrim(Transform(nSubTotal, "@E R$999.99")) 

            @ 23,02 say "TOTAL: " + AllTrim(Transform(nTotal, "@E R$999.99"))
            
         enddo
         
      enddo
   endif

enddo