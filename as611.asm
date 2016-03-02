.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

.DATA
	n db 7
	
.CODE

main:

	call prepare

call exit

;процедура поиска факториала числа
;процедура принимает в регистр bl заранее введенное 8-битное n без знака
;результат содержится в регистре еах

prepare:
	mov ebx,1
	push ebx
	xor ebx,ebx
	mov bl,n
	mov eax,ebx
fact:
	cmp eax, 1
	je return
	push ebx
	push eax
	dec eax
	call fact ; вот она, рекурсия!
	pop ebx
	mul ebx
	pop ebx
return:
	ret

end main