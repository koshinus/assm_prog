.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

.DATA
  a db 0
  
.CODE

main:

mov al, 0

sub al, a

; not al
; inc al

call exit

end main