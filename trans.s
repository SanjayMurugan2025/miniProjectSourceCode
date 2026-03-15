	.file	"trans.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "r+b\0"
.LC1:
	.ascii "credit.dat\0"
.LC2:
	.ascii "w+b\0"
	.align 8
.LC3:
	.ascii "%s: File could not be opened.\12\0"
.LC4:
	.ascii "Incorrect choice\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	call	__main
	leaq	.LC0(%rip), %rdx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L2
	leaq	.LC2(%rip), %rdx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -8(%rbp)
.L2:
	cmpq	$0, -8(%rbp)
	jne	.L4
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	leaq	.LC3(%rip), %rcx
	movq	%rax, %rdx
	call	printf
	movl	$-1, %ecx
	call	exit
.L10:
	cmpl	$4, -12(%rbp)
	je	.L5
	cmpl	$4, -12(%rbp)
	ja	.L6
	cmpl	$3, -12(%rbp)
	je	.L7
	cmpl	$3, -12(%rbp)
	ja	.L6
	cmpl	$1, -12(%rbp)
	je	.L8
	cmpl	$2, -12(%rbp)
	je	.L9
	jmp	.L6
.L8:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	updateRecord
	jmp	.L4
.L9:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	newRecord
	jmp	.L4
.L7:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	deleteRecord
	jmp	.L4
.L5:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	textFile
	call	displayTextFile
	jmp	.L4
.L6:
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	puts
	nop
.L4:
	call	enterChoice
	movl	%eax, -12(%rbp)
	cmpl	$5, -12(%rbp)
	jne	.L10
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movl	$0, %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC5:
	.ascii "w\0"
.LC6:
	.ascii "accounts.txt\0"
.LC7:
	.ascii "File could not be opened.\0"
.LC8:
	.ascii "Last Name\0"
.LC9:
	.ascii "Acct\0"
.LC10:
	.ascii "%-6s%-16s%-11s%10s\12\0"
.LC11:
	.ascii "Balance\0"
.LC12:
	.ascii "First Name\0"
.LC13:
	.ascii "%-6d%-16s%-11s%10.2f\12\0"
	.text
	.globl	textFile
	.def	textFile;	.scl	2;	.type	32;	.endef
	.seh_proc	textFile
textFile:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$112, %rsp
	.seh_stackalloc	112
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	pxor	%xmm0, %xmm0
	movaps	%xmm0, -64(%rbp)
	movaps	%xmm0, -48(%rbp)
	movups	%xmm0, -39(%rbp)
	leaq	.LC5(%rip), %rdx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L13
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	puts
	jmp	.L17
.L13:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	rewind
	leaq	.LC8(%rip), %r9
	leaq	.LC9(%rip), %r8
	leaq	.LC10(%rip), %rdx
	movq	-8(%rbp), %rax
	leaq	.LC11(%rip), %rcx
	movq	%rcx, 40(%rsp)
	leaq	.LC12(%rip), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	fprintf
	jmp	.L15
.L16:
	movq	16(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %r9
	movl	$1, %r8d
	movl	$41, %edx
	movq	%rax, %rcx
	call	fread
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	je	.L15
	movl	-64(%rbp), %eax
	testl	%eax, %eax
	je	.L15
	movsd	-35(%rbp), %xmm0
	movl	-64(%rbp), %r8d
	leaq	-64(%rbp), %rax
	leaq	4(%rax), %r9
	leaq	.LC13(%rip), %rdx
	movq	-8(%rbp), %rax
	movsd	%xmm0, 40(%rsp)
	leaq	-64(%rbp), %rcx
	addq	$19, %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	fprintf
.L15:
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	feof
	testl	%eax, %eax
	je	.L16
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
.L17:
	nop
	addq	$112, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC14:
	.ascii "Enter account to update (1 - 100): \0"
.LC15:
	.ascii "%s\0"
.LC16:
	.ascii "%u\0"
	.align 8
.LC17:
	.ascii "Account #%d has no information.\12\0"
.LC18:
	.ascii "Enter PIN: \0"
.LC19:
	.ascii "%d\0"
.LC20:
	.ascii "PIN verified. Access granted.\0"
.LC21:
	.ascii "Welcome %s %s\12\0"
	.align 8
.LC22:
	.ascii "Incorrect PIN. You have %d attempts remaining.\12\0"
	.align 8
.LC23:
	.ascii "Incorrect PIN. Too many incorrect attempts. Access denied.\0"
.LC24:
	.ascii "Account: %d | %.2f\12\0"
.LC25:
	.ascii "Enter choice \0"
.LC26:
	.ascii "\12"
	.ascii "1-Deposit\0"
.LC27:
	.ascii "\12"
	.ascii "2-Withdrawal\0"
.LC28:
	.ascii "3-Balance Enquiry\12:\0"
.LC29:
	.ascii "Enter deposit amount: \0"
.LC30:
	.ascii "%lf\0"
	.align 8
.LC32:
	.ascii "Invalid deposit amount! Please enter a positive number.\0"
.LC33:
	.ascii "Deposit successful\0"
.LC34:
	.ascii "Updated Balance: %.2f\12\0"
.LC35:
	.ascii "Enter withdrawal amount: \0"
	.align 8
.LC36:
	.ascii "Insufficient balance! You only have %f.\12\0"
.LC37:
	.ascii "Withdrawal successful\0"
.LC38:
	.ascii "\12===== BALANCE ENQUIRY =====\0"
.LC39:
	.ascii "Account Number : %d\12\0"
.LC40:
	.ascii "Name           : %s %s\12\0"
.LC41:
	.ascii "Current Balance: %.2f\12\0"
.LC42:
	.ascii "===========================\0"
.LC43:
	.ascii "Invalid choice!\0"
	.text
	.globl	updateRecord
	.def	updateRecord;	.scl	2;	.type	32;	.endef
	.seh_proc	updateRecord
updateRecord:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$112, %rsp
	.seh_stackalloc	112
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	leaq	.LC14(%rip), %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	call	fflush
	leaq	-12(%rbp), %rax
	leaq	.LC16(%rip), %rcx
	movq	%rax, %rdx
	call	scanf
	movl	-12(%rbp), %eax
	leal	-1(%rax), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movq	16(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rcx
	call	fseek
	movq	16(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %r9
	movl	$1, %r8d
	movl	$41, %edx
	movq	%rax, %rcx
	call	fread
	movl	-80(%rbp), %eax
	testl	%eax, %eax
	jne	.L21
	movl	-12(%rbp), %eax
	leaq	.LC17(%rip), %rcx
	movl	%eax, %edx
	call	printf
	jmp	.L18
.L25:
	leaq	.LC18(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	call	fflush
	leaq	-28(%rbp), %rax
	leaq	.LC19(%rip), %rcx
	movq	%rax, %rdx
	call	scanf
	movl	-43(%rbp), %edx
	movl	-28(%rbp), %eax
	cmpl	%eax, %edx
	jne	.L22
	movl	$1, -8(%rbp)
	leaq	.LC20(%rip), %rax
	movq	%rax, %rcx
	call	puts
	leaq	-80(%rbp), %rax
	leaq	4(%rax), %rcx
	leaq	-80(%rbp), %rax
	leaq	19(%rax), %rdx
	leaq	.LC21(%rip), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	printf
	jmp	.L23
.L22:
	addl	$1, -4(%rbp)
	cmpl	$2, -4(%rbp)
	jg	.L24
	movl	$3, %eax
	subl	-4(%rbp), %eax
	leaq	.LC22(%rip), %rcx
	movl	%eax, %edx
	call	printf
	jmp	.L21
.L24:
	leaq	.LC23(%rip), %rax
	movq	%rax, %rcx
	call	puts
.L21:
	cmpl	$2, -4(%rbp)
	jle	.L25
.L23:
	cmpl	$0, -8(%rbp)
	je	.L43
	movsd	-51(%rbp), %xmm0
	movl	-80(%rbp), %eax
	movapd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movq	%xmm1, %rdx
	leaq	.LC24(%rip), %rcx
	movapd	%xmm0, %xmm2
	movq	%rdx, %r8
	movl	%eax, %edx
	call	printf
	leaq	.LC25(%rip), %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC26(%rip), %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC27(%rip), %rax
	movq	%rax, %rcx
	call	puts
	leaq	.LC28(%rip), %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-16(%rbp), %rax
	leaq	.LC19(%rip), %rcx
	movq	%rax, %rdx
	call	scanf
	movl	-16(%rbp), %eax
	cmpl	$3, %eax
	je	.L27
	cmpl	$3, %eax
	ja	.L28
	cmpl	$1, %eax
	je	.L29
	cmpl	$2, %eax
	je	.L30
	jmp	.L28
.L29:
	leaq	.LC29(%rip), %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-24(%rbp), %rax
	leaq	.LC30(%rip), %rcx
	movq	%rax, %rdx
	call	scanf
	movsd	-24(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	comisd	%xmm1, %xmm0
	jb	.L41
	leaq	.LC32(%rip), %rax
	movq	%rax, %rcx
	call	puts
	jmp	.L18
.L41:
	movsd	-51(%rbp), %xmm1
	movsd	-24(%rbp), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -51(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %r8d
	movl	$-41, %edx
	movq	%rax, %rcx
	call	fseek
	movq	16(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %r9
	movl	$1, %r8d
	movl	$41, %edx
	movq	%rax, %rcx
	call	fwrite
	leaq	.LC33(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movsd	-51(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movq	%xmm1, %rdx
	leaq	.LC34(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %rcx
	call	printf
	jmp	.L18
.L30:
	leaq	.LC35(%rip), %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-24(%rbp), %rax
	leaq	.LC30(%rip), %rcx
	movq	%rax, %rdx
	call	scanf
	movsd	-51(%rbp), %xmm1
	movsd	-24(%rbp), %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L42
	movsd	-51(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movq	%xmm1, %rdx
	leaq	.LC36(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %rcx
	call	printf
	jmp	.L18
.L42:
	movsd	-51(%rbp), %xmm0
	movsd	-24(%rbp), %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -51(%rbp)
	movq	16(%rbp), %rax
	movl	$1, %r8d
	movl	$-41, %edx
	movq	%rax, %rcx
	call	fseek
	movq	16(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %r9
	movl	$1, %r8d
	movl	$41, %edx
	movq	%rax, %rcx
	call	fwrite
	leaq	.LC37(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movsd	-51(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movq	%xmm1, %rdx
	leaq	.LC34(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %rcx
	call	printf
	jmp	.L18
.L27:
	leaq	.LC38(%rip), %rax
	movq	%rax, %rcx
	call	puts
	movl	-80(%rbp), %eax
	leaq	.LC39(%rip), %rcx
	movl	%eax, %edx
	call	printf
	leaq	-80(%rbp), %rax
	leaq	4(%rax), %rcx
	leaq	-80(%rbp), %rax
	leaq	19(%rax), %rdx
	leaq	.LC40(%rip), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	printf
	movsd	-51(%rbp), %xmm0
	movapd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movq	%xmm1, %rdx
	leaq	.LC41(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %rcx
	call	printf
	leaq	.LC42(%rip), %rax
	movq	%rax, %rcx
	call	puts
	jmp	.L18
.L28:
	leaq	.LC43(%rip), %rax
	movq	%rax, %rcx
	call	puts
	jmp	.L18
.L43:
	nop
.L18:
	addq	$112, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC44:
	.ascii "Enter account number to delete ( 1 - 100 ): \0"
.LC45:
	.ascii "Account %d does not exist.\12\0"
	.text
	.globl	deleteRecord
	.def	deleteRecord;	.scl	2;	.type	32;	.endef
	.seh_proc	deleteRecord
deleteRecord:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$144, %rsp
	.seh_stackalloc	144
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	$0, -96(%rbp)
	movq	$0, -92(%rbp)
	movq	$0, -85(%rbp)
	movq	$0, -77(%rbp)
	movw	$0, -69(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -67(%rbp)
	movl	$0, -59(%rbp)
	leaq	.LC44(%rip), %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-100(%rbp), %rax
	leaq	.LC19(%rip), %rcx
	movq	%rax, %rdx
	call	scanf
	movl	-100(%rbp), %eax
	leal	-1(%rax), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movq	16(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rcx
	call	fseek
	movq	16(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %r9
	movl	$1, %r8d
	movl	$41, %edx
	movq	%rax, %rcx
	call	fread
	movl	-48(%rbp), %eax
	testl	%eax, %eax
	jne	.L45
	movl	-100(%rbp), %eax
	leaq	.LC45(%rip), %rcx
	movl	%eax, %edx
	call	printf
	jmp	.L47
.L45:
	movl	-100(%rbp), %eax
	leal	-1(%rax), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movq	16(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rcx
	call	fseek
	movq	16(%rbp), %rdx
	leaq	-96(%rbp), %rax
	movq	%rdx, %r9
	movl	$1, %r8d
	movl	$41, %edx
	movq	%rax, %rcx
	call	fwrite
.L47:
	nop
	addq	$144, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC46:
	.ascii "Enter new account number ( 1 - 100 ):\12 \0"
	.align 8
.LC47:
	.ascii "Account #%d already contains information.\12\0"
.LC48:
	.ascii "Enter firstname :\0"
.LC49:
	.ascii "%9s\0"
.LC50:
	.ascii "Enter lastname :\0"
.LC51:
	.ascii "%14s\0"
.LC52:
	.ascii "Enter balance :\0"
.LC53:
	.ascii "Enter pin :\0"
	.text
	.globl	newRecord
	.def	newRecord;	.scl	2;	.type	32;	.endef
	.seh_proc	newRecord
newRecord:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	leaq	-48(%rbp), %rax
	movl	$41, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	memset
	leaq	.LC46(%rip), %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-52(%rbp), %rax
	leaq	.LC19(%rip), %rcx
	movq	%rax, %rdx
	call	scanf
	movl	-52(%rbp), %eax
	leal	-1(%rax), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movq	16(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rcx
	call	fseek
	movq	16(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %r9
	movl	$1, %r8d
	movl	$41, %edx
	movq	%rax, %rcx
	call	fread
	movl	-48(%rbp), %eax
	testl	%eax, %eax
	je	.L49
	movl	-48(%rbp), %eax
	leaq	.LC47(%rip), %rcx
	movl	%eax, %edx
	call	printf
	jmp	.L51
.L49:
	leaq	-48(%rbp), %rax
	movl	$41, %r8d
	movl	$0, %edx
	movq	%rax, %rcx
	call	memset
	leaq	.LC48(%rip), %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-48(%rbp), %rax
	leaq	19(%rax), %rdx
	leaq	.LC49(%rip), %rax
	movq	%rax, %rcx
	call	scanf
	leaq	.LC50(%rip), %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-48(%rbp), %rax
	leaq	4(%rax), %rdx
	leaq	.LC51(%rip), %rax
	movq	%rax, %rcx
	call	scanf
	leaq	.LC52(%rip), %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-48(%rbp), %rax
	leaq	29(%rax), %rdx
	leaq	.LC30(%rip), %rax
	movq	%rax, %rcx
	call	scanf
	leaq	.LC53(%rip), %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-48(%rbp), %rax
	leaq	37(%rax), %rdx
	leaq	.LC19(%rip), %rax
	movq	%rax, %rcx
	call	scanf
	movl	-52(%rbp), %eax
	movl	%eax, -48(%rbp)
	movl	-48(%rbp), %eax
	leal	-1(%rax), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movq	16(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rcx
	call	fseek
	movq	16(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %r9
	movl	$1, %r8d
	movl	$41, %edx
	movq	%rax, %rcx
	call	fwrite
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	fflush
.L51:
	nop
	addq	$96, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC54:
	.ascii "\12Enter your choice\12"
	.ascii "1 - update an account\12"
	.ascii "2 - add a new account\12"
	.ascii "3 - delete an account\12"
	.ascii "4 - display all account\12"
	.ascii "5 - end program \12:\0"
	.text
	.globl	enterChoice
	.def	enterChoice;	.scl	2;	.type	32;	.endef
	.seh_proc	enterChoice
enterChoice:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	leaq	.LC54(%rip), %rdx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-4(%rbp), %rax
	leaq	.LC16(%rip), %rcx
	movq	%rax, %rdx
	call	scanf
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC55:
	.ascii "r\0"
.LC56:
	.ascii "\12%-6s%-16s%-11s%10s\12\0"
	.align 8
.LC57:
	.ascii "----------------------------------------------\0"
	.text
	.globl	displayTextFile
	.def	displayTextFile;	.scl	2;	.type	32;	.endef
	.seh_proc	displayTextFile
displayTextFile:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$160, %rsp
	.seh_stackalloc	160
	.seh_endprologue
	leaq	.LC55(%rip), %rdx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L55
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	puts
	jmp	.L59
.L55:
	leaq	.LC12(%rip), %r9
	leaq	.LC8(%rip), %r8
	leaq	.LC9(%rip), %rdx
	leaq	.LC56(%rip), %rax
	leaq	.LC11(%rip), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	printf
	leaq	.LC57(%rip), %rax
	movq	%rax, %rcx
	call	puts
	jmp	.L57
.L58:
	leaq	-112(%rbp), %rax
	leaq	.LC15(%rip), %rcx
	movq	%rax, %rdx
	call	printf
.L57:
	movq	-8(%rbp), %rdx
	leaq	-112(%rbp), %rax
	movq	%rdx, %r8
	movl	$100, %edx
	movq	%rax, %rcx
	call	fgets
	testq	%rax, %rax
	jne	.L58
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
.L59:
	nop
	addq	$160, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (GNU) 15.2.0"
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	rewind;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fread;	.scl	2;	.type	32;	.endef
	.def	feof;	.scl	2;	.type	32;	.endef
	.def	fflush;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	memset;	.scl	2;	.type	32;	.endef
	.def	fgets;	.scl	2;	.type	32;	.endef
