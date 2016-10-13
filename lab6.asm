	.data
array:	.space 40
Prompt:	.asciiz "Enter a number: "
res:	.asciiz "The minimum number in the array is "
Prompt2: .asciiz "\nChoose a number to combine: "
res2:	.asciiz "The result is: "
	.text

main:	la	$a0, Prompt
	la	$a1, array
	li	$t0, 0
	li	$t4, 0
	li	$t5, 0
	li	$t6, 0
	li	$t7, 0
loop:	li	$v0, 4
	syscall
	li	$v0, 5
	syscall
	sw	$v0, 0($a1)
	addi	$a1, $a1, 4
	addi	$t0, $t0, 1
	blt	$t0, 10, loop
	la	$a0, res
	li	$v0, 4
	syscall
	la	$a0, array
	li	$a1, 0
	li	$a2, 9
	jal	min
	move	$a0, $v1
	li	$v0, 1
	syscall
	la	$a0, Prompt2
	li	$v0, 4
	syscall
	li	$v0, 5
	syscall
	move	$a1, $v0
	la	$a0, Prompt2
	li	$v0, 4
	syscall
	li	$v0, 5
	syscall
	move	$a0, $v0
	li	$t0, 0
	jal 	comb
	la	$a0, res2
	li	$v0, 4
	syscall
	move	$a0, $t0
	li	$v0, 1
	syscall
	li	$v0, 10
	syscall

min:	bne	$a1, $a2, rec
	la	$a0, array
	mul	$t2, $a1, 4
	add	$a0, $a0, $t2
	lw	$v1, 0($a0)
	jr	$ra

rec:	addi	$sp, $sp, -12
	sw	$ra, 0($sp)
	add	$t0, $a2, $a1 #(high + low)
	div	$t0, $t0, 2 #(high + low)/2

min1:	sw	$a2, 4($sp) #Store high
	addi	$t1, $t0, 1
	sw	$t1, 8($sp) #store mid + 1
	move	$a2, $t0
	jal	min
	move	$t3, $v1

min2:	lw	$a2, 4($sp)
	lw	$a1, 8($sp)
	jal	min
	move	$t4, $v1

	bgt	$t3, $t4, retMid2
	move	$v1, $t3
	j	end
retMid2:
	move	$v1, $t4

end:	lw	$ra, 0($sp)
	addi	$sp, $sp, 12
	jr	$ra

comb:	beqz	$a0, default
	bne	$a0, $a1, recu

default:
	addi	$t0, $t0, 1
	move	$v1, $t0
	jr	$ra

recu:	addi	$sp, $sp, -4
	sw	$ra, 0($sp)
	addi	$a1, $a1, -1

comb1:	jal	comb
	addi	$a0, $a0, -1

comb2:	jal	comb
	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr	$ra