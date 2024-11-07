// HENRIQUE FERREIRA POLIZER

clear
Set Date to british
Set Epoch to 1945
Set message to 23 Center
Set Wrap On

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
   @ 02,01 to 02,78 
   
   if LastKey() == 27
      
      nOpcao := 3

   endif

   @ 01,02 say "GERENCIADOR DE SENHAS"
   @ 10,04 prompt "CADASTRAR" message "CADASTRAR UMA SENHA"
   @ 12,04 prompt "CONSULTAR" message "CONSULTAR SENHAS"
   @ 14,04 prompt "SAIR" message "FINALIZAR PROGRAMA"
   menu to nOpcao


   @ 03,01 clear to 23,78

   if nOpcao == 1

      do while .t.

         cSenha         := Space(20)
         dCadastramento := CToD('')
         cLetra         := ''
         nTamanhoSenha  := 0

         nCodigo++

         @ 03,02 say "CODIGO...........: " + AllTrim(Str( nCodigo ))
         @ 04,02 say "SENHA............: "          
         @ 05,02 say "DATA DE CADASTRO.: "

         @ 04,21 get cSenha         Valid !Empty( cSenha )
         @ 05,21 get dCadastramento Valid !Empty( dCadastramento ) .and. dCadastramento <= Date()
         read

         if LastKey() == 27

            nEscolha := Alert("VOLTAR?", { "SIM", "NAO" })

            if nOpcao == 1

               nCodigo --
               exit

            endif

            loop

         endif
      
         nTamanhoSenha := Len(AllTrim( cSenha ))

         if nTamanhoSenha < 8
            nEscolha := Alert("SENHA DEVE POSSUIR PELO MENOS 8 CARACTERES. TENTE NOVAMENTE!", {"OK"})
            nCodigo--
            loop
         elseif nTamanhoSenha > 12
            nEscolha := Alert("SENHA DEVE POSSUIR NO MAXIMO 12 CARACTERES. TENTE NOVAMENTE!", {"OK"})
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
            nEscolha := Alert("SENHA FRACA. TENTE NOVAMENTE", {"OK"})
            nCodigo--
            loop
         endif
         
         cSenhas += cSenha
         cDatas += DToC( dCadastramento )
      enddo

   elseif nOpcao == 2
      do while .t.
         if nCodigo > 0 
            @ 03,02 say "CODIGO...........: "
            @ 03,21 get nVerificarCodigo picture "999" Valid !Empty( nVerificarCodigo )
            read

            if LastKey() == 27 
               nEscolha := Alert("VOLTAR?", {"SIM", "NAO"})
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
   
               @ 04,02 say "SENHA............: " + cSenhaVerificada
               @ 05,02 say "DATA DE CADASTRO.: " + DToC(dDataVerificada)
               @ 07,25 say "DOM SEG TER QUA QUI SEX SAB"
   
               nLinha       := 09
               nColuna      := 21
               nEspacamento := 4
   
               do while nDia <= nUltimoDiaMes
       
                  if nDia == Day(dDataVerificada)
                     SetColor("N/W")
                  endif
   
                  @ nLinha,(nColuna + (nEspacamento * nDiaDaSemana)) say Str(nDia, 2)
               
                  SetColor("W/N")
   
                  nDiaDaSemana ++
                  nDia ++
   
                  if nDiaDaSemana > 7
                     nDiaDaSemana := 1
                     nLinha += 2
                  endif
               
               enddo
            
               @ 23,02 say "PRECIONE QUALQUER TECLA..."
               Inkey(0)

            else
               nEscolha := Alert("CODIGO " + AllTrim(Str(nVerificarCodigo)) + " NAO EXISTE", {"OK"})
               loop
            endif

            @ 03,01 clear to 23,78
         
         else
            nEscolha := Alert("NAO EXISTE SENHAS CADASTRADAS", {"OK"})
            loop
         endif
      enddo

   elseif nOpcao == 3

      clear
      exit

   endif

   Clear

enddo