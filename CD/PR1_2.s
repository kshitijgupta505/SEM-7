	.file	"PR1_2.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC1:
	.ascii "Enter Identifier: \0"
LC2:
	.ascii "%s\0"
LC3:
	.ascii "\12%s is a Keyword.\12\0"
	.align 4
LC4:
	.ascii "\12%s is Not a valid Identifier.\12\0"
LC5:
	.ascii "\12%s is a valid Identifier.\12\0"
	.data
	.align 32
LC0:
	.ascii "auto\0"
	.space 5
	.ascii "break\0"
	.space 4
	.ascii "case\0"
	.space 5
	.ascii "char\0"
	.space 5
	.ascii "const\0"
	.space 4
	.ascii "continue\0"
	.space 1
	.ascii "default\0"
	.space 2
	.ascii "do\0"
	.space 7
	.ascii "double\0"
	.space 3
	.ascii "else\0"
	.space 5
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	andl	$-16, %esp
	subl	$144, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	call	___main
	leal	36(%esp), %eax
	movl	$LC0, %ebx
	movl	$25, %edx
	movl	%eax, %edi
	movl	%ebx, %esi
	movl	%edx, %ecx
	rep movsl
	movl	$LC1, (%esp)
	call	_printf
	leal	26(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	movl	$0, 140(%esp)
	jmp	L2
L5:
	leal	36(%esp), %ecx
	movl	140(%esp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	leal	(%ecx,%eax), %edx
	leal	26(%esp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L3
	leal	26(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	movl	$0, %eax
	jmp	L12
L3:
	addl	$1, 140(%esp)
L2:
	cmpl	$9, 140(%esp)
	jle	L5
	movzbl	26(%esp), %eax
	movsbl	%al, %eax
	movl	%eax, (%esp)
	call	_isalpha
	testl	%eax, %eax
	jne	L6
	movzbl	26(%esp), %eax
	cmpb	$95, %al
	jne	L7
L6:
	movl	$1, 136(%esp)
	jmp	L8
L10:
	leal	26(%esp), %edx
	movl	136(%esp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, (%esp)
	call	_isalnum
	testl	%eax, %eax
	jne	L9
	leal	26(%esp), %edx
	movl	136(%esp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$95, %al
	je	L9
	leal	26(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	movl	$0, %eax
	jmp	L12
L9:
	addl	$1, 136(%esp)
L8:
	leal	26(%esp), %edx
	movl	136(%esp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	L10
	leal	26(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	jmp	L11
L7:
	leal	26(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf
L11:
	movl	$0, %eax
L12:
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_isalpha;	.scl	2;	.type	32;	.endef
	.def	_isalnum;	.scl	2;	.type	32;	.endef
