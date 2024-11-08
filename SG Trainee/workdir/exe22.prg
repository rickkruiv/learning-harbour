clear
Set Date to British
Set Epoch to 1945
Set message to 23 Center
Set Wrap On

nSaldo := 1000

do while .t.

   @ 00,00 to 24,79 double

   if LastKey() == 27 
      
      nOpcao := 3
      
   endif

   @ 01,02 say "SALDO: R$" + AllTrim(Transform(nSaldo, "@E 9,999.99"))
   
   @ 10,03 prompt "SALDO" message "ALTERAR SALDO"
   @ 12,03 prompt "COMPRAS" message "TELA DE COMPRAS"
   @ 14,03 prompt "SAIR" message "ENCERRAR PROGRAMA"
   menu to nOpcao
   
   if nOpcao == 1
      
      do while .t.

         nRecarga := 0
         nReducao := 0
         
         @ 01,01 clear to 23,78

         if LastKey() == 27 
            
            nOpcao := 3
            
         endif

         @ 01,02 say "SALDO: R$" + AllTrim(Transform(nSaldo, "@E 9,999.99"))

         @ 10,03 prompt "ADICIONAR SALDO" message "ADICIONAL SALDO"
         @ 12,03 prompt "REDUZIR SALDO" message "REDUZIR SALDO"
         @ 14,03 prompt "VOLTAR" message "VOLTAR PARA TELA INICIAL"
         menu to nOpcao     
         
         if nOpcao == 1
            
            @ 01,01 clear to 23,78
            @ 10,03 say "VALOR DA RECARGA: " 
            @ 10,21 get nRecarga picture "@E 9,999.99" Valid nRecarga >= 0
            read
            
            nSaldo += nRecarga

         elseif nOpcao == 2

            if nSaldo == 0
               nEscolha := Alert("SEM SALDO PARA SER REDUZIDO", { "OK" })
               loop
            endif

            @ 01,01 clear to 23,78
            @ 10,03 say "VALOR DA REDUCAO: " 
            @ 10,21 get nReducao picture "@E 9,999.99" Valid nReducao >= 0
            read

            nSaldo -= nReducao

         elseif nOpcao == 3 

            clear
            exit
            
         endif
         
      enddo

   elseif nOpcao == 2

      nLinha      := 03
      nTotal      := 0

      if nSaldo == 0

         nEscolha := Alert("SALDO INSUFICIENTE. FACA UMA RECARGA!", { "OK" })
         loop

      endif

      @ 02,01 clear to 23,78

      @ 03,02 say "PRODUTO"
      @ 03,25 say "QTD"
      @ 03,31 say "VALOR"
      @ 03,39 say "SUBTOTAL"
      
      @ 23,61 say "SALDO: R$" + AllTrim(Transform(nSaldo, "@E 9,999.99"))
      
      do while .t.
         
         cProduto    := Space( 20 )
         nValor      := 0
         nQuantidade := 0
         nSubtotal   := 0
         
         nLinha += 2

         @ nLinha,02 get cProduto    picture "@!"         Valid !Empty( cProduto )
         @ nLinha,26 get nQuantidade picture "99"         Valid !Empty( nQuantidade )
         @ nLinha,30 get nValor      picture "@E 999.99"  Valid !Empty( nValor ) .and. nValor >= nValor
         read

         if LastKey() == 27

            nEscolha := Alert("FINALIZAR?", {"FATURAR", "CONTINUAR", "ABANDONAR"})

            if nEscolha == 1
               
               if nTotal <= nSaldo
                  
                  nSaldo -= nTotal
                  clear
                  exit

               else 
                  
                  nEscolha := Alert("SALDO INSUFICIENTE", {"SAIR"})
                  clear
                  exit

               endif

            elseif nEscolha == 2

               nLinha-=2
               loop

            elseif nEscolha == 3
               
               clear
               exit

            endif

         endif
         
         nSubtotal := nQuantidade * nValor
         
         @ nLinha,40 say AllTrim(Transform(nSubtotal, "@E 9,999.99"))
         
         nTotal += nSubtotal
         
         @ 23,02 say "Total: R$" + AllTrim(Transform(nTotal ,"@E 9,999.99"))

      enddo


   elseif nOpcao == 3

      nEscolha := Alert("DESEJA SAIR?", {"SIM", "NAO"})

      if nEscolha == 1

         clear
         exit

      endif

   endif
enddo