clear

Set Date to British
Set Epoch to 1945
Set message to 24 center

cUsuarioAcesso := "HENRIQUE"
cSenhaAcesso   := "Senha123"
dAtual         := Date()

nCodigoBananaPrata    := 3500
cDescricaoBananaPrata := 'BANANA PRATA'
nPrecoBananaPrata     := 1.50
nEstoqueBananaPrata   := 120.00
nDescBananaPrata      := 0.19

nCodigoPeraArgentina  := 4501
cDescricaoPeraArgentina:= 'PERA ARGENTINA'
nPrecoPeraArgentina   := 9.00
nEstoquePeraArgentina := 100.50
nDescPeraArgentina    := 0.17

nCodigoBatataPeruana  := 7001
cDescricaoBatataPeruana:= 'BATATA PERUANA'
nPrecoBatataPeruana   := 12.00
nEstoqueBatataPeruana := 895.00
nDescBatataPeruana    := 0.02

nCodigoAbacateNegro   := 6002
cDescricaoAbacateNegro:= 'ABACATE NEGRO'
nPrecoAbacateNegro    := 12.99
nEstoqueAbacateNegro  := 280.00
nDesAbacateNegro      := 0.08

do while .t.

   nPedido := 0
   cUsuario       := Space( 20 )
   cSenha         := Space( 20 )
   lSenhaValida   := .f.
   lUsuarioValido := .f.

   @ 01,02 say "FRUTARIA"
   @ 03,02 say "LOGIN"
   @ 05,02 say "USUARIO..: "
   @ 07,02 say "SENHA....: "

   @ 05,13 get cUsuario picture "@!" Valid !Empty( cUsuario )
   @ 07,13 get cSenha                Valid !Empty( cSenha )
   read

   if LastKey() == 27

      nEscolha := Alert("DESEJA SAIR?", {"SIM", "NAO"})
      if nEscolha == 1
         clear
         exit
      endif
      loop

   endif

   if AllTrim(cSenha) == cSenhaAcesso

      lSenhaValida := .t.

   endif

   if AllTrim(cUsuario) == cUsuarioAcesso

      lUsuarioValido := .t.

   endif

   if !lUsuarioValido .or. (!lUsuarioValido .and. !lSenhaValida)

      nEescolha := Alert("USUARIO INVALIDO", {"OK"})
      loop
      
   elseif !lSenhaValida

      nEescolha := Alert("SENHA INVALIDA", {"OK"})
      loop
      
   elseif lSenhaValida .and. lUsuarioValido

      do while .t.
         
         cCliente       := Space( 30 )
         cDescricao     := ''
         dPedido        := CToD('') 
         
         nLimiteCredito := 0
         nCodigo        := 0
         nQuantidade    := 0
         nPreco         := 0
         nDesconto      := 0
         nComissao      := 0
         nSutotal       := 0
         
         @ 03,01 clear to 23,78
         
         @ 05,02 prompt "EFETUAR PEDIDOS" message "EFETUAR PEDIDOS"
         @ 07,02 prompt "SAIR" message "DESLOGAR"
         menu to nOpcao
         
         if nOpcao == 1

            nPedido++
            
            @ 03,01 clear to 23,78
            @ 03,02 say "PEDIDO: " + AllTrim(Str( nPedido ))
         
            @ 05,02 say "CLIENTE: "
            @ 07,02 say "LIMITE DE CREDITO: "
            @ 07,45 say "DATA PEDIDO: "
            @ 09,02 say "CODIGO DESCRICAO      QUANTIDADE  PRECO    DESCONT%   COMISSAO   SUBTOTAL"

            @ 05,11 get cCliente       picture "@!"          Valid !Empty( cCliente )
            @ 07,21 get nLimiteCredito picture "@E 9,999.99" Valid !Empty( nLimiteCredito ) .and. nLimiteCredito >= 0
            @ 07,58 get dPedido                              Valid !Empty( dPedido ) .and. dPedido <= dAtual
            read

            @ 11,02 get nCodigo     picture "9999" Valid !Empty( nCodigo )
            read

            if nCodigo == nCodigoAbacateNegro

               cDescricao := cDescricaoAbacateNegro
               nPreco     := nPrecoAbacateNegro

            elseif nCodigo == nCodigoBananaPrata

               cDescricao := cDescricaoBananaPrata
               nPreco     := nPrecoBananaPrata

            elseif nCodigo == nCodigoBatataPeruana

               cDescricao := cDescricaoBatataPeruana
               nPreco     := nPrecoBatataPeruana

            elseif nCodigo == nCodigoPeraArgentina
               
               cDescricao := cDescricaoPeraArgentina
               nPreco     := nPrecoPeraArgentina

            else 

               nEscolha := Alert("CODIGO INVALIDO", {"OK"})
               loop

            endif

            @ 11,08 say cDescricao
            @ 11,35 say AllTrim(Transform(nPreco, "@E 999.99"))

            @ 11,28 get nQuantidade picture "999"     Valid !Empty( nQuantidade )
            @ 11,45 get nDesconto   picture "@E 999%" Valid nDesconto >= 0 .and. nDesconto <= 100 
            @ 11,55 get nComissao   picture "@E 999%" Valid nComissao >= 0 .and. nComissao <= 100  
            read
         else
            @ 24,01 clear to 24,78
            exit
         endif
         
      enddo
      
   endif

enddo