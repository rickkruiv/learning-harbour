// Henrique Ferreira Polizer

Set Color to N/GB
Set Date to British
Set Century On

clear

do while .t.

   nControle                 := 0
   nEntrevistados            := 0
   nOpcao                    := 0
   nHomens                   := 0
   nMulheres                 := 0
   nAposentados              := 0
   nHomensAposentados        := 0 
   nRemuneracaoTotal         := 0
   nMulheresAposentadas      := 0
   nPercenturalHomens        := 0
   nPercenturalMulheres      := 0
   nEntrevistados            := 0
   nMulheresAcima85          := 0
   nHomensAdmitidosAntes2006 := 0
   nMulheresReducao          := 0
   nHomensAdicional          := 0

   dAtual := Date() 

   @ 00,00 to 24,79 double
   @ 02,01 to 02,78
   @ 04,01 to 04,78

   @ 01,32 say "CONTROLE INSS"
   @ 03,01 say "DIGITE O NUMERO  DE ENTREVISTADOS A SEREM ANALISADOS: "

   @ 03,55 get nEntrevistados picture "999" Valid !Empty( nEntrevistados ) .and. nEntrevistados > 0
   read

   if Lastkey() == 27
      nOpcao := Alert("DESEJA SAIR?", { "NAO", "SIM" })

      if nOpcao == 2
         Set Color to W/N
         clear
         exit
      endif
      loop
   endif

   do while .t. 

      cColaborador := Space(54)
      cSexo        := Space(1)
 
      dNascimento := CToD('')
      dAdmissao   := CToD('')
      dDemissao   := CToD('')

      nSalarioBase            := 0
      nAdicionalNoturno       := 0
      nAdicionalInsalubridade := 0
      nAdicional              := 0

      nIdade         := 0
      nAnoAdmissao   := 0
      nAnoDemissao   := 0
      nTempoTrabalho := 0

      lAposentadoria := .f.

      cMascaraTexto       := "@!"
      cMascaraSalario     := "@E 99,999.99"
      cMascaraPorcentagem := "@E 999.9"
      
      if nControle >= nEntrevistados

         @ 03,01 clear to 23,78
         @ 03,01 say "TOTAL DE APOSENTADOS..................................: " + AllTrim(Str( nAposentados ))
         @ 05,01 say "PERCENTUAL DE HOMENS APOSENTADOS......................: " + AllTrim(Transform( nPercenturalHomens, "@E 999.99%" ))
         @ 07,01 say "PERCENTUAL DE MULHERES APOSENTADOS....................: " + AllTrim(Transform( nPercenturalMulheres, "@E 999.99%" ))
         @ 09,01 say "VALOR TOTAL DA REMUNERACAO............................: " + AllTrim(Transform( nRemuneracaoTotal, "@E 99,999.99" ))
         @ 11,01 say "MULHERES ACIMA DE 85 ANOS.............................: " + AllTrim(Str( nMulheresAcima85 ))
         @ 13,01 say "HOMENS ADMITIDOS ANTES DE 2006........................: " + AllTrim(Str( nHomensAdmitidosAntes2006 ))
         @ 15,01 say "QUANTIDADE DE HOMENS QUE RECEBERAM ADICIONAL..........: " + AllTrim(Str( nHomensAdicional))
         @ 17,01 say "QUANTIDADE DE MULHERES QUE RECEBERAM REDUCAO..........: " + AllTrim(Str( nMulheresReducao ))

         Inkey(0)
         clear
         exit
      endif

      @ 05,01 clear to 23,78

      @ 05,01 say "COLABORADOR..........: "
      @ 07,01 say "SEXO (M/F)...........: "
      @ 07,40 say "DATA NASCIMENTO: "
      @ 09,01 say "DATA ADMISSAO........: "
      @ 09,40 say "DATA DEMISSAO..: "
      @ 11,01 say "SALARIO BASE.........: "
      @ 13,01 say "ADICIONAL NOTURNO (%): "
      @ 13,40 say "ADICIONAL INSALUBRIDADE (%):"

      @ 05,24 get cColaborador            picture cMascaraTexto       Valid !Empty( cColaborador )
      @ 07,24 get cSexo                   picture cMascaraTexto       Valid !Empty( cSexo ) .and. cSexo $ "F" .or. cSexo $ "M"
      @ 07,57 get dNascimento                                         Valid !Empty( dNascimento ) .and. (Year(dAtual) - Year(dNascimento)) >= 16
      @ 09,24 get dAdmissao                                           Valid !Empty( dAdmissao ) .and. ((Year(dAtual) - Year(dNascimento)) >= 16) .and. dAdmissao < dAtual
      @ 09,57 get dDemissao                                           Valid !Empty( dDemissao ) .and. dDemissao > dAdmissao .and. dDemissao <= dAtual
      @ 11,24 get nSalarioBase            picture cMascaraSalario     Valid !Empty( nSalarioBase ) .and. nSalarioBase > 0
      @ 13,24 get nAdicionalNoturno       picture cMascaraPorcentagem Valid nAdicionalNoturno >= 0 .and. nAdicionalNoturno <= 100
      @ 13,69 get nAdicionalInsalubridade picture cMascaraPorcentagem Valid nAdicionalNoturno >= 0 .and. nAdicionalInsalubridade <= 100
      read

      // calculos
      nIdade         := Year(dAtual) - Year(dNascimento)
      nAnoAdmissao   := Year( dAdmissao )
      nAnoDemissao   := Year(dDemissao) 
      nTempoTrabalho := nAnoDemissao - nAnoAdmissao

      
      // Aposentadoria e sexo
      if cSexo $ "M" 
         if nIdade >= 59 .and. nTempoTrabalho >= 27

            lAposentadoria := .t.
            nHomensAposentados++
            nAposentados++
            nRemuneracaoTotal += nSalarioBase
         endif

         if nAnoAdmissao < 2006 

            nHomensAdmitidosAntes2006++

         endif
         nHomens ++
         
      elseif cSexo $ "F"
         if nIdade >= 55 .and. nTempoTrabalho >= 22
         
            lAposentadoria := .t.
            nMulheresAposentadas++
            nAposentados++
            nRemuneracaoTotal += nSalarioBase
         endif

         if nIdade >= 85

            nMulheresAcima85++

         endif

         nMulheres ++ 

      endif

      if lAposentadoria
      
         if (nAnoAdmissao <= 2010 .or. nAnoAdmissao <= 2015) .and. (nAnoDemissao >= 2010 .or. nAnoDemissao >= 2015)

            nAdicional += 6

            if cSexo $ "M"

               nHomensAdicional++

            endif

         endif

         if (nAnoAdmissao <= 2012) .and. (nAnoDemissao >= 2020)

            nAdicional -= 2

            if cSexo $ "F"

               nMulheresReducao++

            endif
            
         endif

         nRemuneracaoTotal += (nSalarioBase * (nAdicional/100)) + (nSalarioBase * (nAdicionalInsalubridade/100)) + (nSalarioBase * (nAdicionalNoturno/100))

      endif


      nPercenturalHomens   := (100 * nHomensAposentados) / nEntrevistados 
      nPercenturalMulheres :=  (100 * nMulheresAposentadas) / nEntrevistados 

      if Lastkey() == 27

         nOpcao := Alert("O QUE DESEJA?", { "CANCELAR", "RETORNAR", "PROCESSAR" })

         if nOpcao == 3 

            nControle := nEntrevistados
         
         elseif nOpcao == 1 

            clear
            exit
            
         endif

         loop
   
      endif

      nControle ++

   enddo
   
enddo