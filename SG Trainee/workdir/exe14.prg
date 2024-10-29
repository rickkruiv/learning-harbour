Clear
#include "inkey.ch"

do while .t.
   nCodigoCliente := 0 // nome variavel de ncodCli para nCodigoCliente // 0 ao inves do Space(06)

   @ 12,10 say "Informe o codigo do cliente"

   @ 12,40 get nCodigoCliente picture "999999" // pict para picture
   read

   if lastkey() == 27
      Exit // loop por exit para sair do looping
   endif
enddo
