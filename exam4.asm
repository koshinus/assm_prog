.486
.MODEL FLAT, STDCALL

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

len equ 7

.DATA
  
.CODE
main: 
	mov eax,10
	push eax
	call summ_n
	add esp,4
	
	mov eax,100
	push eax
	call summ_n
	add esp,4
call exit
;процедура суммирования первых н натуральных чисел
;Вход:
;	[ebp+8] - n,32-битное без знака
;Выход:
;	еах - искомая сумма, 32-битное без знака
summ_n:
	push ebp
	mov ebp,esp
	
	mov eax,[ebp+8]
	cmp eax, 1
	je stop_summ
	
	dec eax
	push eax
	call summ_n
	add esp,4
	
	add eax,[ebp+8]
	
stop_summ:
	pop ebp
	ret
END main




	mov bx,[esi+2]
	add esi,type ar
	cmp ax,bx
	jg indOfMax
	mov ax,bx
	mov dx,si
	loop indOfMax
swap:
	mov si,cx
	mov ax,[esi+2]
	mov si,dx
	mov bx,word ptr [esi]
	mov ax,ar[esi]
	mov si,cx
	mov bx,ar[esi]