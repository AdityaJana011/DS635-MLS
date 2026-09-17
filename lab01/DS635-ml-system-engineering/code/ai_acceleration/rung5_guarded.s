	.file	"rung5_c_tiled.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s/%s.bin"
.LC1:
	.string	"rb"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"cannot open %s \342\200\224 run common/gen_inputs.py first\n"
	.section	.rodata.str1.1
.LC3:
	.string	"short read on %s\n"
	.text
	.p2align 4
	.type	load_matrix, @function
load_matrix:
.LFB54:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rdi, %r9
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	.LC0(%rip), %r8
	movl	$512, %ecx
	subq	$528, %rsp
	.cfi_def_cfa_offset 576
	movslq	%edx, %rbx
	movl	$2, %edx
	movq	%fs:40, %rax
	movq	%rax, 520(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %r13
	subq	$8, %rsp
	.cfi_def_cfa_offset 584
	pushq	%rsi
	.cfi_def_cfa_offset 592
	movq	%r13, %rdi
	movl	$512, %esi
	call	__snprintf_chk@PLT
	leaq	.LC1(%rip), %rsi
	movq	%r13, %rdi
	call	fopen@PLT
	movq	%r13, %rsp
	.cfi_def_cfa_offset 576
	testq	%rax, %rax
	je	.L8
	imulq	%rbx, %rbx
	movq	%rax, %rbp
	leaq	0(,%rbx,4), %r14
	movq	%r14, %rdi
	call	malloc@PLT
	movq	%rbp, %r8
	movq	%rbx, %rcx
	movl	$4, %edx
	movq	%r14, %rsi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	__fread_chk@PLT
	cmpq	%rax, %rbx
	jne	.L9
	movq	%rbp, %rdi
	call	fclose@PLT
	movq	520(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L10
	addq	$528, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L8:
	.cfi_restore_state
	movq	%r13, %rcx
	leaq	.LC2(%rip), %rdx
.L6:
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
.L10:
	call	__stack_chk_fail@PLT
.L9:
	movq	%r13, %rcx
	leaq	.LC3(%rip), %rdx
	jmp	.L6
	.cfi_endproc
.LFE54:
	.size	load_matrix, .-load_matrix
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"rung5 requires N %% T == 0 (N=%d, T=%d)\n"
	.text
	.p2align 4
	.type	matmul_wrap, @function
matmul_wrap:
.LFB58:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%ecx, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	andl	$127, %eax
	jne	.L12
	testl	%ecx, %ecx
	jle	.L30
	movl	%ecx, %r12d
	movq	%rdx, %rbx
	movslq	%ecx, %rdx
	movq	%rsi, %rbp
	sall	$7, %r12d
	movslq	%r12d, %r12
	leaq	512(%rdi), %r11
	leaq	0(,%rdx,4), %r13
	xorl	%esi, %esi
	leaq	0(,%r12,4), %r14
	movq	%r12, %r8
.L14:
	leaq	(%rbx,%rsi,4), %rdi
	movq	%rbp, %r12
	movq	%r11, %r10
	xorl	%edx, %edx
	movq	%rdi, 8(%rsp)
	movq	%rsi, %rdi
	movl	%eax, 28(%rsp)
	movq	%rbp, 32(%rsp)
.L23:
	movq	%rdx, %r15
	xorl	%esi, %esi
	movq	%rdi, %rdx
	movl	%ecx, %edi
.L22:
	movq	8(%rsp), %rbp
	leaq	1(%rsi), %rax
	movq	%r10, %r9
	movq	%rdx, %rcx
	movq	%rax, 16(%rsp)
	leal	127(%rsi), %eax
	movl	$128, 24(%rsp)
	movq	%rsi, 40(%rsp)
	vmovd	%eax, %xmm0
	movq	%rbx, 48(%rsp)
.L20:
	leaq	-512(%r9), %rdx
	movq	%r12, %rsi
	movq	%rcx, %rbx
	.p2align 4
	.p2align 3
.L17:
	vmovss	(%rdx), %xmm1
	movq	16(%rsp), %rax
	movq	%rdx, 56(%rsp)
	jmp	.L15
	.p2align 4
	.p2align 3
.L32:
	cmpl	%edx, %edi
	jle	.L24
.L15:
	movl	%eax, %edx
	vmovd	%xmm0, %ecx
	vmovss	-4(%rsi,%rax,4), %xmm2
	vfmadd213ss	-4(%rbp,%rax,4), %xmm1, %xmm2
	vmovss	%xmm2, -4(%rbp,%rax,4)
	incq	%rax
	cmpl	%ecx, %edx
	jle	.L32
.L24:
	movq	56(%rsp), %rdx
	addq	%r13, %rsi
	addq	$4, %rdx
	cmpq	%rdx, %r9
	jne	.L17
	addq	%r13, %r9
	addq	%r13, %rbp
	movq	%rbx, %rcx
	decl	24(%rsp)
	jne	.L20
	movq	40(%rsp), %rsi
	movq	%rbx, %rdx
	movq	48(%rsp), %rbx
	subq	$-128, %rsi
	cmpl	%esi, %edi
	jg	.L22
	movl	%edi, %ecx
	movq	%rdx, %rdi
	movq	%r15, %rdx
	addq	%r14, %r12
	subq	$-128, %rdx
	addq	$512, %r10
	cmpl	%edx, %ecx
	jg	.L23
	movl	28(%rsp), %eax
	movq	%rdi, %rsi
	movq	32(%rsp), %rbp
	addq	%r14, %r11
	addq	%r8, %rsi
	subl	$-128, %eax
	cmpl	%eax, %ecx
	jg	.L14
.L30:
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L12:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	movl	$128, %r8d
	leaq	.LC4(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE58:
	.size	matmul_wrap, .-matmul_wrap
	.section	.rodata.str1.1
.LC7:
	.string	"PASS"
.LC8:
	.string	"FAIL"
.LC9:
	.string	"data/N%d"
.LC10:
	.string	"A"
.LC11:
	.string	"B"
.LC12:
	.string	"C_ref"
.LC20:
	.string	"name,N,seconds,gflops,check"
.LC21:
	.string	"rung5_c_tiled"
.LC22:
	.string	"%s,%d,%.4f,%.2f,%s\n"
	.text
	.p2align 4
	.type	harness_main.constprop.0, @function
harness_main.constprop.0:
.LFB61:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-64, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	movl	$1024, %r14d
	subq	$384, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jg	.L63
.L34:
	leaq	-320(%rbp), %rbx
	movl	%r14d, %r9d
	leaq	.LC9(%rip), %r8
	movl	$256, %ecx
	movq	%rbx, %rdi
	movl	$2, %edx
	movl	$256, %esi
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	movq	%rbx, %rdi
	movl	%r14d, %edx
	leaq	.LC10(%rip), %rsi
	call	load_matrix
	movq	%rbx, %rdi
	movl	%r14d, %edx
	leaq	.LC11(%rip), %rsi
	movslq	%r14d, %r12
	movq	%rax, -368(%rbp)
	call	load_matrix
	movq	%rbx, %rdi
	movl	%r14d, %edx
	leaq	.LC12(%rip), %rsi
	movq	%rax, -376(%rbp)
	call	load_matrix
	movq	%r12, -400(%rbp)
	imulq	%r12, %r12
	movq	%rax, -392(%rbp)
	salq	$2, %r12
	movq	%r12, %rdi
	call	malloc@PLT
	movl	$3, -380(%rbp)
	movq	%rax, %rbx
.L45:
	xorl	%r15d, %r15d
	leaq	-336(%rbp), %r13
	vmovsd	.LC5(%rip), %xmm4
	vmovsd	%xmm4, -344(%rbp)
	.p2align 4
	.p2align 3
.L36:
	movq	%r12, %rcx
	movq	%r12, %rdx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	call	__memset_chk@PLT
	movq	%r13, %rsi
	movl	$1, %edi
	incl	%r15d
	call	clock_gettime@PLT
	movq	-376(%rbp), %rsi
	movq	-368(%rbp), %rdi
	movl	%r14d, %ecx
	movq	%rbx, %rdx
	vxorps	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	-336(%rbp), %xmm2, %xmm0
	vmovsd	%xmm0, -352(%rbp)
	vcvtsi2sdq	-328(%rbp), %xmm2, %xmm0
	vmovsd	%xmm0, -360(%rbp)
	call	matmul_wrap
	movq	%r13, %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movl	-380(%rbp), %eax
	vmovsd	.LC13(%rip), %xmm5
	vxorps	%xmm2, %xmm2, %xmm2
	vcvtsi2sdq	-336(%rbp), %xmm2, %xmm0
	vcvtsi2sdq	-328(%rbp), %xmm2, %xmm1
	vfnmadd231sd	-360(%rbp), %xmm5, %xmm0
	vfmsub213sd	-352(%rbp), %xmm5, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vminsd	-344(%rbp), %xmm0, %xmm5
	vmovsd	%xmm5, -344(%rbp)
	cmpl	%eax, %r15d
	jne	.L36
.L35:
	movq	-400(%rbp), %rcx
	vcvtsi2sdl	%r14d, %xmm2, %xmm2
	leaq	.LC7(%rip), %r12
	vmulsd	%xmm2, %xmm2, %xmm1
	vmulsd	.LC14(%rip), %xmm2, %xmm2
	vmulsd	%xmm2, %xmm1, %xmm1
	vdivsd	-344(%rbp), %xmm1, %xmm1
	imulq	%rcx, %rcx
	testq	%rcx, %rcx
	jle	.L37
	leaq	-1(%rcx), %rax
	cmpq	$14, %rax
	jbe	.L50
	vbroadcastss	.LC16(%rip), %zmm3
	movq	%rcx, %rdx
	xorl	%eax, %eax
	vxorps	%xmm2, %xmm2, %xmm2
	shrq	$4, %rdx
	salq	$6, %rdx
	.p2align 4
	.p2align 3
.L39:
	movq	-392(%rbp), %rdi
	vmovups	(%rbx,%rax), %zmm7
	vsubps	(%rdi,%rax), %zmm7, %zmm0
	addq	$64, %rax
	vandps	%zmm3, %zmm0, %zmm0
	vmaxps	%zmm0, %zmm2, %zmm2
	cmpq	%rax, %rdx
	jne	.L39
	vextractf32x8	$0x1, %zmm2, %ymm4
	movq	%rcx, %rax
	vmaxps	%ymm2, %ymm4, %ymm3
	andq	$-16, %rax
	vmaxps	%ymm4, %ymm2, %ymm2
	movq	%rax, %rdx
	vextractf128	$0x1, %ymm3, %xmm0
	vmaxps	%xmm3, %xmm0, %xmm0
	vmovhlps	%xmm0, %xmm0, %xmm3
	vmaxps	%xmm0, %xmm3, %xmm3
	vshufps	$85, %xmm3, %xmm3, %xmm0
	vmaxps	%xmm3, %xmm0, %xmm0
	cmpq	%rcx, %rax
	je	.L40
.L38:
	movq	%rcx, %rsi
	subq	%rdx, %rsi
	leaq	-1(%rsi), %rdi
	cmpq	$6, %rdi
	jbe	.L41
	movq	-392(%rbp), %rdi
	vmovups	(%rbx,%rdx,4), %ymm4
	vbroadcastss	.LC16(%rip), %ymm3
	vsubps	(%rdi,%rdx,4), %ymm4, %ymm0
	movq	%rsi, %rdx
	andq	$-8, %rdx
	addq	%rdx, %rax
	andl	$7, %esi
	vandps	%ymm3, %ymm0, %ymm0
	vmaxps	%ymm2, %ymm0, %ymm0
	vextractf128	$0x1, %ymm0, %xmm2
	vmaxps	%xmm0, %xmm2, %xmm0
	vmovhlps	%xmm0, %xmm0, %xmm2
	vmaxps	%xmm0, %xmm2, %xmm2
	vshufps	$85, %xmm2, %xmm2, %xmm0
	vmaxps	%xmm2, %xmm0, %xmm0
	je	.L40
.L41:
	movq	-392(%rbp), %rdi
	leaq	0(,%rax,4), %rdx
	vmovss	.LC18(%rip), %xmm2
	leaq	1(%rax), %rsi
	vmovss	(%rbx,%rdx), %xmm3
	vsubss	(%rdi,%rdx), %xmm3, %xmm3
	vandps	%xmm2, %xmm3, %xmm3
	vmaxss	%xmm3, %xmm0, %xmm0
	cmpq	%rcx, %rsi
	jge	.L40
	vmovss	4(%rbx,%rdx), %xmm3
	vsubss	4(%rdi,%rdx), %xmm3, %xmm3
	leaq	2(%rax), %rsi
	vandps	%xmm2, %xmm3, %xmm3
	vmaxss	%xmm3, %xmm0, %xmm0
	cmpq	%rsi, %rcx
	jle	.L40
	vmovss	8(%rbx,%rdx), %xmm3
	vsubss	8(%rdi,%rdx), %xmm3, %xmm3
	leaq	3(%rax), %rsi
	vandps	%xmm2, %xmm3, %xmm3
	vmaxss	%xmm3, %xmm0, %xmm0
	cmpq	%rsi, %rcx
	jle	.L40
	vmovss	12(%rbx,%rdx), %xmm3
	vsubss	12(%rdi,%rdx), %xmm3, %xmm3
	leaq	4(%rax), %rsi
	vandps	%xmm2, %xmm3, %xmm3
	vmaxss	%xmm3, %xmm0, %xmm0
	cmpq	%rsi, %rcx
	jle	.L40
	vmovss	16(%rbx,%rdx), %xmm3
	vsubss	16(%rdi,%rdx), %xmm3, %xmm3
	leaq	5(%rax), %rsi
	vandps	%xmm2, %xmm3, %xmm3
	vmaxss	%xmm3, %xmm0, %xmm0
	cmpq	%rsi, %rcx
	jle	.L40
	vmovss	20(%rbx,%rdx), %xmm3
	vsubss	20(%rdi,%rdx), %xmm3, %xmm3
	addq	$6, %rax
	vandps	%xmm2, %xmm3, %xmm3
	vmaxss	%xmm3, %xmm0, %xmm0
	cmpq	%rax, %rcx
	jle	.L40
	vmovss	24(%rbx,%rdx), %xmm3
	vsubss	24(%rdi,%rdx), %xmm3, %xmm3
	vandps	%xmm2, %xmm3, %xmm2
	vmaxss	%xmm2, %xmm0, %xmm0
.L40:
	vmovss	.LC19(%rip), %xmm2
	leaq	.LC7(%rip), %r12
	leaq	.LC8(%rip), %rax
	vcomiss	%xmm0, %xmm2
	cmovbe	%rax, %r12
	vzeroupper
.L37:
	leaq	.LC20(%rip), %rdi
	vmovsd	%xmm1, -352(%rbp)
	call	puts@PLT
	movq	%r12, %r8
	movl	%r14d, %ecx
	leaq	.LC21(%rip), %rdx
	leaq	.LC22(%rip), %rsi
	movl	$2, %edi
	movl	$2, %eax
	vmovsd	-352(%rbp), %xmm1
	vmovsd	-344(%rbp), %xmm0
	call	__printf_chk@PLT
	movq	-368(%rbp), %rdi
	call	free@PLT
	movq	-376(%rbp), %rdi
	call	free@PLT
	movq	-392(%rbp), %rdi
	call	free@PLT
	movq	%rbx, %rdi
	call	free@PLT
	cmpl	$1397965136, (%r12)
	je	.L64
.L43:
	movl	$1, %eax
.L44:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L65
	addq	$384, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L63:
	.cfi_restore_state
	movl	%edi, %ebx
	movq	8(%rsi), %rdi
	movq	%rsi, %r13
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, %r12
	movl	%eax, %r14d
	cmpl	$2, %ebx
	je	.L34
	movq	16(%r13), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	leaq	-320(%rbp), %rbx
	call	strtol@PLT
	movl	%r12d, %r9d
	leaq	.LC9(%rip), %r8
	movl	$256, %ecx
	movq	%rbx, %rdi
	movq	%rax, %r13
	movl	$2, %edx
	movl	$256, %esi
	movl	%eax, -380(%rbp)
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	movl	%r12d, %edx
	movq	%rbx, %rdi
	leaq	.LC10(%rip), %rsi
	call	load_matrix
	movl	%r12d, %edx
	movq	%rbx, %rdi
	leaq	.LC11(%rip), %rsi
	movq	%rax, -368(%rbp)
	call	load_matrix
	movl	%r12d, %edx
	movslq	%r12d, %r12
	imulq	%r12, %r12
	movq	%rbx, %rdi
	leaq	.LC12(%rip), %rsi
	movq	%rax, -376(%rbp)
	call	load_matrix
	movq	%rax, -392(%rbp)
	salq	$2, %r12
	movq	%r12, %rdi
	call	malloc@PLT
	testl	%r13d, %r13d
	vxorps	%xmm2, %xmm2, %xmm2
	movq	%rax, %rbx
	jg	.L66
	movslq	%r14d, %rax
	vmovsd	.LC5(%rip), %xmm4
	vmovsd	%xmm4, -344(%rbp)
	movq	%rax, -400(%rbp)
	jmp	.L35
.L64:
	xorl	%eax, %eax
	cmpb	$0, 4(%r12)
	je	.L44
	jmp	.L43
.L66:
	movslq	%r14d, %rax
	movq	%rax, -400(%rbp)
	jmp	.L45
.L50:
	xorl	%edx, %edx
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	vxorps	%xmm2, %xmm2, %xmm2
	jmp	.L38
.L65:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE61:
	.size	harness_main.constprop.0, .-harness_main.constprop.0
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB59:
	.cfi_startproc
	endbr64
	jmp	harness_main.constprop.0
	.cfi_endproc
.LFE59:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC5:
	.long	966823146
	.long	1177108057
	.align 8
.LC13:
	.long	-400107883
	.long	1041313291
	.align 8
.LC14:
	.long	-400107883
	.long	1042361867
	.set	.LC16,.LC18
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC18:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC19:
	.long	1008981770
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
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
