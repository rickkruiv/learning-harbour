clear

do while .t.

   cTexo          := Space(50)
   cTexoInvertido := ""
   cCaractere     := ''

   nLinha        := 3
   nTamanhoTexto := 0

   @ 01,01 say "Informe um Texo: "

   @ 01,18 get cTexo picture "@!" Valid !Empty( cTexo )
   read

   if LastKey() == 27

      nEscolha := Alert("DESEJA SAIR?", { "NAO", "SIM" })
      if nEscolha == 2

         clear
         exit

      endif

      loop

   endif

   nTamanhoTexto := len( AllTrim( cTexo ) )

   @ 03,01 clear to 24,79

   do while nTamanhoTexto > 0

      cCaractere := SubStr( cTexo, nTamanhoTexto, 1 )

      if !Empty( cCaractere )

         cTexoInvertido += cCaractere

      elseif Empty( cCaractere )

         @ nLinha,01 say cTexoInvertido
         cTexoInvertido := ''
         nLinha ++

      endif

      if nTamanhoTexto == 1
         
         @ nLinha,01 say AllTrim( cTexoInvertido )
         
      endif

      nTamanhoTexto --

   enddo
enddo