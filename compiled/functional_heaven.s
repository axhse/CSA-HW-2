	.file	"functional_heaven.c"
	.intel_syntax noprefix
	.text
	.globl	is_generated
	.bss
	.align 4
	.type	is_generated, @object
	.size	is_generated, 4
is_generated:
	.zero	4
	.globl	string_size
	.align 4
	.type	string_size, @object
	.size	string_size, 4
string_size:
	.zero	4
	.globl	input_string
	.align 8
	.type	input_string, @object
	.size	input_string, 8
input_string:
	.zero	8
	.globl	result_string
	.align 8
	.type	result_string, @object
	.size	result_string, 8
result_string:
	.zero	8
	.globl	input_file
	.align 8
	.type	input_file, @object
	.size	input_file, 8
input_file:
	.zero	8
	.globl	output_file
	.align 8
	.type	output_file, @object
	.size	output_file, 8
output_file:
	.zero	8
	.text
	.globl	build_result_string
	.type	build_result_string, @function
build_result_string:
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -4[rbp], 0
	jmp	.L2
.L5:
	mov	rdx, QWORD PTR input_string[rip]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	add	rax, rdx
	mov	rcx, QWORD PTR result_string[rip]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	add	rdx, rcx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR [rdx], al
	mov	rdx, QWORD PTR input_string[rip]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 96
	jle	.L3
	mov	rdx, QWORD PTR input_string[rip]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 122
	jg	.L3
	mov	rdx, QWORD PTR result_string[rip]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	lea	ecx, -32[rax]
	mov	rdx, QWORD PTR result_string[rip]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
	jmp	.L4
.L3:
	mov	rdx, QWORD PTR input_string[rip]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 64
	jle	.L4
	mov	rdx, QWORD PTR input_string[rip]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 90
	jg	.L4
	mov	rdx, QWORD PTR result_string[rip]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	lea	ecx, 32[rax]
	mov	rdx, QWORD PTR result_string[rip]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
.L4:
	add	DWORD PTR -4[rbp], 1
.L2:
	mov	eax, DWORD PTR string_size[rip]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L5
	nop
	nop
	pop	rbp
	ret
	.size	build_result_string, .-build_result_string
	.section	.rodata
.LC1:
	.string	"Elapsed time:  %.3f seconds\n"
	.text
	.globl	test
	.type	test, @function
test:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -28[rbp], 0
	jmp	.L7
.L8:
	mov	eax, 0
	call	build_result_string
	add	DWORD PTR -28[rbp], 1
.L7:
	mov	eax, DWORD PTR -28[rbp]
	cmp	eax, DWORD PTR -36[rbp]
	jl	.L8
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	sub	rax, QWORD PTR -24[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	mov	rax, QWORD PTR -8[rbp]
	movq	xmm0, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	nop
	leave
	ret
	.size	test, .-test
	.globl	generate_random
	.type	generate_random, @function
generate_random:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	eax, DWORD PTR -20[rbp]
	mov	DWORD PTR string_size[rip], eax
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L10
.L11:
	call	rand@PLT
	cdq
	shr	edx, 25
	add	eax, edx
	and	eax, 127
	sub	eax, edx
	mov	ecx, eax
	mov	rdx, QWORD PTR input_string[rip]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
	add	DWORD PTR -4[rbp], 1
.L10:
	mov	eax, DWORD PTR string_size[rip]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L11
	nop
	nop
	leave
	ret
	.size	generate_random, .-generate_random
	.section	.rodata
.LC2:
	.string	"  -- Input string:"
	.text
	.globl	read_input
	.type	read_input, @function
read_input:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	rdx, QWORD PTR input_file[rip]
	mov	rax, QWORD PTR stdin[rip]
	cmp	rdx, rax
	jne	.L17
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT
.L17:
	mov	eax, DWORD PTR string_size[rip]
	cmp	eax, 1000000
	je	.L19
	mov	rax, QWORD PTR input_file[rip]
	mov	rdi, rax
	call	fgetc@PLT
	mov	BYTE PTR -1[rbp], al
	cmp	BYTE PTR -1[rbp], -1
	je	.L20
	mov	rcx, QWORD PTR input_string[rip]
	mov	eax, DWORD PTR string_size[rip]
	lea	edx, 1[rax]
	mov	DWORD PTR string_size[rip], edx
	cdqe
	lea	rdx, [rcx+rax]
	movzx	eax, BYTE PTR -1[rbp]
	mov	BYTE PTR [rdx], al
	jmp	.L17
.L19:
	nop
	jmp	.L15
.L20:
	nop
.L15:
	mov	rdx, QWORD PTR input_file[rip]
	mov	rax, QWORD PTR stdin[rip]
	cmp	rdx, rax
	jne	.L21
	mov	edi, 10
	call	putchar@PLT
.L21:
	nop
	leave
	ret
	.size	read_input, .-read_input
	.section	.rodata
.LC3:
	.string	"  -- Random string:\n"
.LC4:
	.string	"\n\n"
.LC5:
	.string	"  -- Result string:\n"
.LC6:
	.string	"\n"
	.text
	.globl	write_output
	.type	write_output, @function
write_output:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	eax, DWORD PTR is_generated[rip]
	test	eax, eax
	je	.L23
	mov	rax, QWORD PTR output_file[rip]
	mov	rcx, rax
	mov	edx, 20
	mov	esi, 1
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	fwrite@PLT
	mov	DWORD PTR -8[rbp], 0
	jmp	.L24
.L25:
	mov	rdx, QWORD PTR output_file[rip]
	mov	rcx, QWORD PTR input_string[rip]
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	add	rax, rcx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	rsi, rdx
	mov	edi, eax
	call	fputc@PLT
	add	DWORD PTR -8[rbp], 1
.L24:
	mov	eax, DWORD PTR string_size[rip]
	cmp	DWORD PTR -8[rbp], eax
	jl	.L25
	mov	rax, QWORD PTR output_file[rip]
	mov	rcx, rax
	mov	edx, 2
	mov	esi, 1
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	fwrite@PLT
.L23:
	mov	rax, QWORD PTR output_file[rip]
	mov	rcx, rax
	mov	edx, 20
	mov	esi, 1
	lea	rax, .LC5[rip]
	mov	rdi, rax
	call	fwrite@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L26
.L27:
	mov	rdx, QWORD PTR output_file[rip]
	mov	rcx, QWORD PTR result_string[rip]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	add	rax, rcx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	rsi, rdx
	mov	edi, eax
	call	fputc@PLT
	add	DWORD PTR -4[rbp], 1
.L26:
	mov	eax, DWORD PTR string_size[rip]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L27
	mov	rax, QWORD PTR output_file[rip]
	mov	rcx, rax
	mov	edx, 1
	mov	esi, 1
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	fwrite@PLT
	nop
	leave
	ret
	.size	write_output, .-write_output
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
