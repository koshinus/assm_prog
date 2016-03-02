.486
.MODEL FLAT, STDCALL

INCLUDE stdlib.inc
INCLUDE stdio.inc
INCLUDELIB msvcrt.lib

.DATA
  a dq ?
  mess_a db "Enter a real number: ", 0
  input_a db "%lf", 0
  print_pos db 13, 10, "You have entered a positive number", 13, 10, 0
  print_neg db 13, 10, "You have entered a negative number", 13, 10, 0
  print_z db 13, 10, "You have entered zero", 13, 10, 0
  
.CODE
main: 
  push offset mess_a
  call printf 
  add esp, 4
  
  push offset a
  push offset input_a
  call scanf
  add esp, 8
  
  finit
  fldz
  mov eax, offset a
  fld qword ptr [eax]
  FCOMPP
  FSTSW AX
  SAHF
  
  jb @less
  jz @zero
  
  push offset print_pos
  jmp @print
  
@zero:  
  push offset print_z
  jmp @print
  
@less:
  push offset print_neg
  
@print:
  call printf
  add esp, 4  
  
  call getch
  call getch
  
  call exit
  
END main