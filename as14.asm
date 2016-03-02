.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

.DATA
  a dd 6
  b dd 8
  d dd 17
  
.CODE

main:

mov eax, a

mov ebx, b

mov edx, 0

mul ebx
  
div d

call exit

end main