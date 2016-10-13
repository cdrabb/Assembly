#Christopher Rabb
#Salam Salloum
#CS264
##################################
	.data
emps:	.space 480
Promptn: .asciiz "Please enter name: "
Prompta: .asciiz "Please enter age: "
Prompts: .asciiz "Please enter salary: "
name:	.asciiz "Name: "
age:	.asciiz "Age: "
salary:	.asciiz "Salary: $"
swap:	.asciiz "\nEnter the record # to be swapped(Enter '10' to quit): "
newLine: .asciiz "\n"
	.text

main:	la	$a2, emps
	li	$t1, 0
loop1:	la	$a0, Promptn
	li	$a1, 40
	li	$v0, 4
	syscall
	li	$v0, 8
	move	$a0, $a2
	syscall
	addi	$a2, $a2, 40
	la	$a0, Prompta
	li	$a1, 4
	li	$v0, 4
	syscall
	li	$v0, 5
	syscall
	sw 	$v0, 0($a2)
	addi	$a2, $a2, 4
	la	$a0, Prompts
	li	$v0, 4
	syscall
	li	$v0, 5
	syscall
	sw	$v0, 0($a2)
	addi	$a2, $a2, 4
	addi	$t1, $t1, 1
	blt	$t1, 10, loop1
	la	$a2, emps
	li	$t1, 0
loop2:	la	$a0, name
	li	$v0, 4
	syscall
	move	$a0, $a2
	li	$a1, 40
	syscall
	la	$a0, age
	syscall
	addi	$a2, $a2, 40
	lw	$a0, 0($a2)
	li	$a1, 4
	li	$v0, 1
	syscall
	li	$v0, 4
	la	$a0, newLine
	syscall
	la	$a0, salary
	li	$v0, 4
	syscall
	addi	$a2, $a2, 4
	lw	$a0, 0($a2)
	li	$v0, 1
	syscall
	li	$v0, 4
	la	$a0, newLine
	syscall
	addi	$a2, $a2, 4
	addi	$t0, $t0, 1
	blt	$t0, 10, loop2
	#beq	$t7, 1, done
EOL:	la	$a0, swap
	la	$a2, emps
	li	$v0, 4
	syscall
	li	$v0, 5
	syscall
	bgt	$v0, 10, EOL
	beq	$v0, 10, done
	move	$t0, $v0
	addi	$t0, $t0, -1
	mul	$t0, $t0, 48
	add	$a2, $a2, $t0
	li	$t0, 0
	move	$a3, $a2
	addi	$a3, $a3, 48
swaps:	lw	$t1, 0($a2)
	lw	$t2, 0($a3)
	sw	$t2, 0($a2)
	sw	$t1, 0($a3)
	addi	$a2, $a2, 4
	addi	$a3, $a3, 4
	addi	$t0, $t0, 1
	blt	$t0, 12, swaps
	la	$a2, emps
	li	$t0, 0
	#li	$t7, 1
	b	loop2
done:	
	li	$v0, 10
	syscall