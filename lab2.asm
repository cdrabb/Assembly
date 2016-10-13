	.data
array:	.space 80
Prompt:	.asciiz	"\nEnter an integer: "
SL:	.asciiz "\nThe smallest and largest: "
Space:	.asciiz " "
ind:	.asciiz "I'm here"
Four:	.asciiz	"\nIntegers divisible by 4: "
	.globl	main
	.text

main:	la	$t0, array
	li	$t1, 20
	jal	loop
	la	$t0, array
	li	$t1, 20
	lw	$t2, 0($t0)
	lw	$t3, 0($t0)
	jal	smalar
	la	$a0, SL
	li	$v0, 4
	syscall
	li	$a0, 0
	add	$a0, $a0, $t2
	li	$v0, 1
	syscall
	la	$a0, Space
	li	$v0, 4
	syscall
	li	$a0, 0
	add 	$a0, $a0, $t3
	li	$v0, 1
	syscall
	li	$v0, 10
	syscall
	la	$t0, array
	li	$t1, 20

loop:	la	$a0, Prompt
	li	$v0, 4
	syscall
	li	$v0, 5
	syscall
	sw	$v0, 0($t0)
	addi	$t0, $t0, 4
	addi	$t1, $t1, -1
	bgtz	$t1, loop
	jr	$ra

smalar:	blez	$t1, ret
	addi	$t0, $t0, 4
	addi	$t1, $t1, -1
	lw	$t4, 0($t0)
	bgt	$t2, $t4, less	
	blt	$t3, $t4, great
	bgtz	$t1, smalar
ret:	jr	$ra

less:	lw	$t2, 0($t0)
	j	smalar

great:	lw	$t3, 0($t0)
	j	smalar
	
