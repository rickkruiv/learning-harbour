Set Date to British
Set Epoch to 1930

Clear

dAtual := Date()
dData  := ''

nDia       := 1
nMes       := Month(dAtual)
nAno       := Year(dAtual)
nDiaSemana := 0
nDiasMes   := 0
nDiaAtual  := Day(dAtual)

cDia       := ''
cMes       := ''
cDiaSemana := ''

nLinha  := 7
nColuna := 2

cMaskDia := "99"

@ 00,00 to 18,30 double
@ 02,01 to 02,29 

do while .t.
   
   @ 03,01 clear to 17,27
   @ 04,01 to 04,29 double
   @ 06,01 to 06,29 double
   nLinha := 7

   // meses
   if nMes == 1

      cMes := "Janeiro"

   elseif nMes == 2

      cMes := "Fevereiro"

   elseif nMes == 3

      cMes := "Marco"

   elseif nMes == 4

      cMes := "Abril"

   elseif nMes == 5

      cMes := "Maio"

   elseif nMes == 6

      cMes := "Junho"

   elseif nMes == 7

      cMes := "Julho"

   elseif nMes == 8

      cMes := "Agosto"

   elseif nMes == 9

      cMes := "Setembro"

   elseif nMes == 10

      cMes := "Outubro"

   elseif nMes == 11

      cMes := "Novembro"

   elseif nMes == 12

      cMes := "Dezembro"

   end if

   // dias/mes
   if nMes == 4 .or. nMes == 6 .or. nMes == 9 .or. nMes == 11

      nDiasMes := 30

   elseif nMes == 2

      nDiasMes := 28

   else

      nDiasMes := 31

   endif

   // 1o dia do mes
   nDia := 1
   dData := CToD(Transform(nDia,cMaskDia) + "/" + Transform(nMes,cMaskDia) + "/" + Transform(nAno, "9999"))
   nDiaSemana := DoW(dData)

   @ 03,02 say cMes
   @ 03,25 say Transform(nAno, "9999")
   @ 05,02 say "DOM SEG TER QUA QUI SEX SAB"

   do while nDia <= nDiasMes
      if nDiaSemana == 1

         nColuna := 2

      elseif nDiaSemana == 2

         nColuna := 6

      elseif nDiaSemana == 3

         nColuna := 10

      elseif nDiaSemana == 4

         nColuna := 14

      elseif nDiaSemana == 5

         nColuna := 18 

      elseif nDiaSemana == 6

         nColuna := 22

      elseif nDiaSemana == 7 

         nColuna := 26

      endif 

      if nDia == nDiaAtual .and. nMes == Month(Date()) .and. nAno == Year(Date())
         SetColor("N/W")
      endif

      @ nLinha,nColuna say Transform(nDia, cMaskDia)

      SetColor("W/N")

      nDiaSemana ++
      nDia ++
   
      if nDiaSemana > 7
   
         nDiaSemana := 1
         nLinha := nLinha + 2
   
      endif

      
   enddo

   // anterior, proximo
   @ 01,02 prompt " < "
   @ 01,26 prompt " > " 
   menu to nOpcao

   if nOpcao == 1 
      nMes --

      if nMes < 1
         nMes := 12
         nAno --
      endif

   elseif nOpcao == 2
      nMes ++

      if nMes == 12
         nMes := 1
         nAno ++
      endif
   else
      nEscolha := Alert("DESEJA SAIR?", {"SIM", "NAO"},1)
      if nEscolha == 1
         clear
         exit
      endif
   endif

enddo