.486

.MODEL TINY

.DOSSEG

.DATA

	len equ 7
	a dd 3
	ar dd 7,25,23,87,-2,56,3

.CODE

main:
	push a
	push len
	mov esi,offset ar
	push esi
	call to_work
	add esp, 12

	mov ax,4C00h
		int  21h

; Процедура поиска элемента в массиве
; Вход:
;   eаx - искомый элемент, 32-битное со знаком
;   edx - счетчик, 32-битное без знака
;   ecx - длина массива, 32-битное без знака
; Выход:
;   edx - вычисленный индекс искомого элемента, 32-битное со знаком
to_work:
	push ebp
	mov ebp,esp
	
	pusha
	xor eax,eax
	xor ecx,ecx
	xor edx,edx
	mov esi,[ebp+8]
	mov ecx,[ebp+12]
	mov eax,[ebp+16]
	
work:
	cmp [esi],eax
	je found_el
	add esi,type ar
	inc edx
	loop work
not_found:
	mov edx,-1
found_el:
	popa
	pop ebp
	ret
	cseg ends

END main