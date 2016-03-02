.486
.MODEL FLAT, STDCALL

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA
a dd 4
b dd 2
d dd 3
.CODE
main:
mov eax, a
mov edx, 0
div b
cmp edx, 0
je th
mov eax, a
mul d
dec eax
th:
mov a, eax
call exit
end main
