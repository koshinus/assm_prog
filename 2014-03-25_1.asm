.486
.MODEL FLAT, STDCALL

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA
  a1 dd 10
  a2 dd -10
  a3 dw 5
  a4 dw -5
  a5 db 64
  a6 db -64
  
.CODE
main: 
  mov eax, 0AABBCCDDH
  push eax
  pop ebx
  
  push ax
  pop cx
  
;  push al
;  pop dl

  push a1
  mov esi, offset a2
  pop dword ptr [esi]

  push a3
  mov esi, offset a4
  pop word ptr [esi]

;  push a5
;  mov esi, offset a6
;  pop byte ptr [esi]
  
  call exit
END main






