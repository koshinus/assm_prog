.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

.DATA
  year dw 2001
  b dw 4
  d dw 100
  e dw 400
  
.CODE

main:
mov ax,year
mov bx,year

xor dx,dx
div e
cmp dx,0
je c1

mov ax,bx
xor dx,dx
div b
cmp dx,0
jne c2

xor dx,dx
mov ax,bx
div d
cmp dx,0
jne c1

c1:
mov ax,1
mov cx,ax
c2:
;add ax,0
mov ax,cx

call exit

end main