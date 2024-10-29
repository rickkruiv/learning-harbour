clear

cNome := Space(40)
nIdade := 0
cCategoria := ""

SetColor("B+/N")
@ 00,00 to 05,62 double
SetColor("W+/N")

SetColor("R+/N")
@ 00,02 say "CLASSIFICACAO DE CATEGORIAS"
SetColor("W+/N")

@ 02,02 say "Informe seu nome: "
@ 03,02 say "Informe sua idade: "

@ 02,20 get cNome  picture "@!"  valid !Empty( cNome ) .and. !( cNome $ "1234567890" )
@ 03,20 get nIdade picture "99" valid !Empty( nIdade ) .and. nIdade >= 0 .and. nIdade <= 45
read

@ 01,01 clear to 04,61

if nIdade <= 4 
   @ 02,02 say AllTrim(cNome) + " nao pode participar da competicao, idade insuficiente."
else
   if nIdade <= 7
      cCategoria := "Infantil A"
   else
      if nIdade <= 10
         cCategoria := "Infantil B"
      else
         if nIdade <= 13
            cCategoria := "Juvenil A"
         else
            if nIdade <= 17
               cCategoria := "Juvenil B"
            else
               cCategoria := "Senior"
            endif
         endif
      endif
   endif

   @ 02,02 say "Ola," + AllTrim( cNome ) + "! Parabens pela inscricao!"
   @ 03,02 say "Sua classificao: " + AllTrim( cCategoria )
endif

inkey(0)