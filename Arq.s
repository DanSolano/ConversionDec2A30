	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"Arq.c"
	.global	__aeabi_idivmod
	.global	__aeabi_idiv
	.section	.rodata
	.align	2
.LC0:
	.byte	48
	.byte	49
	.byte	50
	.byte	51
	.byte	52
	.byte	53
	.byte	54
	.byte	55
	.byte	56
	.byte	57
	.byte	65
	.byte	66
	.byte	67
	.byte	68
	.byte	69
	.byte	70
	.byte	71
	.byte	72
	.byte	73
	.byte	74
	.byte	75
	.byte	76
	.byte	77
	.byte	78
	.byte	79
	.byte	80
	.byte	81
	.byte	82
	.byte	83
	.byte	84
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 304
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #304
	ldr	r3, .L4
	sub	ip, fp, #48
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2}
	strh	r3, [ip]	@ movhi
	mov	r3, #0
	str	r3, [fp, #-12]
	bl	solicitaNumero
	str	r0, [fp, #-8]
	bl	solicitaBase
	str	r0, [fp, #-16]
	b	.L2
.L3:
	ldr	r3, [fp, #-8]
	ldr	r1, [fp, #-16]
	mov	r0, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	mov	r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-300]
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-8]
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L3
	sub	r2, fp, #48
	sub	r3, fp, #304
	mov	r1, r3
	ldr	r0, [fp, #-12]
	bl	imprime
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L4:
	.word	.LC0
	.size	main, .-main
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Ingrese la base a la que desea convertir el numer a"
	.ascii	"nterior(entre 2 y 30): \000"
	.align	2
.LC2:
	.ascii	"%i\000"
	.align	2
.LC3:
	.ascii	"La base NO debe ser MAYOR a 30 y ni MENOR a 2 \012 "
	.ascii	"\000"
	.text
	.align	2
	.global	solicitaBase
	.arm
	.fpu vfp
	.type	solicitaBase, %function
solicitaBase:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r0, .L10
	bl	printf
	sub	r3, fp, #8
	mov	r1, r3
	ldr	r0, .L10+4
	bl	__isoc99_scanf
	b	.L7
.L8:
	ldr	r0, .L10+8
	bl	printf
	ldr	r0, .L10
	bl	printf
	sub	r3, fp, #8
	mov	r1, r3
	ldr	r0, .L10+4
	bl	__isoc99_scanf
.L7:
	ldr	r3, [fp, #-8]
	cmp	r3, #30
	bgt	.L8
	ldr	r3, [fp, #-8]
	cmp	r3, #1
	ble	.L8
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L10:
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.size	solicitaBase, .-solicitaBase
	.section	.rodata
	.align	2
.LC4:
	.ascii	"Ingrese el numero decimal: \000"
	.text
	.align	2
	.global	solicitaNumero
	.syntax unified
	.arm
	.fpu vfp
	.type	solicitaNumero, %function
solicitaNumero:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r0, .L14
	bl	printf
	sub	r3, fp, #8
	mov	r1, r3
	ldr	r0, .L14+4
	bl	__isoc99_scanf
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L14:
	.word	.LC4
	.word	.LC2
	.size	solicitaNumero, .-solicitaNumero
	.section	.rodata
	.align	2
.LC5:
	.ascii	"\012\012Conversion = \000"
	.text
	.align	2
	.global	imprime
	.syntax unified
	.arm
	.fpu vfp
	.type	imprime, %function
imprime:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r0, .L19
	bl	printf
	b	.L17
.L18:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldrb	r3, [r3]	
	mov	r0, r3
	bl	putchar
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L17:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L18
	mov	r0, #10
	bl	putchar
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L19:
	.word	.LC5
	.size	imprime, .-imprime
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
