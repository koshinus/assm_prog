.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

.DATA
  a dd -36
  b dd 8
  res dd ?
  
.CODE

main:

mov eax, a

xor edx,edx
  
idiv b

mov res, edx

call exit

end main