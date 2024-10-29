Clear

nCodigo := 0
cProduto := Space(16)
cClassificacao := ""

@ 00,00 to 06,60 double
@ 02,01 to 02,59

@ 04,01 to 04,49
@ 03,09 to 05,09 
@ 03,26 to 05,26

@ 01,22 say "Controle de Itens"
@ 03,02 say "Codigo"
@ 03,10 say "Produto"
@ 03,27 say "Classificacao"

@ 05,01 get nCodigo  picture "99" Valid !Empty( nCodigo )
@ 05,10 get cProduto picture "@!" Valid !Empty( cProduto )
Read

if nCodigo == 1 
   cClassificacao := "Alimento nao-perecivel"
else 
   if nCodigo <= 4
      cClassificacao := "Alimento perecivel"
   else 
      if nCodigo <= 6 
         cClassificacao := "Vestuario"
      else
         if nCodigo == 7 
            cClassificacao := "Higiene pessoal"
         else 
            if nCodigo <= 15
               cClassificacao := "Limpeza e utensilios domesticos"
            endif
         endif
      endif
   endif
endif

@ 05,27 say AllTrim( cClassificacao )

Inkey(0)
