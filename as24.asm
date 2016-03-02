.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

.DATA
  a dd 75
  n dd 6
  
.CODE

main:

mov eax, a

mov ecx, n

shr eax, ecx

call exit

end main