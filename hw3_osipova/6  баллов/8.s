	.file	"8.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Incrorrect input, check README.md"
.LC1:
	.string	"-r"
.LC2:
	.string	"w"
.LC3:
	.string	"incorrect file"
.LC4:
	.string	"random number: N = %d\n"
.LC6:
	.string	"-h"
.LC7:
	.string	"\n-h help"
	.align 8
.LC8:
	.string	"-r create random numbers (a, b, A, B)"
	.align 8
.LC9:
	.string	"-f use numbers from first file and save result in second file"
	.align 8
.LC10:
	.string	"-s take numbers from terminal and print result in file"
.LC11:
	.string	"-f"
.LC12:
	.string	"r"
.LC13:
	.string	"%d"
.LC14:
	.string	"-s"
	.align 8
.LC15:
	.string	"incorrect input, N must be 1 - 9"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movl	%edi, -116(%rbp)
	movq	%rsi, -128(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$2, -116(%rbp)
	je	.L2
	cmpl	$4, -116(%rbp)
	je	.L2
	cmpl	$3, -116(%rbp)
	je	.L2
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L3
.L2:
	movq	-128(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L4
	cmpl	$3, -116(%rbp)
	je	.L5
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L3
.L5:
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movq	-128(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L6
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L3
.L6:
	call	rand@PLT
	cltd
	shrl	$29, %edx
	addl	%edx, %eax
	andl	$7, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	%eax, -108(%rbp)
	movl	-108(%rbp), %edx
	movq	-32(%rbp), %rax
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	call	clock@PLT
	movq	%rax, -96(%rbp)
	movl	$0, %eax
	call	pi_N@PLT
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	call	clock@PLT
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	subq	-96(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC5(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	movl	-108(%rbp), %ecx
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rax
	movapd	%xmm0, %xmm1
	movl	%ecx, %esi
	movq	%rdx, %xmm0
	movq	%rax, %rdi
	call	print_f@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	jmp	.L7
.L4:
	movq	-128(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L8
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L7
.L8:
	movq	-128(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC11(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L9
	cmpl	$4, -116(%rbp)
	je	.L10
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L3
.L10:
	movq	-128(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	.LC12(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -64(%rbp)
	movq	-128(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -56(%rbp)
	cmpq	$0, -64(%rbp)
	je	.L12
	cmpq	$0, -56(%rbp)
	jne	.L13
.L12:
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L3
.L13:
	leaq	-112(%rbp), %rdx
	movq	-64(%rbp), %rax
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	call	clock@PLT
	movq	%rax, -96(%rbp)
	movl	$0, %eax
	call	pi_N@PLT
	movq	%xmm0, %rax
	movq	%rax, -48(%rbp)
	call	clock@PLT
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	subq	-96(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC5(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movl	-112(%rbp), %ecx
	movsd	-40(%rbp), %xmm0
	movq	-48(%rbp), %rdx
	movq	-56(%rbp), %rax
	movapd	%xmm0, %xmm1
	movl	%ecx, %esi
	movq	%rdx, %xmm0
	movq	%rax, %rdi
	call	print_f@PLT
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	jmp	.L7
.L9:
	movq	-128(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC14(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L7
	cmpl	$3, -116(%rbp)
	je	.L14
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L3
.L14:
	movq	-128(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -104(%rbp)
	cmpq	$0, -104(%rbp)
	jne	.L16
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L3
.L16:
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-112(%rbp), %eax
	cmpl	$9, %eax
	jg	.L17
	movl	-112(%rbp), %eax
	testl	%eax, %eax
	jg	.L18
.L17:
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L3
.L18:
	call	clock@PLT
	movq	%rax, -96(%rbp)
	movl	$0, %eax
	call	pi_N@PLT
	movq	%xmm0, %rax
	movq	%rax, -88(%rbp)
	call	clock@PLT
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	subq	-96(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC5(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -72(%rbp)
	movl	-112(%rbp), %ecx
	movsd	-72(%rbp), %xmm0
	movq	-88(%rbp), %rdx
	movq	-104(%rbp), %rax
	movapd	%xmm0, %xmm1
	movl	%ecx, %esi
	movq	%rdx, %xmm0
	movq	%rax, %rdi
	call	print_f@PLT
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L7:
	movl	$0, %eax
.L3:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L19
	call	__stack_chk_fail@PLT
.L19:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC5:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
