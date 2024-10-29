clear 

nIdade := 0

@ 00,00 to 05,28
@ 02,01 to 02,27

@ 01,02 say "Idade: "

@ 01,09 get nIdade valid !empty picture "999"
Read

if nIdade = 21
   @ 03,02 say "Voce tem 21 anos"
else
   if nIdade < 21
      @ 03,02 say "Voce tem menos de 21 anos"
   else
      @ 03,02 say "Voce tem mais de 21 anos"
   endif
endif

inkey(0)