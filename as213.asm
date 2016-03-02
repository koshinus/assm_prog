.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

.DATA
  a dd 12
  
.CODE

main:

mov eax, 0

sub eax, a

call exit

end main