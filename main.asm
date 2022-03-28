; main.asm - Assembly language source file
; Author: Afham Bashir 
; Date:   02/19/2021
; Description: Fibonnaci Array Program

; main.asm - Assembly language source file

.386
.model flat,stdcall
.stack 1000h

.data
	fib DWORD 20 DUP(?) ; arrays of 20 uninitialzed values 

.code
main PROC		; main procedure, entry point

	mov ESI,OFFSET fib				;esi contains address offsett
	mov fib,1						;initalize first element to 1 
	mov fib+4,1						;initalize second element to 2
	add ESI,TYPE fib				;move esi to second element 
	add ESI,TYPE fib				;move esi to third element 
	mov ECX,LENGTHOF fib-2 			; set up loop counter, already first 2 elements intalized

L1:
	mov EAX,[ESI]-4					;moves previous element into eax
	add EAX,[ESI]-8					;adds N-2(th) element into eax to find sum
	mov [ESI],EAX					;moves sum from eax register into the array 
	add ESI,4						; advance source to next element in fib sequence
	loop L1							; loop to process next element

	ret			; end the program
main ENDP
END
