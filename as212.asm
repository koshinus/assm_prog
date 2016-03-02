.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

.DATA
  a dw 12
  
.CODE

main:

mov ax, 0

sub ax, a

call exit

end main