Clear
Set message to 24 Center

nOpcao   := 0
nIdade   := 0
nEscolha := 0
cNome    := Space(40)

do while .t.
   @ 01,01 prompt "Iniciar" message "Menu de opcoes"
   @ 02,01 prompt "Sair" message "Sair do programa"
   menu to nOpcao

   if nOpcao == 1 
      
      Clear

      @ 01,01 say "Nome:"
      @ 02,01 say "Idade: "

      @ 01,08 get cNome  picture "@!"
      @ 02,08 get nIdade picture "99"
      read

      @ 03,01 prompt "Voltar" message "Voltar pro comeco"
      @ 04,01 prompt "Sair" message "Sair do programa"
      menu to nOpcao

      if nOpcao == 2 
         clear
         exit
      elseif nOpcao == 1
         Clear
         loop
      endif

   elseif nOpcao == 2
      nEscolha := Alert("SAIR MESMO?", {"SIM","NAO"},2)

      if nEscolha == 1 
         Clear
         exit
      endif
   endif


enddo