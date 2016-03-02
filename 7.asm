.486

.MODEL Flat, StdCall

INCLUDE stdlib.inc

INCLUDELIB msvcrt.lib

.DATA
	a dd 2
	b dd 14
	
.CODE

main:
	mov eax,b
	mov ebx,eax
	div a
	mov edx,eax
	mov eax,ebx
	mov ecx,0
	;в eax - число, которое мы постоянно делим
	;в ebx - мы сохраняем изначальное число
	;в edx - еах пополам, до него мы идем
	;в ecx - текущий делитель
sumOfDivisiors:
	inc ecx
	cmp ecx,edx
	je endProc
	mov eax,ebx
	push edx
	div ecx
	cmp edx,0
	jne sumOfDivisiors
action:
	pop edx
	pop eax
	add eax,ecx
	push eax
	jmp sumOfDivisiors
	
endProc: 

call exit

end main