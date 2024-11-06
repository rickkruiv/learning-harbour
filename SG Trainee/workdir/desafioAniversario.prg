Clear
Set Date to British
Set Century On

do while .t.

   cNome       := Space( 50 )
   nIdade      := 0


   dAtual      := Date()
   nAnoAtual   := Year( dAtual )
   nMesAtual   := Month( dAtual )
   nDiaAtual   := Day( dAtual )
   dNascimento := CToD("")

   nLinha  := 0
   nColuna := 0

   @ 00,00 to 24,79 double
   @ 02,01 to 02,78

   @ 01,02 say "DESAFIO ANIVERSARIO"
   @ 03,02 say "NOME............: "
   @ 04,02 say "DATA NASCIMENTOS: "

   @ 03,20 get cNome       picture "@!"  Valid !Empty( cNome )
   @ 04,20 get dNascimento               Valid !Empty( dNascimento ) .and. ((Year(Date()) - Year(dNascimento)) <= 125)
   read

   if LastKey() == 27

      nOpcao := Alert("DESEJA SAIR?", { "NAO", "SIM" })

      if nOpcao == 2

         Clear
         exit

      endif
   endif

   nDiaSemanaNascimento   := DoW( dNascimento )
   nDiaNascimento         := Day( dNascimento )
   nMesNascimento         := Month( dNascimento )
   nAnoNascimento         := Year( dNascimento )
   nAnoProximoAniversario := nAnoAtual
   cDiaSemanaNascimento   := ""
   cMesNascimento         := ""
   cIdade                 := ""
   dProximoAniversario    := CToD("")

   // Dias meses

   nDiasMes := Day(CTOD( "01/" + STR( nMesNascimento+1, 2 ) + "/" + STR( nAnoNascimento, 4 ) )-1)
   
   nDiasMesAtual := Day(CTOD( "01/" + STR( nMesAtual+1, 2 ) + "/" + STR( nAnoAtual, 4 ) )-1)

   //mes
   if nMesNascimento == 1

      cMesNascimento := 'JANEIRO'
   
   elseif nMesNascimento == 2
   
      cMesNascimento :=  'FEVERREIRO'
   
   elseif nMesNascimento == 3
   
      cMesNascimento := 'MARCO'
   
   elseif nMesNascimento == 4
   
      cMesNascimento := 'ABRIL'
   
   elseif nMesNascimento == 5
   
      cMesNascimento := 'MAIO'
   
   elseif nMesNascimento == 6
   
      cMesNascimento := 'JUNHO'
   
   elseif nMesNascimento == 7
   
      cMesNascimento := 'JULHO'
   
   elseif nMesNascimento == 8
   
      cMesNascimento := 'AGOSTO'
   
   elseif nMesNascimento == 9 
   
      cMesNascimento := 'SETEMBRO'
   
   elseif nMesNascimento == 10
   
      cMesNascimento := 'OUTUBRO'
   
   elseif nMesNascimento == 11 
   
      cMesNascimento := 'NOVEMBRO '
   
   elseif nMesNascimento == 12
   
      cMesNascimento := 'DEZEMBRO '
   
   endif 

   // Dias semana
   if nDiaSemanaNascimento == 1

      cDiaSemanaNascimento := 'DOMINGO'
   
   elseif nDiaSemanaNascimento == 2
   
      cDiaSemanaNascimento := 'SEGUNDA'
   
   elseif nDiaSemanaNascimento == 3
   
      cDiaSemanaNascimento := 'TERCA'
   
   elseif nDiaSemanaNascimento == 4
   
      cDiaSemanaNascimento := 'QUARTA'
   
   elseif nDiaSemanaNascimento == 5
   
      cDiaSemanaNascimento := 'QUINTA'
   
   elseif nDiaSemanaNascimento == 6
   
      cDiaSemanaNascimento := 'SEXTA'
   
   elseif nDiaSemanaNascimento == 7
   
      cDiaSemanaNascimento := 'DOMINGO'
   
   endif

   //Signos
   if nMesNascimento == 1 .and. nDiaNascimento >= 21 .or. nMesNascimento == 2 .and. nDiaNascimento <= 18

      cSigno := 'AQUARIO'
      
   elseif nMesNascimento == 2 .and. nDiaNascimento >= 19 .or. nMesNascimento == 3 .and. nDiaNascimento <= 20
   
      cSigno := 'PEIXES'
   
   elseif nMesNascimento == 3 .and. nDiaNascimento >= 21 .or. nMesNascimento == 4 .and. nDiaNascimento <= 20
   
      cSigno := 'ARIES'
   
   elseif nMesNascimento == 4 .and. nDiaNascimento >= 21 .or. nMesNascimento == 5 .and. nDiaNascimento <= 20
   
      cSigno := 'TOURO'
   
   elseif nMesNascimento == 5 .and. nDiaNascimento >= 21 .or. nMesNascimento == 6 .and. nDiaNascimento <= 20
   
      cSigno := 'GEMEOS'
   
   elseif nMesNascimento == 6 .and. nDiaNascimento >= 21 .or. nMesNascimento == 7 .and. nDiaNascimento <= 20
   
      cSigno := 'CANCER'
   
   elseif nMesNascimento == 7 .and. nDiaNascimento >= 23 .or. nMesNascimento == 8 .and. nDiaNascimento <= 22
         
      cSigno := 'LEAO'
   
   elseif nMesNascimento == 8 .and. nDiaNascimento >= 23 .or. nMesNascimento == 9 .and. nDiaNascimento <= 23
   
      cSigno := 'VIRGEM'
   
   elseif nMesNascimento == 9 .and. nDiaNascimento >= 23 .or. nMesNascimento == 10 .and. nDiaNascimento <= 22
   
      cSigno := 'LIBRA'
   
   elseif nMesNascimento == 10 .and. nDiaNascimento >= 23 .or. nMesNascimento == 11 .and. nDiaNascimento <= 22
   
      cSigno := 'ESCORPIAO'
   
   elseif nMesNascimento == 11 .and. nDiaNascimento >= 22 .or. nMesNascimento == 12 .and. nDiaNascimento <= 21
   
      cSigno := 'SAGITARIO'
   
   elseif nMesNascimento == 12 .and. nDiaNascimento >= 22 .or. nMesNascimento == 1 .and. nDiaNascimento <= 20
   
      cSigno := 'CAPRICORNIO'
   
   endif
   
   // CALCULAR IDADE

   nAnos  := nAnoAtual - nAnoNascimento
   nMeses := nMesAtual - nMesNascimento
   nDias  := nDiasMesAtual - nDiaNascimento + nDiaAtual

   // meses
   if nMeses == 0

      nMeses += 12
      nAnos--

   endif

   if nMesNascimento <= nMesAtual
      
      nMeses--  
      nAnoProximoAniversario++
         
   elseif nMesNascimento > nMesAtual .or. ( nMesNascimento == nMesAtual .and. nDiaNascimento > nDiaAtual )

      nAnos--

   endif

   if nDias > nDiasMes
      nMeses++
      nDias -= nDiasMes
   endif



   cIdade              := AllTrim(Str( nAnos )) + " ANOS, " + AllTrim(Str( nMeses )) + " MESES E " + AllTrim(Str( nDias )) + " DIAS"
   dProximoAniversario := CToD( Str( nDiaNascimento, 2 ) + "/" + Str( nMesNascimento, 2 ) + "/" + Str( nAnoProximoAniversario, 4 ) )

   nDiaSemanaProximoAniversario := DoW( dProximoAniversario )

   // Dias semana
   if nDiaSemanaProximoAniversario == 1

      cDiaSemanaProximoAniversario := 'DOMINGO'
   
   elseif nDiaSemanaProximoAniversario == 2
   
      cDiaSemanaProximoAniversario := 'SEGUNDA'
   
   elseif nDiaSemanaProximoAniversario == 3
   
      cDiaSemanaProximoAniversario := 'TERCA'
   
   elseif nDiaSemanaProximoAniversario == 4
   
      cDiaSemanaProximoAniversario := 'QUARTA'
   
   elseif nDiaSemanaProximoAniversario == 5
   
      cDiaSemanaProximoAniversario := 'QUINTA'
   
   elseif nDiaSemanaProximoAniversario == 6
   
      cDiaSemanaProximoAniversario := 'SEXTA'
   
   elseif nDiaSemanaProximoAniversario == 7
   
      cDiaSemanaProximoAniversario := 'DOMINGO'
   
   endif

   @ 03,01 clear to 23,78

   @ 03,02 say "NOME.......................: " + AllTrim( cNome )
   @ 04,02 say "DATA NASCIMENTO............: " + DToC( dNascimento )
   @ 05,02 say "NASCIDO EM.................: " + AllTrim(Str( nDiaNascimento )) + " DE " + cMesNascimento + " DE " + AllTrim(Str( nAnoNascimento ))
   @ 06,02 say "NASCIDO EM UMA.............: " + AllTrim( cDiaSemanaNascimento )
   @ 07,02 say "IDADE DE...................: " + cIdade
   @ 08,02 say "SIGNO......................: " + cSigno
   @ 09,02 say "PROXIMO ANIVERSARIO EM.....: " + AllTrim(Str( Day(dProximoAniversario) )) + " DE " + cMesNascimento + " DE " + AllTrim(Str( nAnoProximoAniversario ))
   @ 10,02 say "PROXIMO ANIVERSARIO EM UMA.: " + cDiaSemanaProximoAniversario

   SetColor("N/W")
   @ 11,24 say "                             "
   @ 12,24 say "                             "
   @ 13,24 say "                             "
   @ 14,24 say "                             "
   @ 15,24 say "                             "
   @ 16,24 say "                             "
   @ 17,24 say "                             "
   @ 18,24 say "                             "
   @ 19,24 say "                             "
   @ 20,24 say "                             "
   @ 21,24 say "                             "
   @ 22,24 say "                             "
   @ 23,24 say "                             "

   @ 11,25 say cMesNascimento 
   @ 11,48 say AllTrim(Str( nAnoProximoAniversario ))
   @ 12,25 say "DOM SEG TER QUA QUI SEX SAB"
   // CALENDARIO

   dPrimeiroDiaDoMes := CToD("01/" + Str(Month(dProximoAniversario),2) + "/" + Str(nAnoProximoAniversario,4)) 
   nUltimoDiaMes     := Day(CToD( "01/" + Str(Month(dProximoAniversario+1),2) + "/" + Str(nAnoProximoAniversario,4))-1)
   nDiaDaSemana      := DoW(dPrimeiroDiaDoMes)
   nDia              := 1

   nLinha  := 13
   nColuna := 26 

   do while nDia <= nUltimoDiaMes

      if nDiaDaSemana == 1
         
         nColuna := 26
      
      elseif nDiaDaSemana == 2

         ncoluna := 30
      
      elseif nDiaDaSemana == 3

         ncoluna := 34
      
      elseif nDiaDaSemana == 4

         ncoluna := 38
      
      elseif nDiaDaSemana == 5

         ncoluna := 42
      
      elseif nDiaDaSemana == 6

         ncoluna := 46
      
      elseif nDiaDaSemana == 7

         ncoluna := 50
      
      endif

      if nDia == nDiaNascimento
         SetColor("W/R")
      endif
      
      @ nLinha,nColuna say Str(nDia, 2)
      SetColor("N/W")

      nDiaDaSemana ++
      nDia ++

      if nDiaDaSemana > 7
         
         nDiaDaSemana := 1
         nLinha+=2

      endif
   enddo

   SetColor('W/N')
   Inkey( 0 )
   clear
   
enddo