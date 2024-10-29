// Henrique Ferreira Polizer

// desenvolver um programa para inserir as notas/frequencia de alunos
// de uma determinada escola, resultando se o aluno esta aprovado, reprovado 
// ou aprovado com dependncias, ou seja, um boletim escolar

clear
Set Date to British
Set Century On

// variaveis
cNomeAluno := Space( 40 )
cCurso := Space( 40 )

cDisciplina1 := Space(13)
cDisciplina2 := Space(13)
cDisciplina3 := Space(13)

cSituacao := ''

nSerie := 0
nMensalidade := 0

nDisciplina1Nota1 := 0
nDisciplina1Nota2 := 0
nDisciplina1Nota3 := 0
nDisciplina1Nota4 := 0

nDisciplina2Nota1 := 0
nDisciplina2Nota2 := 0
nDisciplina2Nota3 := 0
nDisciplina2Nota4 := 0

nDisciplina3Nota1 := 0
nDisciplina3Nota2 := 0
nDisciplina3Nota3 := 0
nDisciplina3Nota4 := 0

nFrequencia := 0
nFrequencia1 := 0
nFrequencia2 := 0
nFrequencia3 := 0

nDisciplina1Frequencia1 := 0
nDisciplina1Frequencia2 := 0
nDisciplina1Frequencia3 := 0
nDisciplina1Frequencia4 := 0

nDisciplina2Frequencia2 := 0
nDisciplina2Frequencia1 := 0
nDisciplina2Frequencia3 := 0
nDisciplina2Frequencia4 := 0

nDisciplina3Frequencia1 := 0
nDisciplina3Frequencia2 := 0
nDisciplina3Frequencia3 := 0
nDisciplina3Frequencia4 := 0

nMedia := 0

nMediaDisciplina1 := 0
nMediaDisciplina2 := 0
nMediaDisciplina3 := 0

nContarReprovacao := 0
nContarReprovacao1 := 0
nContarReprovacao2 := 0
nContarReprovacao3 := 0

nReajusteMensalidade := 0

dNascimento := CToD('')
dInicio := CtoD('')

// mascaras
cMascaraTexo := "@!"
nMascaraNota := "@E 999"


@ 00,00 to 24,79 double
@ 02,01 to 02,78 double
@ 06,01 to 06,78 double

@ 12,01 to 12,78
@ 14,01 to 14,78 

@ 07,14 to 08,14
@ 08,01 to 08,78

@ 10,01 to 10,78 

@ 07,14 to 15,14
@ 09,19 to 15,19
@ 09,24 to 15,24
@ 09,29 to 15,29
@ 07,34 to 15,34
@ 09,39 to 15,39
@ 09,44 to 15,44
@ 09,49 to 15,49
@ 07,54 to 15,54

@ 09,60 to 15,60
@ 09,67 to 15,67

@ 16,01 to 16,78 double
@ 18,01 to 18,78 double

@ 19,13 to 23,13

@ 01,20 say "Colegio de Sabium - tel. (44) 99722-9355"

@ 03,02 say "Aluno: "
@ 03,51 say "Data Nascimento: "
@ 04,02 say "Curso: "
@ 05,02 say "Serie (1a - 8a): "
@ 04,51 say "Data inicio: "
@ 05,51 say "Mensalidade: "

@ 07,22 say "NOTAS"
@ 07,41 say "FALTAS"
@ 07,64 say "FINAL"

@ 09,02 say "Disciplina"
@ 09,16 say "1o"
@ 09,21 say "2o"
@ 09,26 say "3o"
@ 09,31 say "4o"
@ 09,36 say "1o"
@ 09,41 say "2o"
@ 09,46 say "3o"
@ 09,51 say "4o"
@ 09,56 say "Med"
@ 09,62 say "Falt"
@ 09,69 say "Situacao"

@ 17,02 say "Situacao final: "

@ 19,02 say "Aprovacoes"
@ 19,15 say "Reprovacoes"

@ 03,09 get cNomeAluno              picture cMascaraTexo Valid !Empty( cNomeAluno )
@ 04,09 get cCurso                  picture cMascaraTexo Valid !Empty( cCurso )
@ 05,19 get nSerie                  picture "9"          Valid !Empty( nSerie ) .and. nSerie >= 1 .and. nSerie < 9
@ 03,68 get dNascimento                                  Valid !Empty( dNascimento )
@ 04,64 get dInicio                                      Valid !Empty( dInicio ) .and. dInicio < Date()
@ 05,64 get nMensalidade            picture "@E 9999.99" Valid !Empty( nMensalidade ) .and. nMensalidade > 0
read

if (nSerie <= 4) 
   nMedia := 60
else 
   nMedia := 70
endif

if (nSerie <= 3) 
   nFrequencia := 24
else 
   nFrequencia := 32
endif

// disciplina 1
@ 11,01 get cDisciplina1            picture cMascaraTexo Valid !Empty( cDisciplina1 )
@ 11,16 get nDisciplina1Nota1       picture nMascaraNota Valid !Empty( nDisciplina1Nota1 ) .and. nDisciplina1Nota1 >=0 .and. nDisciplina1Nota1 <= 100
@ 11,21 get nDisciplina1Nota2       picture nMascaraNota Valid !Empty( nDisciplina1Nota2 ) .and. nDisciplina1Nota2 >=0 .and. nDisciplina1Nota2 <= 100
@ 11,26 get nDisciplina1Nota3       picture nMascaraNota Valid !Empty( nDisciplina1Nota3 ) .and. nDisciplina1Nota3 >=0 .and. nDisciplina1Nota3 <= 100
@ 11,31 get nDisciplina1Nota4       picture nMascaraNota Valid !Empty( nDisciplina1Nota4 ) .and. nDisciplina1Nota4 >=0 .and. nDisciplina1Nota4 <= 100
@ 11,36 get nDisciplina1Frequencia1 picture "9"        
@ 11,41 get nDisciplina1Frequencia2 picture "9"        
@ 11,46 get nDisciplina1Frequencia3 picture "9"        
@ 11,51 get nDisciplina1Frequencia4 picture "9"  
read
 
nMediaDisciplina1 := ( nDisciplina1Nota1 + nDisciplina1Nota2 + nDisciplina1Nota3 + nDisciplina1Nota4 ) / 4
nFrequencia1 := nDisciplina1Frequencia1 + nDisciplina1Frequencia2 + nDisciplina1Frequencia3 + nDisciplina1Frequencia4

if (nMediaDisciplina1 >= nMedia) 
   SetColor("G+/N")
else
   SetColor("R+/N")
endif

@ 11,55 say AllTrim( Str( nMediaDisciplina1, 0, 1 ))

if (nFrequencia1 < nFrequencia)
   SetColor("G+/N")
else  
   SetColor("R+/N")
endif

@ 11,63 say AllTrim( Str( nFrequencia1 ))

if (nMediaDisciplina1 < nMedia) .or. (nFrequencia1 >= nFrequencia)
   nContarReprovacao1++
endif

if (nContarReprovacao1 >= 1)
   SetColor("R+/N")
   cSituacao := "Reprovado"
else
   SetColor("G+/N")
   cSituacao := "Aprovado"
endif
@ 11,69 say cSituacao
@ 20,02 say cDisciplina1

// disciplina 2
@ 13,01 get cDisciplina2            picture cMascaraTexo Valid !Empty( cDisciplina2 )
@ 13,16 get nDisciplina2Nota1       picture nMascaraNota Valid !Empty( nDisciplina2Nota1 ) .and. nDisciplina2Nota1 >=0 .and. nDisciplina2Nota1 <= 100
@ 13,21 get nDisciplina2Nota2       picture nMascaraNota Valid !Empty( nDisciplina2Nota2 ) .and. nDisciplina2Nota2 >=0 .and. nDisciplina2Nota2 <= 100
@ 13,26 get nDisciplina2Nota3       picture nMascaraNota Valid !Empty( nDisciplina2Nota3 ) .and. nDisciplina2Nota3 >=0 .and. nDisciplina2Nota3 <= 100
@ 13,31 get nDisciplina2Nota4       picture nMascaraNota Valid !Empty( nDisciplina2Nota4 ) .and. nDisciplina2Nota4 >=0 .and. nDisciplina2Nota4 <= 100
@ 13,36 get nDisciplina2Frequencia1 picture "9"        
@ 13,41 get nDisciplina2Frequencia2 picture "9"        
@ 13,46 get nDisciplina2Frequencia3 picture "9"        
@ 13,51 get nDisciplina2Frequencia4 picture "9"        
read

nMediaDisciplina2 := ( nDisciplina2Nota1 + nDisciplina2Nota2 + nDisciplina2Nota3 + nDisciplina2Nota4 ) / 4
nFrequencia2 := nDisciplina2Frequencia1 + nDisciplina2Frequencia2 + nDisciplina2Frequencia3 + nDisciplina2Frequencia4

if (nMediaDisciplina2 >= nMedia) 
   SetColor("G+/N")
else
   SetColor("R+/N")
endif

@ 13,55 say AllTrim( Str( nMediaDisciplina2, 0, 1 ))

if (nFrequencia2 < nFrequencia)
   SetColor("G+/N")
else  
   SetColor("R+/N")
endif

@ 13,63 say AllTrim( Str( nFrequencia2 ))

if (nMediaDisciplina2 < nMedia) .or. (nFrequencia2 >= nFrequencia)
   nContarReprovacao2++
endif

if (nContarReprovacao2 >= 1)
   SetColor("R+/N")
   cSituacao := "Reprovado"
else
   SetColor("G+/N")
   cSituacao := "Aprovado"
endif

@ 13,69 say cSituacao
@ 21,02 say cDisciplina2

// disciplina 3
@ 15,01 get cDisciplina3            picture cMascaraTexo Valid !Empty( cDisciplina3 )
@ 15,16 get nDisciplina3Nota1       picture nMascaraNota Valid !Empty( nDisciplina3Nota1 ) .and. nDisciplina3Nota1 >=0 .and. nDisciplina3Nota1 <= 100
@ 15,21 get nDisciplina3Nota2       picture nMascaraNota Valid !Empty( nDisciplina3Nota2 ) .and. nDisciplina3Nota2 >=0 .and. nDisciplina3Nota2 <= 100
@ 15,26 get nDisciplina3Nota3       picture nMascaraNota Valid !Empty( nDisciplina3Nota3 ) .and. nDisciplina3Nota3 >=0 .and. nDisciplina3Nota3 <= 100
@ 15,31 get nDisciplina3Nota4       picture nMascaraNota Valid !Empty( nDisciplina3Nota4 ) .and. nDisciplina3Nota4 >=0 .and. nDisciplina3Nota4 <= 100
@ 15,36 get nDisciplina3Frequencia1 picture "9"        
@ 15,41 get nDisciplina3Frequencia2 picture "9"        
@ 15,46 get nDisciplina3Frequencia3 picture "9"        
@ 15,51 get nDisciplina3Frequencia4 picture "9"  
read

nMediaDisciplina3 := ( nDisciplina3Nota1 + nDisciplina3Nota2 + nDisciplina3Nota3 + nDisciplina3Nota4 ) / 4
nFrequencia3 := nDisciplina3Frequencia1 + nDisciplina3Frequencia2 + nDisciplina3Frequencia3 + nDisciplina3Frequencia4

if (nMediaDisciplina3 >= nMedia) 
   SetColor("G+/N")
   @ 15,55 say AllTrim( Str( nMediaDisciplina3, 0, 1 ))
else
   SetColor("R+/N")
   @ 15,55 say AllTrim( Str( nMediaDisciplina3, 0, 1 ))
endif

if (nFrequencia3 < nFrequencia)
   SetColor("G+/N")
else  
   SetColor("R+/N")
endif

@ 15,63 say AllTrim( Str( nFrequencia3 ))

if (nMediaDisciplina3 < nMedia) .or. (nFrequencia3 >= nFrequencia)
   nContarReprovacao3++
endif

if (nContarReprovacao3 >= 1)
   SetColor("R+/N")
   cSituacao := "Reprovado"
else 
   SetColor("G+/N")
   cSituacao := "Aprovado"
endif

@ 15,69 say cSituacao
@ 22,02 say cDisciplina3

SetColor("W+/N")

// situacao final
nContarReprovacao := nContarReprovacao1 + nContarReprovacao2 + nContarReprovacao3
nReajusteMensalidade := nMensalidade + (nMensalidade * ((20/100) * nContarReprovacao))

if (nContarReprovacao >= 1) .and. (nContarReprovacao <= 2) 
   SetColor("GR+/N")
   cSituacao := "Dependencia"
elseif (nContarReprovacao == 0)
   SetColor("G+/N")
   cSituacao := "Aprovado"
else 
   SetColor("R+/N")
   cSituacao := "Reprovado"
endif

@ 17,18 say "Reprovado"

SetColor("W+/N")

@ 19,50 say "Mensalidade Reajustada: "
@ 20,50 say "RS " + AllTrim( Str( nReajusteMensalidade,0 , 2 ) )

inkey(0)