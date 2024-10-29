clear

nVariavelA := 13
nVariavelB := 53

@ 01,01 to 10,30 double
@ 04,02 to 04,29 
@ 07,02 to 07,29

@ 02,02 say "Valor de A: " + ALLTrim( Str( nVariavelA ) )
@ 03,02 say "Valor de B: " + ALLTrim( Str( nVariavelB ) )

// Trocando valores
// Variaveis finais
nVariavelB := nVariavelA + nVariavelB
nVariavelA := nVariavelB - nVariavelA
nVariavelB := nVariavelB - nVariavelA

@ 05,02 say "Valor trocado de A: " + ALLTrim( Str( nVariavelA ) )
@ 06,02 say "Valor trocado de B: " + ALLTrim( Str( nVariavelB ) )

@ 08,02 say "Valor final de A: " + ALLTrim( Str( nVariavelA ) )
@ 09,02 say "Valor final de B: " + ALLTrim( Str( nVariavelB ) )

@ 11,00 say ""
