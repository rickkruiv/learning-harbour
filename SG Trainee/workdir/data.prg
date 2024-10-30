clear

Set Date to British
Set Century On

dInformada := CToD("")
dDiaDaSemana := ""
dDay := ""
dAno := ""
dMes := ""

cDiaDaSemana := ""
dMes := ""

@ 01,01 say "Informe uma data: "

@ 01,19 get dInformada
read

dDia := Day(dInformada)
dMes := Month(dInformada)
dAno := Year(dInformada)
dDiaDaSemana := DoW(dInformada)

if dDiaDaSemana == 1
   cDiaDaSemana := "Domingo"
elseif dDiaDaSemana == 2
   cDiaDaSemana := "Segunda-Feira"
elseif dDiaDaSemana == 3
   cDiaDaSemana := "Terca-Feira"
elseif dDiaDaSemana == 4
   cDiaDaSemana := "Quarta-Feira"
elseif dDiaDaSemana = 5
   cDiaDaSemana := "Quinta-Feira"
elseif dDiaDaSemana == 6
   cDiaDaSemana := "Sexta-Feira"
else
   cDiaDaSemana := "Sabado"
endif

if dMes == 1
   cMes := "Janeiro"
elseif dMes == 2
   cMes := "Ferereiro"
elseif dMes == 3
   cMes := "Marco"
elseif dMes == 4
   cMes := "Abril"
elseif dMes == 5
   cMes := "Maio"
elseif dMes == 6
   cMes := "Junho"
elseif dMes == 7
   cMes := "Julho"
elseif dMes == 8
   cMes := "Agosto"
elseif dMes == 9
   cMes := "Setembro"
elseif dMes == 10
   cMes := "Outubro"
elseif dMes == 11
   cMes := "Novembro"
elseif dMes == 12
   cMes := "Dezembro"
endif

@ 02,01 say "Maringa, " + AllTrim(Str(dDia)) + " de " + cMes + " de " + AllTrim(Str(dAno))
@ 03,01 say "Dia da semana: " + cDiaDaSemana
