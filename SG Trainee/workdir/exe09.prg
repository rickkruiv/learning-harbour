clear
Set Date to British // muda para o padrao dd/mm/aa
Set Epoch to 1930 // muda para dd/mm/aaaa

cLetra         := Space(1)
dData          := CToD('')
nMaskDecimal   := "@e 99.99"
nMaskInteiro   := "999"
cMaskText      := "@!"

nNumeroDecimal := 0
nNumeroInteiro := 0
cTexto         := Space(35)

@ 00,00 to 08,45
@ 01,10 to 03,10
@ 01,21 to 03,21
@ 01,33 to 03,33
@ 02,01 to 02,44
@ 04,01 to 04,44

@ 01,03 say "Letra"
@ 01,14 say "Data"
@ 01,23 say "N Decimal"  
@ 01,35 say "N Inteiro"
@ 06,02 say "Texto:"

@ 03,04 get cLetra         picture cMaskText    valid !Empty( cLetra ) .and. !(cLetra $ "1234567890") // picture cria a mascara
@ 03,11 get dData                               valid !Empty( dData ) // valid valida o campo
@ 03,23 get nNumeroDecimal picture nMaskDecimal valid !Empty( nNumeroDecimal ) .and. nNumeroDecimal > 0 // !Empty() n permite que fique vazio
@ 03,35 get nNumeroInteiro picture nMaskInteiro valid !Empty( nNumeroInteiro ) .and. nNumeroInteiro > 0 
@ 06,09 get cTexto         picture cMaskText    valid !Empty( cTexto )
read

clear

@ 00,00 to 08,45
@ 03,18.5 say "GUARDANDO"

@ 05,22 say "="
inkey(0.2)
@ 05,21 say "==="
inkey(0.2)
@ 05,20 say "====="
inkey(0.2)
@ 05,19 say "======="
inkey(0.2)
@ 05,18 say "========="
inkey(0.2)
@ 05,17 say "==========="
inkey(0.2)
@ 05,16 say "============="
inkey(0.2)
@ 05,15 say "==============="
inkey(0.2)
@ 05,14 say "================="
inkey(0.5)

clear

@ 00,00 to 08,45

@ 02,04 say "Letra: " + AllTrim( cLetra )
@ 03,04 say "Data: " + DToC(dData)
@ 04,04 say "N Decimal: " + AllTrim( Str( nNumeroDecimal ) )
@ 05,04 say "N Inteiro: " + AllTrim( Str( nNumeroInteiro ) )
@ 06,04 say "Texto: " + AllTrim( cTexto )

inkey(0)