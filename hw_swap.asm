	.data
Prompt:	.asciiz	"The two strings will be swapped:\n"
Result:	.asciiz	"\nThe result is:\n"
space:	.asciiz	" "
line:	.asciiz "\n"
str1:	.asciiz	"Hello World"
str2:	.asciiz	"Goodbye sir"
	.globl	main
	.text

main:	la	$a0, Prompt
	li	$v0, 4
	syscall
	la	$a0, str1
	syscall
	la	$a0, line
	syscall
	la	$a0, str2
	syscall
	la	$a0, str1
	la	$a1, str2
	li	$a2, 12
	jal	swap
	li	$v0, 10
	syscall
swap:	blez	$a2, done
	lb	$t0, 0($a0)
	lb	$t1, 0($a1)
	sb	$t0, 0($a1)
	sb	$t1, 0($a0)
	addi	$a0, $a0, 1
	addi	$a1, $a1, 1
	addi	$a2, $a2, -1
	bgtz	$a2, swap
done:	la	$a0, Result
	syscall
	la	$a0, str1
	syscall
	la	$a0, line
	syscall
	la	$a0, str2
	syscall
	jr	$ra