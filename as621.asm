.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

.DATA
  n db 6
  
.CODE
	main:
	
	call prepare

call exit

; Процедура поиска n числа фибоначчи
; Вход:
;   eаx, ebx - числа фиббоначи, 32-битные без знака
;   еdx - счетчик, 32-битное без знака
;   cl - счетчик, 8-битное без знака
; Выход:
;   ebx - n-ное число фиббоначи, 

prepare:
	mov ebx,1
	mov eax,1
	mov cl,n
	cmp cl,0
	je res3
	cmp cl,1
	je res3

;вычиляет в регистре ebx очередное число фибоначчи
;проверяет нужно ли продолжать вычисления


cycle1:
	add ebx,eax
	sub cl,1
	cmp cl,0
	je check
	jmp cycle2
	
;вычисляет в регистре еах очередное число фиббоначчи
;проверяет нужно ли продолжать вычисления

cycle2:
	add eax,ebx
	sub cl,1
	cmp cl,0
	je check
	jmp cycle1
	
;в зависимости от четности числа n, н-ное число находится либо в еах, либо ebx
;процедура делает проверку и записывает н-ное число в ebx

check:
	push eax
	push ebx
	xor eax,eax
	mov al,n
	mov bl,2
	div bl
	cmp ah,0
	je res2

res1:
	pop ebx
	pop eax
	mov ebx,eax
	ret
res2:
	pop ebx
	pop eax
	ret

;случай если н равно 1 или 0
	
res3:
	ret
end main