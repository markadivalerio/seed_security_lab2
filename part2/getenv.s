	.file	"getenv.c"
	.section	.rodata
	.align 4
.LC0:
	.string	"Usage: %s <environment var> <target program name>\n"
.LC1:
	.string	"%s will be at %p\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%ebx
	andl	$-16, %esp
	subl	$48, %esp
	cmpl	$2, 8(%ebp)
	jg	.L2
	.cfi_offset 3, -16
	.cfi_offset 7, -12
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	$.LC0, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	$0, (%esp)
	call	exit
.L2:
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	getenv
	movl	%eax, 44(%esp)
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$-1, 28(%esp)
	movl	%eax, %edx
	movl	$0, %eax
	movl	28(%esp), %ecx
	movl	%edx, %edi
	repnz scasb
	movl	%ecx, %eax
	notl	%eax
	leal	-1(%eax), %ebx
	movl	12(%ebp), %eax
	addl	$8, %eax
	movl	(%eax), %eax
	movl	$-1, 28(%esp)
	movl	%eax, %edx
	movl	$0, %eax
	movl	28(%esp), %ecx
	movl	%edx, %edi
	repnz scasb
	movl	%ecx, %eax
	notl	%eax
	subl	$1, %eax
	movl	%ebx, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%eax, 44(%esp)
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %edx
	movl	$.LC1, %eax
	movl	44(%esp), %ecx
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	$0, %eax
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_def_cfa 4, 4
	.cfi_restore 5
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
