Clear
Set Date to British
Set Epoch to 1945

cNomeVendedor := Space( 30 )
cNomeCliente  := Space( 30 )
cMarca        := Space( 20 )
cSexo         := Space( 1 )
cTipoVeiculo  := Space( 1 )
cUsoVeiculo   := Space( 1 )

nAnoFabricacao := 0
nMotor         := 0
nValorFipe     := 0

dAtual   := Date() 
dCotacao := dAtual

nIdade          := 0
nAno            := 0
nAnoAtual       := Year(dAtual)
nUltimoDiaMes   := 0
nAnoPrimeiraCnh := 0
nMes            := 0

cMes := ''

nValorBase1          := 0
nValorBase2          := 0
nValorSeguradora1    := 0
nValorSeguradora2    := 0
nDescontoSeguradora1 := 0
nDescontoSeguradora2 := 0
nTempoHabilitacao    := 0

cCor1 := ''
cCor2 := ''

cVerde    := "W/G"
cVermelho := "W/R"

cMasckTexto   := "@!"
cMasckAno     := "9999"
cMascaraValor := "@E 9,999,999,999.99"

@ 00,00 to 07,79 double
@ 02,01 to 02,78
@ 07,01 to 07,78 double

@ 01,40 to 06,40

@ 01,01 say "DADOS DO CABECALHO"
@ 03,01 say "VENDEDOR: "
@ 06,01 say "DATA COTACAO:"
@ 01,41 say "DADOS DO CLIENTE"
@ 03,41 say "CLIENTE: "
@ 04,41 say "IDADE..: "
@ 05,41 say "SEXO...:"
@ 06,41 say "ANO PRIMEIRA CNH: "

@ 03,10 get cNomeVendedor   picture cMasckTexto Valid !Empty( cNomeVendedor )
@ 06,14 get dCotacao                            Valid !Empty( dCotacao ) .and. dCotacao <= dAtual
@ 03,49 get cNomeCliente    picture cMasckTexto Valid !Empty( cNomeCliente )
@ 04,49 get nIdade          picture "999"       Valid !Empty( nIdade ) .and. nIdade >= 18
@ 05,49 get cSexo           picture cMasckTexto Valid !Empty( cSexo ) .and. cSexo $ "F" .or. cSexo $ "M"                      //Ano nascimento
@ 06,58 get nAnoPrimeiraCnh picture cMasckAno   Valid !Empty( nAnoPrimeiraCnh) .and. nAnoPrimeiraCnh <= Year( dAtual ) .and. (nAnoPrimeiraCnh >= (nAnoAtual - nIdade) + 18) 
Read

@ 07,00 to 16,79 double
@ 09,01 to 09,78

@ 08,01 say "DADOS DO VEICULO"
@ 10,01 say "MARCA.............: "
@ 11,01 say "ANO DE FABRICACAO.: "
@ 12,01 say "TIPO DE VEICULO...: "
@ 12,45 say "(P)PASSEIO, (E)ESPORTIVO, (L)LUXO"
@ 13,01 say "MOTOR.............: "
@ 14,01 say "VALOR.............: "
@ 15,01 say "USO DO VEICULO....: "
@ 15,45 say "(P)PARTICULAR, (O)PROFISSIONAL"

@ 10,21 get cMarca         picture cMasckTexto           Valid !Empty( cMarca )
@ 11,21 get nAnoFabricacao picture cMasckAno             Valid !Empty( nAnoFabricacao )
@ 12,21 get cTipoVeiculo   picture cMasckTexto           Valid !Empty( cTipoVeiculo ) .and. cTipoVeiculo $ "P" .or. cTipoVeiculo $ "E" .or. cTipoVeiculo $ "L"
@ 13,21 get nMotor         picture "9.9"                 Valid !Empty( nMotor ) .and. nMotor > 0
@ 14,21 get nValorFipe     picture cMascaraValor         Valid !Empty( nValorFipe )
@ 15,21 get cUsoVeiculo    picture cMasckTexto           Valid !Empty( cUsoVeiculo ) .and. cUsoVeiculo $ "P" .or. cUsoVeiculo $ "O"
Read

@ 00,00 clear to 16,79 
@ 00,00 to 08,79 double
@ 01,40 to 05,40 
@ 02,01 to 02,78
@ 06,01 to 06,78

nIdadeCarro       := nAnoAtual - nAnoFabricacao
nTempoHabilitacao := nAnoAtual - nAnoPrimeiraCnh
nMes              := Month( dCotacao )
nAno              := Year( dCotacao )

nValorBase1 := (nValorFipe * 6/100)
nValorBase2 := (nValorFipe * 7/100)

// seguro 1
if nIdade < 25 .or. nIdade > 65

   nDescontoSeguradora1 += 10

endif
 
if cSexo $ "M"

   nDescontoSeguradora1 += 10
 
elseif cSexo $ "F"

   nDescontoSeguradora1 -= 5

endif

if nTempoHabilitacao < 3

   nDescontoSeguradora1 += 15

elseif nTempoHabilitacao > 8 

   nDescontoSeguradora1 -= 10

endif

if cTipoVeiculo $ "E"

   nDescontoSeguradora1 += 10

elseif cTipoVeiculo $ "L"

   nDescontoSeguradora1 += 20
   
endif

if nMotor > 2.0

   nDescontoSeguradora1 += 15

endif

nAumentoPorAno := nIdadecarro * 0.5

if nAumentoPorAno >= 10

   nAumentoPorAno := 10

endif

nDescontoSeguradora1 += nAumentoPorAno

if cUsoVeiculo $ "O"

   nDescontoSeguradora1 += 10

endif

if nMes == 3

   nDescontoSeguradora1 -= 10

endif

nValorSeguradora1 := nValorBase1 + (nValorBase1 * nDescontoSeguradora1/100)

// seguro 2
if nIdade < 23 .or. nIdade > 60

   nDescontoSeguradora2 += 15

elseif nIdade >= 30 .and. nIdade <= 50

   nDescontoSeguradora2 -= 8

endif
 
if cSexo $ "M"

   nDescontoSeguradora2 -= 6
 
elseif cSexo $ "F"

   nDescontoSeguradora2 += 12

endif

if nTempoHabilitacao < 2

   nDescontoSeguradora2 += 20

elseif nTempoHabilitacao > 5

   nDescontoSeguradora2 -= 10

endif

if cTipoVeiculo $ "E"

   nDescontoSeguradora2 += 15

elseif cTipoVeiculo $ "L"

   nDescontoSeguradora2 += 18
   
endif

if nMotor > 1.5

   nDescontoSeguradora2 += 10

endif

nAumentoPorAno := nIdadeCarro * 0.8

if nAumentoPorAno >= 8

   nAumentoPorAno := 8

endif

nDescontoSeguradora2 += nAumentoPorAno

if cUsoVeiculo $ "O"

   nDescontoSeguradora2 += 12

endif

if nMes == 9

   nDescontoSeguradora2 -= 8

endif

nValorSeguradora2 := nValorBase2 + (nValorBase2 * nDescontoSeguradora2/100)

// =========================================================================

if nValorSeguradora1 > nValorSeguradora2

   cCor1 := cVermelho
   cCor2 := cVerde

elseif nValorSeguradora2 > nValorSeguradora1

   cCor2 := cVermelho
   cCor1 := cVerde

endif

SetColor( cCor1 )
@ 01,01 say "SEGURADORA 1                           " 
@ 03,01 say "MENSAL.....: " + "          " + Transform( nValorSeguradora1/12, cMascaraValor )
@ 04,01 say "TRIMESTRAL.: " + "          " + Transform( nValorSeguradora1/4, cMascaraValor )
@ 05,01 say "ANUAL......: " + "          " + Transform( nValorSeguradora1, cMascaraValor )

SetColor( cCor2 )
@ 01,41 say "SEGURADORA 2                          "
@ 03,41 say "MENSAL.....: " + "         " + Transform( nValorSeguradora2/12, cMascaraValor )
@ 04,41 say "TRIMESTRAL.: " + "         " + Transform( nValorSeguradora2/4, cMascaraValor )
@ 05,41 say "ANUAL......: " + "         " + Transform( nValorSeguradora2, cMascaraValor )

// ===============================================

if nMes == 1

   cMes := "JANEIRO"

elseif nMes == 2

   cMes := "FEVEREIRO"

elseif nMes == 3

   cMes := "MARCO"

elseif nMes == 4

   cMes := "ABRIL"

elseif nMes == 5

   cMes := "MAIO"

elseif nMes == 6

   cMes := "JUNHO"

elseif nMes == 7

   cMes := "JULHO"

elseif nMes == 8

   cMes := "AGOSTO"

elseif nMes == 9

   cMes := "SETEMBRO"

elseif nMes == 10

   cMes := "OUTUBRO"

elseif nMes == 11

   cMes := "NOVEMBRO"

elseif nMes == 12

   cMes := "DEZEMBRO"

endif

nUltimoDiaMes := Day(CToD("01" + "/" + Str( nMes + 1 ) + "/" + Str( nAno ) ) - 1)

SetColor("W/N")
@ 07,01 say "COTACAO VALIDA ATE " + Str( nUltimoDiaMes ) + " DE " + AllTrim( cMes ) + " DE " + Str( nAno ) 

inkey(0)