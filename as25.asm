.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

.DATA
  a dw 75
  n dw 2
  
.CODE

main:

mov ax, a

and a,1

call exit

end main