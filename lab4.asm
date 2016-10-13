#Christopher Rabb
#Salam Salloum
###########################################
	.data
line:	.asciiz	"\n\n"
	.globl main
	.text
main:	li	$t0, -4
	li	$t1, -2147483648
	li	$t2, 1073741824
	li	$t3, 65
	li	$v0, 1
	srl 	$t4, $t0, 2
	move	$a0, $t4
	syscall
	li	$v0, 4
	la	$a0, line
	syscall
	li	$v0, 1
	sra	$t4, $t0, 2
	move	$a0, $t4
	syscall	
	li	$v0, 4
	la	$a0, line
	syscall
	li	$v0, 1
	sll 	$t4, $t0, 1
	move	$a0, $t4
	syscall
	li	$v0, 4
	la	$a0, line
	syscall
	li	$v0, 1
	rol 	$t4, $t0, 2
	move	$a0, $t4
	syscall
	li	$v0, 4
	la	$a0, line
	syscall
	li	$v0, 1
	ror 	$t4, $t0, 2
	move	$a0, $t4
	syscall
	li	$v0, 4
	la	$a0, line
	syscall
	li	$v0, 1
	xor 	$t4, $t0, $t1
	move	$a0, $t4
	syscall
	li	$v0, 4
	la	$a0, line
	syscall
	li	$v0, 1
	xor 	$t4, $t1, -8
	move	$a0, $t4
	syscall
	li	$v0, 4
	la	$a0, line
	syscall
	li	$v0, 1
	addu 	$t4, $t0, $t1
	move	$a0, $t4
	syscall
	li	$v0, 4
	la	$a0, line
	syscall
	li	$v0, 1
	mul 	$t4, $t1, $t2
	move	$a0, $t4
	syscall
	li	$v0, 4
	la	$a0, line
	syscall
	li	$v0, 1
	mulo 	$t4, $t1, $t2
	move	$a0, $t4
	syscall
	li	$v0, 4
	la	$a0, line
	syscall
	li	$v0, 1
	mulou 	$t4, $t0, $t0
	move	$a0, $t4
	syscall
	li	$v0, 4
	la	$a0, line
	syscall
	li	$v0, 1
	mulou 	$t4, $t3, $t3
	move	$a0, $t4
	syscall
	li	$v0, 4
	la	$a0, line
	syscall
	li	$v0, 1
	div 	$t4, $t1, $t0
	move	$a0, $t4
	syscall
	li	$v0, 4
	la	$a0, line
	syscall
	li	$v0, 1
	div 	$t4, $t3, $t0
	move	$a0, $t4
	syscall
	li	$v0, 4
	la	$a0, line
	syscall
	li	$v0, 1
	divu	$t4, $t1, $t0
	move	$a0, $t4
	syscall
	li	$v0, 4
	la	$a0, line
	syscall
	li	$v0, 1
	sub 	$t4, $t1, $t0
	move	$a0, $t4
	syscall
	li	$v0, 4
	la	$a0, line
	syscall
	li	$v0, 1
	subu 	$t4, $t1, $t0
	move	$a0, $t4
	syscall
	li	$v0, 4
	la	$a0, line
	syscall
	li	$v0, 1
	mult 	$t1, $t2
	mfhi	$a0
	syscall
	li	$v0, 4
	la	$a0, line
	syscall
	li	$v0, 1
	mflo	$a0
	syscall
	li	$v0, 4
	la	$a0, line
	syscall
	li	$v0, 1
	multu 	$t0, $t3
	mfhi	$a0
	syscall
	li	$v0, 4
	la	$a0, line
	syscall
	li	$v0, 1
	mflo	$a0
	syscall
	li	$v0, 10
	syscall