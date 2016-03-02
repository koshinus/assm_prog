.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

len equ 3

.DATA
  ar1 dw 123,-52,3
  ar2 db len dup(?)
  a db 10
  
.CODE

main:
	mov esi, offset ar1
	mov edi, offset ar2
	mov cx, len
	

cycle:
	cmp cx,0
	je res
	mov ax,[esi]
	
check:
	cmp ax,0
	jge change
	neg ax
	
change:
	div a

right:
	mov [edi],ah
	add esi, type ar1
	add edi, type ar2
	dec cx
	jmp cycle
	
res:
	
	
call exit

end main