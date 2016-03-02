.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

len equ 6

.DATA
  ar dw 7,25,12,87,-2,56
  
.CODE

main:
	xor eax,eax
	xor ebx,ebx
	mov esi,offset ar
	mov ax,len
	mov cx,len
	
cycle:
	dec ax
	cmp ax,0
	je res
	push esi
	
	push esi
	call prepare
	add esp, 4
	
	pop esi
	push cx
	mov cx,dx
	mov cx,[esi + type ar*eax]
	mov dx,[esi + type ar*ebx]
	mov [esi + type ar*eax],dx
	mov [esi + type ar*ebx],cx
	pop cx
	jmp cycle
	
	
res:
	
call exit


; Процедура поиска индекса максимального элемента массива
; Вход:
;   аx - текущий максимальный элемент, 16-битное со знаком
;   dx - счетчик, 16-битное без знака
;   cx - текущая просматриваемая длина массива, 16-битное без знака
;   bx - текущий элемент массива, 16-битное со знаком
; Выход:
;   bx - вычисленный индекс максимального элемента, среди элементов ещё не занявших свои места, положительное 16-битное без знака

prepare:
	push ax
	dec cx 
	mov ax,[esi]
	mov dx,0
	mov bx,0
	push bx
computeIndOfMax:
	cmp dx,cx
	je endProc
	inc dx
	add esi,type ar
	mov bx,[esi]
	cmp ax,bx
	jge computeIndOfMax
	mov ax,bx
	pop bx
	mov bx,dx
	push bx
	jmp computeIndOfMax
endProc:
	pop bx
	pop ax
	ret
	
end main