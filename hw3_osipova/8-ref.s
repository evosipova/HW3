	.file	"8.c"
	.intel_syntax noprefix
	.text
	.globl	pi_N
	.type	pi_N, @function
pi_N:
	push	rbp
	push	rbx				#rbx = i
	mov	rbp, rsp
	movsd	xmm0, QWORD PTR .LC0[rip]
	movsd	xmm2, xmm0			#pi
	movsd	xmm0, QWORD PTR .LC1[rip]	#xmm2 = pi
	movsd	xmm3, xmm0			#a
	movsd	xmm0, QWORD PTR .LC0[rip]	#xmm3 = a
	movsd	xmm4, xmm0			#b
	movsd	xmm0, QWORD PTR .LC2[rip]	#xmm4 = c
	movsd	xmm5, xmm0			#c
	mov	rbx, 0				#int i = 0
	jmp	.L2
.L3:
	movsd	xmm0, xmm3
	mulsd	xmm0, xmm4
	mulsd	xmm0, xmm5
	movsd	xmm1, QWORD PTR .LC2[rip]
	divsd	xmm1, xmm0
	movapd	xmm0, xmm1
	movsd	xmm1, xmm2
	addsd	xmm0, xmm1
	movsd	xmm2, xmm0
	movsd	xmm1, xmm3
	movsd	xmm0, QWORD PTR .LC1[rip]
	addsd	xmm0, xmm1
	movsd	xmm3, xmm0
	movsd	xmm1, xmm4
	movsd	xmm0, QWORD PTR .LC1[rip]
	addsd	xmm0, xmm1
	movsd	xmm4, xmm0
	movsd	xmm1, xmm5
	movsd	xmm0, QWORD PTR .LC1[rip]
	addsd	xmm0, xmm1
	movsd	xmm5, xmm0
	movsd	xmm0, xmm3
	mulsd	xmm0, xmm4
	mulsd	xmm0, xmm5
	movsd	xmm1, QWORD PTR .LC2[rip]
	divsd	xmm1, xmm0
	movapd	xmm0, xmm1
	movsd	xmm1, xmm2
	subsd	xmm1, xmm0
	movapd	xmm0, xmm1
	movsd	xmm2, xmm0
	movsd	xmm1, xmm3
	movsd	xmm0, QWORD PTR .LC1[rip]
	addsd	xmm0, xmm1
	movsd	xmm3, xmm0
	movsd	xmm1, xmm4
	movsd	xmm0, QWORD PTR .LC1[rip]
	addsd	xmm0, xmm1
	movsd	xmm4, xmm0
	movsd	xmm1, xmm5
	movsd	xmm0, QWORD PTR .LC1[rip]
	addsd	xmm0, xmm1
	movsd	xmm5, xmm0
	add	rbx, 1
.L2:
	cmp	rbx, 999
	jle	.L3
	movsd	xmm0, xmm2	#return pi
	mov	rsp, rbp
	pop	rbx
	pop	rbp
	ret
	.size	pi_N, .-pi_N
	.section	.rodata
.LC4:
	.string	"%d"
.LC5:
	.string	"\ntime: %.6lf\n"
	.text
	.globl	print_f
	.type	print_f, @function
print_f:
	push	rbp
	push 	r12				#r12 = out
	push	r13				#r13 = N
	push	r14				#r14 = i
	push	r15				#r15 = arr
	mov	rbp, rsp
	mov	r12, rdi			#out
	movsd	xmm6, xmm0			#pi 
	mov	r13, rsi			#int N
	movsd	xmm7, xmm1		#double t (time)
	mov	r14, 0		#int i = 0
	jmp	.L6
.L8:
	cmp	r14, 1
	jne	.L7
	mov	rax, r12
	mov	rsi, rax
	mov	edi, 46
	call	fputc@PLT
.L7:
	movsd	xmm0, xmm6
	cvttsd2si	edx, xmm0
	mov	rax, r14
	cdqe
	mov	r15, rdx
	movsd	xmm1, xmm6
	movsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm0, xmm1
	movsd	xmm6, xmm0
	mov	rax, r14
	cdqe
	mov	rcx, r15
	mov	edx, 1717986919
	mov	eax, ecx
	imul	edx
	sar	edx, 2
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	add	eax, eax
	sub	ecx, eax
	mov	edx, ecx
	mov	rax, r14
	cdqe
	mov	r15, rdx
	mov	rax, r14
	cdqe
	mov	rdx, r15	
	mov	rax, r12			#out
	lea	rsi, .LC4[rip]			#%d
	mov	rdi, rax			#arr(i)
	mov	eax, 0
	call	fprintf@PLT			#void func
	add	r14, 1
.L6:
	mov	rax, r14
	cmp	rax, r13
	jl	.L8
	movq	rdx, xmm7
	mov	rax, r12
	movq	xmm8, rdx
	movsd	xmm0, xmm8	#t
	lea	rsi, .LC5[rip]			#" "
	mov	rdi, rax			#out
	mov	eax, 1
	call	fprintf@PLT
	nop
	mov	rsp, rbp
	pop	r15
	pop	r14
	pop	r13
	pop	r12
	pop	rbp
	ret
	.size	print_f, .-print_f
	.section	.rodata
	.align 8
.LC6:
	.string	"Incrorrect input, check README.md"
.LC7:
	.string	"-r"
.LC8:
	.string	"w"
.LC9:
	.string	"incorrect file"
.LC10:
	.string	"random number: N = %d\n"
.LC12:
	.string	"-h"
.LC13:
	.string	"\n-h help"
	.align 8
.LC14:
	.string	"-r create random numbers (a, b, A, B)"
	.align 8
.LC15:
	.string	"-f use numbers from first file and save result in second file"
	.align 8
.LC16:
	.string	"-s take numbers from terminal and print result in file"
.LC17:
	.string	"-f"
.LC18:
	.string	"r"
	.align 8
.LC19:
	.string	"incorrect input, N must be 1 - 9"
.LC20:
	.string	"-s"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 144
	mov	DWORD PTR -116[rbp], edi #argc
	mov	QWORD PTR -128[rbp], rsi #argc
	cmp	DWORD PTR -116[rbp], 2
	je	.L10
	cmp	DWORD PTR -116[rbp], 4
	je	.L10
	cmp	DWORD PTR -116[rbp], 3
	je	.L10
	lea	rdi, .LC6[rip]
	call	puts@PLT
	mov	eax, 0
	jmp	.L11
.L10:
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC7[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L12
	cmp	DWORD PTR -116[rbp], 3
	je	.L13
	lea	rdi, .LC6[rip]
	call	puts@PLT
	mov	eax, 0
	jmp	.L11
.L13:
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC8[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -80[rbp], rax  #out
	cmp	QWORD PTR -80[rbp], 0
	jne	.L14
	lea	rdi, .LC9[rip]
	call	puts@PLT
	mov	eax, 0
	jmp	.L11
.L14:
	call	rand@PLT
	mov	edx, eax   #random N
	mov	eax, edx
	sar	eax, 31
	shr	eax, 29
	add	edx, eax
	and	edx, 7
	sub	edx, eax
	mov	eax, edx
	add	eax, 1
	mov	DWORD PTR -84[rbp], eax
	mov	edx, DWORD PTR -84[rbp]
	mov	rax, QWORD PTR -80[rbp]
	lea	rsi, .LC10[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	eax, 0
	call	pi_N      #no arguments
	movq	rax, xmm0  #save pi
	mov	QWORD PTR -96[rbp], rax
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	sub	rax, QWORD PTR -16[rbp]
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC11[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -104[rbp], xmm0
	movsd	xmm0, QWORD PTR -104[rbp]
	mov	ecx, DWORD PTR -84[rbp]
	mov	rdx, QWORD PTR -96[rbp]
	mov	rax, QWORD PTR -80[rbp]
	movapd	xmm1, xmm0
	mov	esi, ecx
	mov	QWORD PTR -136[rbp], rdx
	movsd	xmm0, QWORD PTR -136[rbp]
	mov	rdi, rax
	call	print_f
	mov	rax, QWORD PTR -80[rbp]
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L15
.L12:
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC12[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L16
	lea	rdi, .LC13[rip]
	call	puts@PLT
	lea	rdi, .LC14[rip]
	call	puts@PLT
	lea	rdi, .LC15[rip]
	call	puts@PLT
	lea	rdi, .LC16[rip]
	call	puts@PLT
	jmp	.L15
.L16:
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC17[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L17
	cmp	DWORD PTR -116[rbp], 4
	je	.L18
	lea	rdi, .LC6[rip]
	call	puts@PLT
	mov	eax, 0
	jmp	.L11
.L18:
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC18[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -48[rbp], rax #input
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC8[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -56[rbp], rax     #output
	cmp	QWORD PTR -48[rbp], 0
	je	.L20
	cmp	QWORD PTR -56[rbp], 0
	jne	.L21
.L20:
	lea	rdi, .LC9[rip]
	call	puts@PLT
	mov	eax, 0
	jmp	.L11
.L21:
	lea	rdx, -108[rbp]
	mov	rax, QWORD PTR -48[rbp]
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	eax, DWORD PTR -108[rbp]
	cmp	eax, 9
	jg	.L22
	mov	eax, DWORD PTR -108[rbp]
	test	eax, eax
	jg	.L23
.L22:
	lea	rdi, .LC19[rip]
	call	puts@PLT
	mov	eax, 0
	jmp	.L11
.L23:
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax     #scanf N
	mov	eax, 0
	call	pi_N
	movq	rax, xmm0  #return pi from pi_N
	mov	QWORD PTR -64[rbp], rax
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	sub	rax, QWORD PTR -16[rbp]
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC11[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -72[rbp], xmm0
	mov	ecx, DWORD PTR -108[rbp]
	movsd	xmm0, QWORD PTR -72[rbp]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -56[rbp]
	movapd	xmm1, xmm0   #pi
	mov	esi, ecx
	mov	QWORD PTR -136[rbp], rdx  #N
	movsd	xmm0, QWORD PTR -136[rbp] #t
	mov	rdi, rax #out
	call	print_f
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -56[rbp]
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L15
.L17:
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC20[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L15
	cmp	DWORD PTR -116[rbp], 3
	je	.L24
	lea	rdi, .LC6[rip]
	call	puts@PLT
	mov	eax, 0
	jmp	.L11
.L24:
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC8[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax #out
	cmp	QWORD PTR -8[rbp], 0 #int i = 0
	jne	.L26
	lea	rdi, .LC9[rip]
	call	puts@PLT
	mov	eax, 0
	jmp	.L11
.L26:
	lea	rax, -112[rbp]
	mov	rsi, rax
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -112[rbp]
	cmp	eax, 9
	jg	.L27
	mov	eax, DWORD PTR -112[rbp]
	test	eax, eax
	jg	.L28
.L27:
	lea	rdi, .LC19[rip]
	call	puts@PLT
	mov	eax, 0
	jmp	.L11
.L28:
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax #int N
	mov	eax, 0
	call	pi_N
	movq	rax, xmm0 #pi from pi_N
	mov	QWORD PTR -24[rbp], rax
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	sub	rax, QWORD PTR -16[rbp]
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC11[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -40[rbp], xmm0
	mov	ecx, DWORD PTR -112[rbp]
	movsd	xmm0, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	movapd	xmm1, xmm0
	mov	esi, ecx
	mov	QWORD PTR -136[rbp], rdx
	movsd	xmm0, QWORD PTR -136[rbp]
	mov	rdi, rax
	call	print_f
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
.L15:
	mov	eax, 0
.L11:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1074266112
	.align 8
.LC1:
	.long	0
	.long	1073741824
	.align 8
.LC2:
	.long	0
	.long	1074790400
	.align 8
.LC3:
	.long	0
	.long	1076101120
	.align 8
.LC11:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
