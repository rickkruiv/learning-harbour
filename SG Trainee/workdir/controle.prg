Set Date to British
Set Century On
Set Color to N/W
Clear


do while .t.

   nControle := 0
   nNumeroEntrevistados := 0
   cMaskPorcentagem := "@E 999.99"   
   cMaskRemuneracaoTotal  := '@E 999,999,999.99'

   nSalarioMinimo         := 999.99
   nIdadeMinimaHomem      := 61
   nIdadeMinimaMulher     := 58
   nTempoTrabalhoHomem    := 29
   nTempotrabalhoMulher   := 22
   nTotalAposentados      := 0
   nHomensAposentados     := 0 
   nMulheresAposentadas   := 0
   nValorTotalRemuneracao := 0
   nHomensIdadeAvancada   := 0
   nMulheresAdmitidas     := 0 
   nTotalMulheresIrrf     := 0
   nTotalHomens           := 0
   nTotalMulheres         := 0
   
   cMaskSalario       := "@E 9999.99"
   cMaskEntrevistados := '999'
   cMaskTexto         := "@!"

   @ 00,00 to 24,79 double
   @ 02,01 to 02,78
   @ 04,01 to 04,78

   @ 01,01 say "CONTROLE INSS"
   @ 03,01 say "DIGITE O NUMERO DE EMPREGADOS A SEREM ANALISADOS:"

   @ 03,51 get nNumeroEntrevistados picture cMaskEntrevistados Valid !Empty( nNumeroEntrevistados ) .and. nNumeroEntrevistados > 0
   read

   if LastKey() == 27
      nEScolha := Alert("DESEJA SAIR?", { "NAO", "SIM" }, 1)

      if nEScolha == 2
         
         Set Color to W/N
         Clear
         exit

      endif

      loop

   endif

   do while .t.

      nSalarioBase            := 0
      nValorIRRF              := 0
      nAdicionalNoturno       := 0
      nAdicionalInsalubridade := 0   

      nTaxaAdicional := 0.09
      nTaxaReducao   := 0.03
      nTaxaIrrf      := 0.07
      
      cColaborador := Space( 50 )
      cSexo        := Space(1)

      dNascimento := CToD("")
      dAdmissao  := CToD("")
      dDemissao   := CToD("")

      if nControle >= nNumeroEntrevistados 

         @ 03,01 clear to 23,78

         @ 03,01 say 'TOTAL DE APOSENTADOS..........................: '    + Transform(nTotalAposentados, cMaskEntrevistados)
         @ 05,01 say 'PERCENTUAL DE HOMENS APOSENTADOS..............: '    + Transform(nHomensAposentados, cMaskPorcentagem) + '%'
         @ 07,01 say 'PERCENTUAL DE MULHERES APOSENTADAS............: '    + Transform(nMulheresAposentadas, cMaskPorcentagem) + '%'
         @ 09,01 say 'VALOR TOTAL DA REMUNERACAO....................: R$ ' + AllTrim(Transform(nValorTotalRemuneracao, cMaskRemuneracaoTotal))
         @ 11,01 say 'QUANTIDADE DE HOMENS COM MAIS DE 82 ANOS......: '    + Transform(nHomensIdadeAvancada,cMaskEntrevistados)
         @ 13,01 say 'QUANTIDADE DE MULHERES ADMITIDAS ANTES DE 2002: '    + Transform(nMulheresAdmitidas,cMaskEntrevistados)
         @ 15,01 say 'PERCENTUAL DE MULHERES QUE PAGAM IRRF.........: '    + Transform(nTotalMulheresIrrf,cMaskPorcentagem) + '%'
         
         Inkey(0)
         Clear
         exit
      endif

      @ 05,01 say "COLABORADOR: "
      @ 07,01 say "DATA NASCIMETO: "
      @ 07,35 say "SEXO ( M/F ): "
      @ 09,01 say "DATA ADMISSAO: "
      @ 09,35 say "DATA DEMISSAO: "
      @ 11,01 say "SALARIO BASE: R$"
      @ 11,35 say "VALOR IRRF: R$"
      @ 13,01 say "ADICIONAL NOTURNO (%): "
      @ 13,35 say "ADICIONAL INSALUBRIDADE (%):"

      @ 05,14 get cColaborador            picture cMaskTexto   Valid !Empty( cColaborador )
      @ 07,17 get dNascimento                                  Valid !Empty( dNascimento ) .and. ( Year( Date() ) - Year( dNascimento ) ) >= 15
      @ 07,49 get cSexo                   picture cMaskTexto   Valid !Empty( cSexo ) .and. cSexo $ "F" .or. cSexo $ "M"
      @ 09,16 get dAdmissao                                    Valid !Empty( dAdmissao ) .and. dAdmissao < Date() .and. ( Year(dAdmissao) - Year(dNascimento) ) >= 15
      @ 09,50 get dDemissao                                    Valid !Empty( dDemissao ) .and. dDemissao > dAdmissao
      @ 11,18 get nSalarioBase            picture cMaskSalario Valid !Empty( nSalarioBase ) .and. nSalarioBase > 0
      @ 11,50 get nValorIRRF              picture cMaskSalario Valid nValorIRRF >= 0
      @ 13,24 get nAdicionalNoturno       picture cMaskPorcentagem  Valid !(nAdicionalNoturno > 100)
      @ 13,64 get nAdicionalInsalubridade picture cMaskPorcentagem  Valid !(nAdicionalInsalubridade > 100)
      read

      //salario aposentadoria
      if Year(dAdmissao)  < 2009 .and. Year(dDataDemissao) > 2012

         nAdicionalAnos := nSalarioBase * nTaxaAdicional

      endif 

      if Year(dAdmissao) < 2015 .and. Year(dDataDemissao) > 2018

         nReducaoAnos := nSalarioBase * nTaxaReducao

      endif 

      if nSalarioBase > nValorIRRF

         cPagaIrrf    := 'S'
         nDesontoIrrf := nSalarioBase * nTaxaIrrf

      endif 

      nAdicionalNoturno := (nAdicionalNoturno * nSalarioBase) / 100
      nAdicionalInsalub := (nAdicionalInsalub * nSalarioBase) / 100
      nSalarioBase      := nSalarioBase + nAdicionalNoturno + nAdicionalInsalub + nAdicionalAnos - nReducaoAnos - nDesontoIrrf 
     
      //calculos
      if cSexoColaborador == 'M'

         nTotalHomens ++

         if nIdade >= nIdadeMinimaHomem .and. nTempoTrabalho >= nTempoTrabalhoHomem
            
            nTotalAposentados ++
            nHomensAposentados++
            nValorTotalRemuneracao := nValorTotalRemuneracao + nSalarioBase

         endif 

         if nIdade > 82

            nHomensIdadeAvancada ++

         endif 

      elseif cSexoColaborador == 'F'

         nTotalMulheres ++ 

         if nIdade >= nIdadeMinimaMulher .and. nTempoTrabalho >= nTempotrabalhoMulher

            nTotalAposentados ++
            nMulheresAposentadas ++
            nValorTotalRemuneracao := nValorTotalRemuneracao + nSalarioBase

         endif

         if Year(dAdmissao) < 2002 

            nMulheresAdmitidas ++

         endif 

         if cPagaIrrf == 'S'

            nTotalMulheresIrrf ++

         endif 

      endif 
     

      if LastKey() == 27
         nEScolha := Alert("OQUE DESEJA?", { "CANCELAR", "RETOMAR", "PROCESSAR" },2)
         if nEScolha == 1
   
            Clear
            exit
         
         elseif nEScolha == 3
            
            nControle := nNumeroEntrevistados
            loop
   
         endif
   
         loop
      endif

      nControle ++

   enddo

enddo
