.486
.MODEL FLAT, STDCALL

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA

	n db 7
  
.CODE
main: 

	call prepare
  
call exit
  ; Процедура поиска факториала числа 
; n натуральных чисел  
; Вход:
;   [ebp+8] - n, 32-битное без знака
; Выход:
;   eax - искомая произведение, 32-битное без знака
prepare:
	xor ebx,ebx
	mov bl,n
	mov edx,1
	mov ecx,ebx
	mov eax, ecx
	push eax
	cmp eax,0
	je res
	
fac_n:
	push ebp
	mov ebp, esp
	
	mov eax, [ebp+8]
	cmp eax, 1
	je stop_fac
  
	dec eax
	push eax
	call fac_n
	add esp, 4
	
	mov ecx,0
	add ecx,[ebp+8]
	mul ecx
  
stop_fac:  
	pop ebp
	add esp, 4
	mov edx,eax

res:
	mov eax,edx
	ret

END main