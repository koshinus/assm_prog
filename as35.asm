.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

.DATA
  n db 8
  
  
.CODE
main:
mov eax,1
mov cl,n

cycle:
mul cl
loop cycle

call exit

end main