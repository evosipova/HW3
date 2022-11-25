	.file	"print_f.c"
	.text
	.section	.rodata
.LC1:
	.string	"%d"
.LC2:
	.string	"\ntime: %.6lf\n"
	.text
	.globl	print_f
	.type	print_f, @function
print_f:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movsd	%xmm0, -80(%rbp)
	movl	%esi, -84(%rbp)
	movsd	%xmm1, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -52(%rbp)
	jmp	.L2
.L4:
	cmpl	$1, -52(%rbp)
	jne	.L3
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	movl	$46, %edi
	call	fputc@PLT
.L3:
	movsd	-80(%rbp), %xmm0
	cvttsd2sil	%xmm0, %edx
	movl	-52(%rbp), %eax
	cltq
	movl	%edx, -48(%rbp,%rax,4)
	movsd	-80(%rbp), %xmm1
	movsd	.LC0(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -80(%rbp)
	movl	-52(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %ecx
	movslq	%ecx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	sarl	$2, %eax
	movl	%ecx, %esi
	sarl	$31, %esi
	subl	%esi, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	-52(%rbp), %eax
	cltq
	movl	%edx, -48(%rbp,%rax,4)
	movl	-52(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %edx
	movq	-72(%rbp), %rax
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	addl	$1, -52(%rbp)
.L2:
	movl	-52(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jl	.L4
	movq	-96(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %xmm0
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	print_f, .-print_f
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1076101120
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
