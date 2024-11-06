clear
Set Date to british
Set Epoch to 1945

nCodigo          := 0
nVerificarCodigo := 0

cNumeros   := "1234567890"
cSimboolos := "!@#$%^&*()-+"
cMaiuscula := "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
cMinuscula := "abcdefghijklmnopqrstuvwxyz"

cSenhas := ''
cDatas  := ''

cSenhaVerificada := ''
dDataVerificada  := CToD('')

nMes          := 0
nAno          := 0
nDia          := 0
nUltimoDiaMes := 0

nColuna := 0
nLinha  := 0
do while .t.
   nOpcao := 0

   @ 00,00 to 24,79 double
   @ 01,02 say "Gerenciador de senhas"
   @ 02,01 to 02,78 

   @ 03,02 say "[1] Cadastrar"
   @ 04,02 say "[2] Consultar"
   @ 05,02 say "[3] Sair"

   @ 07,02 say "Opcao: "
   @ 07,10 get nOpcao picture "9" Valid !Empty( nOpcao ) .and. nOpcao < 4
   read

   if LastKey() == 27
      nEscolha := Alert("Deseja Sair?", { "Sim", "Nao" })

      if nEscolha == 1

         clear
         exit

      endif

      loop

   endif

   @ 03,01 clear to 23,78

   if nOpcao == 1

      do while .t.

         cSenha         := Space(20)
         dCadastramento := CToD('')
         cLetra         := ''
         nTamanhoSenha  := 0

         nCodigo++

         @ 03,02 say "Codigo...........: " + AllTrim(Str( nCodigo ))
         @ 04,02 say "Senha............: "          
         @ 05,02 say "Data de cadastro.: "

         @ 04,21 get cSenha         Valid !Empty( cSenha )
         @ 05,21 get dCadastramento Valid !Empty( dCadastramento ) .and. dCadastramento <= Date()
         read

         if LastKey() == 27

            nEscolha := Alert("Voltar?", { "Sim", "Nao" })

            if nOpcao == 1

               nCodigo --
               exit

            endif

            loop

         endif
      
         nTamanhoSenha := Len(AllTrim( cSenha ))

         if nTamanhoSenha < 8
            nEscolha := Alert("Senha deve possuir pelo menos 8 caracteres. Tente novamente!", {"Ok"})
            nCodigo--
            loop
         elseif nTamanhoSenha > 12
            nEscolha := Alert("Senha deve possuir no maximo 12 caracteres. Tente novamente!", {"Ok"})
            nCodigo--
            loop
         endif

         lTemNumero    := .f.
         lTemMaiuscula := .f.
         lTemMinuscula := .f.
         lTemSimbolo   := .f.

         do while nTamanhoSenha > 0
            cLetra := SubStr(AllTrim( cSenha ), nTamanhoSenha--, 1)

            if cLetra $ cNumeros

               lTemNumero := .t.               

            elseif cLetra $ cMaiuscula

               lTemMaiuscula := .t.

            elseif cLetra $ cMinuscula

               lTemMinuscula := .t.

            elseif cLetra $ cSimboolos

               lTemSimbolo := .t.

            endif
         enddo

         if !lTemNumero .or. !lTemMaiuscula .or. !lTemMinuscula .or. !lTemSimbolo
            nEscolha := Alert("Senha fraca. Tente novamente", {"Ok"})
            nCodigo--
            loop
         endif
         
         cSenhas += cSenha
         cDatas += DToC( dCadastramento )
      enddo

   elseif nOpcao == 2
      do while .t.
         if nCodigo > 0 
            @ 03,02 say "Codigo...........: "
            @ 03,21 get nVerificarCodigo picture "999" Valid !Empty( nVerificarCodigo )
            read

            if LastKey() == 27 
               nEscolha := Alert("Voltar?", {"Sim", "Nao"})
               if nEscolha == 1
                  exit
               endif
            endif

            if nVerificarCodigo <= nCodigo
               cSenhaVerificada := AllTrim(SubStr(cSenhas, (20*(nVerificarCodigo-1)+1), 20))
               dDataVerificada  := CToD(AllTrim(SubStr(cDatas, (8*(nVerificarCodigo-1)+1), 8))) 
   
               nMes := Month(dDataVerificada)
               nAno := Year(dDataVerificada)
               nDia := 1
   
               if nMes == 12
                  nProximoMes := 1
               else
                  nProximoMes := nMes+1
               endif
   
               nUltimoDiaMes := Day(CToD("01/" + Str(nProximoMes,2) + "/" + Str(nAno,2))-1)
               dData         := CToD("01/" + Str(nMes, 2) + "/" + Str(nAno,2)) 
               nDiaDaSemana  := DoW(dData)
   
               @ 04,02 say "Senha............: " + cSenhaVerificada
               @ 05,02 say "Data de Cadastro.: " + DToC(dDataVerificada)
               @ 07,25 say "DOM SEG TER QUA QUI SEX SAB"
   
               nColuna := 25
               nLinha  := 09
   
               do while nDia <= nUltimoDiaMes
                  if nDiaDaSemana == 1
   
                     nColuna := 25
                  
                  elseif nDiaDaSemana == 2
   
                     nColuna := 29
   
                  elseif nDiaDaSemana == 3
   
                     nColuna := 33
   
                  elseif nDiaDaSemana == 4
   
                     nColuna := 37
   
                  elseif nDiaDaSemana == 5
   
                     nColuna := 41
   
                  elseif nDiaDaSemana == 6
   
                     nColuna := 45
   
                  elseif nDiaDaSemana == 7
   
                     nColuna := 49
   
                  endif
   
                  if nDia == Day(dDataVerificada)
                     SetColor("N/W")
                  endif
   
                  @ nLinha,nColuna say Str(nDia, 2)
               
                  SetColor("W/N")
   
                  nDiaDaSemana ++
                  nDia ++
   
                  if nDiaDaSemana > 7
                     nDiaDaSemana := 1
                     nLinha += 2
                  endif
               
               enddo
            
               @ 23,02 say "Precione qualquer tecla..."
               Inkey(0)

            else
               nEscolha := Alert("Codigo " + AllTrim(Str(nVerificarCodigo)) + " nao existe", {"Ok"})
               loop
            endif

            @ 03,01 clear to 23,78
         
         else
            nEscolha := Alert("Nao existe senhas cadastradas", {"Ok"})
            loop
         endif
      enddo

   elseif nOpcao == 3

      clear
      exit

   endif

   Clear

enddo