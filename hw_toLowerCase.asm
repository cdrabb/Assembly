	.data
Prompt:	.asciiz	"\nThis string will be converted:\n"
line:	.asciiz "\n"
Word:	.asciiz	"HELLO WORLD"
	.globl	main
	.text

main:	li	$a1, 12
	la	$a0, Prompt
	li	$v0, 4
	syscall
	la	$a0, Word
	li	$v0, 4
	syscall
	la	$a0, line
	syscall
	la	$a0, Word
	jal	toLowerCase
	la	$a0, Word
	li	$v0, 4
	syscall
	li	$v0, 10
	syscall

toLowerCase:	
	move	$t0, $a0
	li	$t1, 0
	j	check

check:	lb	$a0, 0($t0)
	beqz	$a0, done
	beq	$a0, 32, skip
letter:	addi	$a0, $a0, 32
	sb	$a0, 0($t0)
skip:	addi	$t0, $t0, 1
	addi	$t1, $t1, 1
	blt	$t1, $a1, check
done:	jr	$ra	