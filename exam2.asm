.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA
	print_format db 13, 10, "%d", 13, 10, 0
	
.CODE

main:
	mov ecx,3
	mov edx,0
	call binomial

call exit
;процедура поиска минимального элемента массива
; Вход:
;   [ebp+4] - указатель на n
; Выход:
;   нет
pascal_triangle:
	push ebp
	mov ebp,esp
	
	push eax
	push ebx
	push ecx
	push edx
	
computation:
	mov ecx,0
	cmp ecx,[ebp+4]
	jg res
	mov edx,-1
binomial_series:
	inc edx
	cmp edx,ecx
	jg newline_output
	push ecx
	call binomial
	pop ecx
output:
	push eax
	push ebx
	push ecx
	push edx
	
	push eax
	push offset print_format1
	call printf
	add esp,8
	
	pop edx
	pop ecx
	pop ebx
	pop eax
	
	jmp binomial_series
newline_output:
	push eax
	push ebx
	push ecx
	push edx
	
	push eax
	push offset print_format2
	call printf
	add esp,8
	
	pop edx
	pop ecx
	pop ebx
	pop eax
	
	jmp binomial_series
binomial:
	mov eax,1
	push ecx
	push edx
	call fact 	;вычисляем n!
	pop edx
	pop ecx
	sub ecx,edx	;вычисляем (n-k)!
	push eax 	;спасаем n!
	mov eax,1
	push edx
	call fact 	;вычисляем (n-k)!
	pop edx
	mov ebx,eax ;заносим (n-k)!
	mov eax,1
	mov ecx,edx
	call fact	;вычисляем k!
	mov ecx,eax	;заносим k!
	pop eax
	xor edx,edx 
	div ecx		;вычисляем n!/k!
	xor edx,edx
	div ebx		;вычисляем n!/k!(n-k)!
	ret
fact:
	cmp ecx,0
	jng return
	mul ecx
	dec ecx
	jmp fact
return:
	ret
	
res:
	pop edx
	pop ecx
	pop ebx
	pop eax
	
	pop ebp
	
	ret
	
END main