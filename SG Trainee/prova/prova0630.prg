// HENRIQUE FERREIRA POLIZER

clear

do while .t.

   cNome         := Space( 20 )
   cPalavra      := Space( 20 )

   cPrimeiraDica := Space( 20 )
   cSegundaDica  := Space( 20 )
   cTerceiraDica := Space( 20 )

   cFormandoPalavra := ""

   nTamanhoPalavra := 0
   nContador       := 0
   cLetrasErradas  := ''

   cCor      := ''
   cAcertos  := ''
   nColuna   := 10
   nPosLetra := 0
   nAcertos  := 0
   nChances  := 6
   nErros    := 0

   @ 00,00 to 24,79 double

   @ 01, 02 say "Joogo da Forca"
   @ 03,02 say "Nome..: "
   
   @ 03,10 get cNome picture "@!" Valid !Empty( cNome )
   read

   @ 05,02 say "Dificuldade"
   @ 07,02 prompt "FACIL"
   @ 09,02 prompt "MEDIO"
   @ 11,02 prompt "DIFICIL"
   menu to nOpcao

   if nOpcao == 1

      @ 05,01 clear to 23,78

      @ 05,02 say "PRIMEIRA DICA..: "
      @ 07,02 say "SEGUNDA DICA...: "
      @ 09,02 say "TERCEIRA DICA..: "

      @ 05,19 get cPrimeiraDica picture "@!" Valid !Empty( cPrimeiraDica ) color("W/W")
      @ 07,19 get cSegundaDica  picture "@!" Valid !Empty( cSegundaDica ) color("W/W")
      @ 09,19 get cTerceiraDica picture "@!" Valid !Empty( cTerceiraDica ) color("W/W")
      read

   elseif nOpcao == 2

      nChances -= 1

   elseif nOpcao == 3

      nChances -= 2

   endif

   @ 03,01 clear to 23,78

   @ 03,02 say "PALAVRA: " 
   @ 03,11 get cPalavra picture "@!" Valid !Empty( cPalavra ) color("W/W")
   read

   nTamanhoPalavra := Len(AllTrim(cPalavra))
   
   @ 03,01 clear to 23,78

   @ 08,10 to 15,10
   @ 08,10 to 08,15

   do while nTamanhoPalavra > nContador

      nContador ++
      @ 15,10 + 2 * nContador say "_"

   enddo

   nContador := 0
   do while .t.

      cLetraDigitada := Space( 1 )
      nContador      := 0
      
      @ 23,02 say "CHANCES: " + AllTrim(Str(nChances))
      
      if nErros == 1

         @ 09,15 say "0"

      endif

      if nErros == 2

         @ 10,15 say "|"

      endif

      if nErros == 3

         @ 10,14 say "/"

      endif

      if nErros == 4

         @ 10,16 say "\"

      endif

      if nErros == 5

         @ 11,14 say "/"

      endif

      if nErros == 6

         @ 11,16 say "\"

      endif

      if nChances == 0

         Alert("FIM DE JOGO")
         clear
         exit

      elseif nAcertos == nTamanhoPalavra

         Alert("VOCE GANHOU")
         clear
         exit

      endif

      if nOpcao == 1

         if nChances == 5

            @ 14,50 say "DICA 1: " + cPrimeiraDica
            
         elseif nChances == 4

            @ 16,50 say "DICA 2: " + cSegundaDica

         elseif nChances == 3

            @ 18,50 say "DICA 3: " + cTerceiraDica

         endif

      endif

      @ 03,02 say "DIGITE UMA LETRA: "

      @ 03,20 get cLetraDigitada picture "@!" Valid !Empty( cLetraDigitada )
      read

      if !(cLetraDigitada $ cPalavra)
              
         if !(cLetraDigitada $ cLetrasErradas)
            
            cLetrasErradas += cLetraDigitada
            nChances--
            nErros++
            cCor := SetColor("W/N")     
            
         else

            cCor := SetColor("R/N")
               
         endif

         do while Len(cLetrasErradas) > nContador

            nContador++
            if SubStr(cLetrasErradas, nContador, 1) $ cLetraDigitada

               nPosLetra := nContador
               
            endif

         enddo

         @ 17,nColuna + (2* nPosLetra) say cLetraDigitada
         
      endif

      SetColor("W/N")
      
      do while nTamanhoPalavra > nContador
         
         nContador++
         cLetraPalavra := SubStr(AllTrim(cPalavra), nContador, 1)
         
         if cLetraDigitada $ cLetraPalavra
            cAcertos += cLetraPalavra
            
            nAcertos++
            
            Alert(cAcertos)
            @ 15,(10 + 2 * nContador) say cLetraDigitada

         endif
         
      enddo
      
   enddo
   
enddo