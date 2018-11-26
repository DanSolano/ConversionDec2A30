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
	.section	.rodata
	.align	2
.LC1:
	/*Solicita el numero decimal a conevrtir*/

	.ascii	"Ingrese el numero decimal: \000"
	.align	2
.LC2: 
	/* recibe el numero decimal a convertir */

	.ascii	"%ld\000"
	.align	2
.LC3: 
	/*Solicita la base entre 2 y 30 para conertir el numero decimal */

	.ascii	"Ingrese la base a la que desea convertir el numer a"
	.ascii	"nterior(entre 2 y 30): \000"
	.align	2
.LC4:
	.ascii	"%i\000"
	.align	2
.LC5: 
	/* Si el numero ingresado no se encuentra entre 2 y 30, lo vulve a*/
        /* solicitar */

	.ascii	"El numero NO debe ser mayor a 30\012 \000"
	.word	.LC3
	
.LC6:
	/* Muestra el resultado de la conversion a la base solicitada */

	.ascii	"\012\012Conversion = \000"
	.align	2
.LC0: 
	/*Se definen los valores para tener las representaciones del 0 al 29*/

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
	ldr	r3, .L8
	sub	ip, fp, #40
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}/* Se almacenan valores en array y mueve cont */
	stmia	ip!, {r0, r1, r2, r3}/* mueve contador despues de almacenar*/
	ldm	lr, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2} /* mueve contador despues de almacenar*/
	strh	r3, [ip]	@ movhi
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r0, .L8+4
	bl	printf
	sub	r3, fp, #300
	mov	r1, r3
	ldr	r0, .L8+8
	bl	__isoc99_scanf
	ldr	r0, .L8+12
	bl	printf
	sub	r3, fp, #304
	mov	r1, r3
	ldr	r0, .L8+16
	bl	__isoc99_scanf
	b	.L2
.L3:
	/* hace llamdo a las funciones que solicitan los datos */

	ldr	r0, .L8+20
	bl	printf
	ldr	r0, .L8+12
	bl	printf
	sub	r3, fp, #304
	mov	r1, r3
	ldr	r0, .L8+16
	bl	__isoc99_scanf
.L2:
	ldr	r3, [fp, #-304]
	cmp	r3, #30
	bgt	.L3
	b	.L4
.L5:
	ldr	r3, [fp, #-300]
	ldr	r2, [fp, #-304]
	mov	r1, r2
	mov	r0, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	mov	r2, r3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-292]
	ldr	r3, [fp, #-300]
	ldr	r2, [fp, #-304]
	mov	r1, r2
	mov	r0, r3
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [fp, #-300]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L4:
	ldr	r3, [fp, #-300]
	cmp	r3, #0
	bne	.L5
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r0, .L8+24
	bl	printf
	b	.L6
.L7:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-292]
	sub	r2, fp, #4
	add	r3, r2, r3
	ldrb	r3, [r3, #-36]	@ zero_extendqisi2
	mov	r0, r3
	bl	putchar
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L6:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L7
	mov	r0, #10
	bl	putchar
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L9:
	.align	2
.L8:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.size	main, .-main
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
