	.data
Prompt:	.asciiz	"\nThis string will be converted:\n"
Word:	.asciiz	"HELLO WORLD"
	.globl	main
	.text

main:	li	$a1, 11
	la	$a0, Prompt
	li	$v0, 4
	syscall
	la	$a0, Word
	li	$v0, 4
	syscall
	move	$t0, $a0
	lb	$a0, 0($t0)
	li	$v0, 1
	syscall
	addi	$a0, $a0, 32
	sb	$a0, 0($t0)
	move	$a0, $t0
	li	$v0, 4
	syscall
	li	$v0, 10
	syscall