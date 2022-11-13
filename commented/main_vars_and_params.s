	.intel_syntax noprefix
allocate:
	push	rbp
	mov	rbp, rsp
	mov	edi, 1000000
	call	malloc@PLT
	mov	QWORD PTR input_string[rip], rax
	mov	edi, 1000000
	call	malloc@PLT
	mov	QWORD PTR result_string[rip], rax
	nop
	pop	rbp
	ret
dispose:
	push	rbp
	mov	rbp, rsp
	mov	rax, QWORD PTR input_string[rip]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR result_string[rip]
	mov	rdi, rax
	call	free@PLT
	mov	rdx, QWORD PTR input_file[rip]
	mov	rax, QWORD PTR stdin[rip]
	cmp	rdx, rax
	je	.L3
	mov	rax, QWORD PTR input_file[rip]
	test	rax, rax
	je	.L3
	mov	rax, QWORD PTR input_file[rip]
	mov	rdi, rax
	call	fclose@PLT
.L3:
	mov	rdx, QWORD PTR output_file[rip]
	mov	rax, QWORD PTR stdout[rip]
	cmp	rdx, rax
	je	.L5
	mov	rax, QWORD PTR output_file[rip]
	test	rax, rax
	je	.L5
	mov	rax, QWORD PTR output_file[rip]
	mov	rdi, rax
	call	fclose@PLT
.L5:
	nop
	pop	rbp
	ret
.LC0:
	.string	"Error. Each argument must be presented as <arg tag> <arg value>"
.LC1:
	.string	"-i"
.LC2:
	.string	"-o"
.LC3:
	.string	"-g"
.LC4:
	.string	"Error. Size of random string must be an integer from 1 to %d\n"
.LC5:
	.string	"-t"
.LC6:
	.string	"Error. Testing iteration count must be a positive integer"
.LC7:
	.string	"Unknown arg tag: %s\n"
.LC8:
	.string	"r"
.LC9:
	.string	"w"
.LC10:
	.string	"Error. I/O files can't be opened"
	.text
	.globl	main
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi    # Берем значение argc из регистра edi и записываем на стек
	mov	QWORD PTR -48[rbp], rsi    # Берем ссылочное значение argv из регистра edi и записываем на стек
	mov	QWORD PTR -16[rbp], 0    # Записываем значение 0 на стеке для переменной input_file_path
	mov	QWORD PTR -8[rbp], 0    # Записываем значение 0 на стеке для переменной output_file_path
	mov	DWORD PTR -28[rbp], 0    # Записываем значение 0 на стеке для переменной size_of_random_string
	mov	DWORD PTR -24[rbp], 0    # Записываем значение 0 на стеке для переменной testing_iteration_count
	mov	eax, DWORD PTR -36[rbp]
	cdq
	shr	edx, 31
	add	eax, edx
	and	eax, 1
	sub	eax, edx
	cmp	eax, 1
	je	.L7
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1    # Возвращаем 1 из main с помощью регистра eax (line 28 in main)
	jmp	.L8
.L7:
	mov	DWORD PTR -20[rbp], 1    # Записываем на стек значение 1 для переменной цикла i из main
	jmp	.L9
.L18:
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -48[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC1[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L10
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -48[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	jmp	.L11
.L10:
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -48[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L12
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -48[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	jmp	.L11
.L12:
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -48[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L13
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -48[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -28[rbp], eax
	cmp	DWORD PTR -28[rbp], 0
	jle	.L14
	cmp	DWORD PTR -28[rbp], 1000000
	jle	.L29
.L14:
	mov	esi, 1000000
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1    # Возвращаем 1 из main с помощью регистра eax (line 43 in main)
	jmp	.L8
.L13:
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -48[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC5[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L16
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -48[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -24[rbp], eax
	cmp	DWORD PTR -24[rbp], 0
	jg	.L30
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1    # Возвращаем 1 из main с помощью регистра eax (line 51 in main)
	jmp	.L8
.L16:
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -48[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1    # Возвращаем 1 из main с помощью регистра eax (line 56 in main)
	jmp	.L8
.L29:
	nop
	jmp	.L11
.L30:
	nop
.L11:
	add	DWORD PTR -20[rbp], 2
.L9:
	mov	eax, DWORD PTR -36[rbp]
	sub	eax, 1
	cmp	DWORD PTR -20[rbp], eax
	jl	.L18
	mov	eax, 0
	call	allocate
	cmp	QWORD PTR -16[rbp], 0
	jne	.L19
	mov	rax, QWORD PTR stdin[rip]
	mov	QWORD PTR input_file[rip], rax
	jmp	.L20
.L19:
	mov	rax, QWORD PTR -16[rbp]
	lea	rdx, .LC8[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR input_file[rip], rax
.L20:
	cmp	QWORD PTR -8[rbp], 0
	jne	.L21
	mov	rax, QWORD PTR stdout[rip]
	mov	QWORD PTR output_file[rip], rax
	jmp	.L22
.L21:
	mov	rax, QWORD PTR -8[rbp]
	lea	rdx, .LC9[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR output_file[rip], rax
.L22:
	mov	rax, QWORD PTR input_file[rip]
	test	rax, rax
	je	.L23
	mov	rax, QWORD PTR output_file[rip]
	test	rax, rax
	jne	.L24
.L23:
	lea	rax, .LC10[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	call	dispose
	mov	eax, 1    # Возвращаем 1 из main с помощью регистра eax (line 79 in main)
	jmp	.L8
.L24:
	cmp	DWORD PTR -28[rbp], 0
	jle	.L25
	mov	eax, DWORD PTR -28[rbp]
	mov	edi, eax    # Записываем значение size_of_random_string в регистр edi для передачи в generate_random
	call	generate_random@PLT
	mov	DWORD PTR is_generated[rip], 1
	jmp	.L26
.L25:
	mov	eax, 0
	call	read_input@PLT
.L26:
	cmp	DWORD PTR -24[rbp], 0
	jle	.L27
	mov	eax, DWORD PTR -24[rbp]
	mov	edi, eax    # Записываем значение testing_iteration_count в регистр edi для передачи в test
	call	test@PLT
	jmp	.L28
.L27:
	mov	eax, 0
	call	build_result_string@PLT
	mov	eax, 0
	call	write_output@PLT
.L28:
	mov	eax, 0
	call	dispose
	mov	eax, 0    # Возвращаем 0 из main с помощью регистра eax
.L8:
	leave
	ret