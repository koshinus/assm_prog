.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

.DATA
  a dd 1
  b dd 2
  d dd ?
  
.CODE

main:

mov eax, a

;mov ebx, b

add eax, b

mov d, eax

call exit

end main