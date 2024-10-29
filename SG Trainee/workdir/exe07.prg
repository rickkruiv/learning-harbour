clear

// variaveis
nPrimeiroNumero := 0
nSegundoNumero := 0

//// leitura com Input
// input "Informe o primeiro valor: " to nPrimeiroNumero
// input "Informe o segundo valor: " to nSegundoNumero

// Area
@ 00,00 to 08,29 double
@ 03,01 to 03,28

@ 01,01 say "Informe o primeiro valor: "
@ 02,01 say "Informe o segundo valor: "

//  Leitura com get
@ 01,27 get nPrimeiroNumero picture "99" valid !Empty( nPrimeiroNumero )
@ 02,27 get nSegundoNumero  picture "99" valid !Empty( nSegundoNumero )
Read

@ 04,01 say "Soma: " + ALLTrim( Str( nPrimeiroNumero + nSegundoNumero ) )
@ 05,01 say "Produto: " + ALLTrim( Str( nPrimeiroNumero * nSegundoNumero ) )
@ 07,01 say "Divisao: " + ALLTrim( Str( nPrimeiroNumero / nSegundoNumero, 00, 01 ) )
@ 06,01 say "Subtracao: " + ALLTrim( Str( nPrimeiroNumero - nSegundoNumero ) )

inkey(0)