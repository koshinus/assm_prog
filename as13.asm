.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib


.DATA
  a dd 0A0000000H
  b dd 0
  
.CODE

main:

mov eax, a

mov ebx, b

add eax, eax

dec b

call exit

end main