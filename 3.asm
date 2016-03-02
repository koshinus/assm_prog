.486
.MODEL FLAT, STDCALL

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA
year dw 400
a dw 400
b dw 4
d dw 100
.CODE 
main:
mov ax, year
xor dx, dx
div a
cmp dx, 0
je th
mov ax, year 
xor dx, dx
div b
cmp dx, 0
mov ax, 0
jne th1
mov ax, year 
xor dx, dx
div d
cmp dx, 0
jne th
mov ax, 0
jmp th1
th: 
mov ax, 1
th1: 
call exit
end main