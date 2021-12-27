;// =============================================== //
;// Nolan Delligatta                                //
;// CPSC 240-03                                     //
;// ndelligatta@csu.fullerton.edu                   //
;// Harmonic Sum Calculator                         //
;// =============================================== //

;================================ Begin code area =====================================================

extern printf
extern fgets
extern stdin
extern strlen
extern atof
extern atoi
extern scanf
extern isfloat
extern reciprocal_sum
global harmonic


section .data

; ==== Lines to be printed for input/output communication ====
ln1   db "We will find your harmonic sum.", 10, 0
ln2   db "Please enter how many numbers are in the set: ", 0
ln3   db " ", 10, 0
ln4   db "Enter your numbers one at a time separated by white space.", 10, 0
ln5   db 10, "The sum of the harmonic sum of these numbers is %lf", 10, 0
ln7   db "The reciprocal of sums will be returned to the driver.", 10, 10, 0
inp   db "%d", 0
err   db 10, "Invalid input encountered. Please run this program again.", 10, 10, "The floating point 1.0 will be returned to the driver.", 10, 10, 0

section .bss
; ==== To be used to store inputs ====
lns   resb 32
numb  resb 32

section .text
harmonic:
; ==== Register backup ====
push  rbp
mov   rbp, rsp
push  rbx
push  rcx
push  rdx
push  rdi
push  rsi
push  r8
push  r9
push  r10
push  r11
push  r12
push  r13
push  r14
push  r15
pushf

; ==== Print first line ====
push  qword 0
mov   rax, 0
mov   rdi, ln1
call  printf
pop   rax

; ==== Print second line & get input for amount of numbers ====
; Print line
push  qword 0
mov   rax, 0
mov   rdi, ln2
call  printf
pop   rax

; Get input for amount of numbers to be inputted
mov   rdi, lns
mov   rsi, 32
mov   rdx, [stdin]
call  fgets

; Strip trailing whitespace out of input
mov   rdi, lns
call  strlen
mov   r14, rax
mov   r15, 0
mov   [lns + r14 - 1], r15

; Convert inputted string to integer
mov   rdi, lns
call  atoi
mov   [lns], rax

; ==== Print third line (Blankspace line) ====
; Print line
push  qword 0
mov   rax, 0
mov   rdi, ln3
call  printf
pop   rax

; ==== Print fourth line ====
; Print line
push  qword 0
mov   rax, 0
mov   rdi, ln4
call  printf
pop   rax

; ==== Start loop preparation ====
mov   r12, [lns] ; Let r12 hold the total count
xor   r13, r13  ; Let r13 be the index counter number
xorpd xmm15, xmm15 ; Let xmm15 be the sum
xorpd xmm14, xmm14 ; Let xmm14 be the current number being converted, reciprocated, and added to xmm15

; ==== Start loop to get numbers ====
loopStart:
; Grab input for current round in loop
push  qword 0
push  qword -1
mov   rax, 0
mov   rdi, numb
mov   rsi, 32
mov   rdx, [stdin]
call  fgets
pop   rax
pop   rax

; Strip trailing white space out of current number
mov   rdi, numb
call  strlen
mov   r14, rax
mov   r15, 0
mov   [numb + r14 - 1], r15

; Validation process for checking if inputted number is a float
mov   rdi, numb
call  isfloat
cmp   rax, 1
jl    error ; Error process if input is not a float

; Convert validated number to float
mov   rdi, numb
call  atof

; Move new float into xmm14
movsd xmm14, xmm0

; Store 1 in xmm13 for math usage
mov   rax, qword 0x3FF0000000000000
push  rax
movsd xmm13, [rsp]
pop   rax

; Divide xmm13 / xmm14 (reciprocal 1/num) & add result to xmm15
divsd xmm13, xmm14
addsd xmm15, xmm13

; Incremenet loop counter, check to see if loop counter exceeds loop total, if not then continue loop
; If finished, then jump to the next block for the next instructions
inc r13
cmp r13, r12
jl  loopStart
jmp next

; ==== Error handling process ====
error:
; Print error messages
push  qword 0
mov   rax, 0
mov   rdi, err
call  printf
pop   rax

; Store 1 in xmm0 and jump to pops and return
mov   rax, qword 0x3FF0000000000000
push  rax
movsd xmm0, [rsp]
pop   rax
jmp   finish

next:
; ==== Print fifth line ====
push  qword 0
push  qword -1
mov   rax, 1
mov   rdi, ln5
movsd xmm0, xmm15
call  printf
pop   rax
pop   rax

; ==== Print sixth line using reciprocal_sum.cpp and its function ====
push  qword 0
push  qword -1
mov   rax, 1
movsd xmm0, xmm15
call  reciprocal_sum
pop   rax
pop   rax

; Store result into xmm14 for backup
movsd xmm14, xmm0

; ==== Print seventh line ====
push  qword 0
mov   rax, 0
mov   rdi, ln7
call  printf
pop   rax

; Returning the returned value from reciprocal_sum to the driver
movsd xmm0, xmm14

finish:
; ==== Register restoration ====
popf
pop  r15
pop  r14
pop  r13
pop  r12
pop  r11
pop  r10
pop  r9
pop  r8
pop  rsi
pop  rdi
pop  rdx
pop  rcx
pop  rbx
pop  rbp

ret

