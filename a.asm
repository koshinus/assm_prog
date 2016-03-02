.486
.MODEL FLAT, STDCALL

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA
  a dq ?
  b dq ?
  mess_a db "Enter a 2 real numbers (first number must be not equal zero): ", 0
  input_a db "%lf", 0
  print_res db 13, 10, "X = %lf", 13, 10, 0
  
.CODE
main:  
  push offset mess_a
  call printf 
  add esp, 4
  
  push offset a
  push offset input_a
  call scanf
  add esp, 8
  
  push offset b
  push offset input_a
  call scanf
  add esp, 8
  
  finit
  fldz
  mov eax, offset b
  fld qword ptr [eax]
  FCOMPP
  FSTSW AX
  SAHF
  
  
  finit
  fldz
  mov ebx, offset a
  fld qword ptr [ebx]
  FCOMPP
  SAHF
  
  cdq
  div ebx
  
  push eax
  push offset print_res
  call printf
  add esp,8
  
  call getch
  call getch
  
  call exit
  
END main