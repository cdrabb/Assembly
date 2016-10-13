	.data
str1:	.asciiz	"racecar"
str2:	.asciiz "Hello World"
str3:	.asciiz "dammit im mad"
confirm:
	.asciiz " is a palindrome.\n"
decline:
	.asciiz " is not a palindrome.\n"

	.globl	main
	.text

main:	la	$a0, str1	#String 1
	li	$a2, 0
	jal	checkLength	#Check length
	la	$a1, str1
	la	$t2, str1
	jal	palindrome	#Test for palindrome
	la	$a0, str2	#String 2
	li	$a2, 0
	jal	checkLength
	la	$a1, str2
	la	$t2, str2
	jal	palindrome
	la	$a0, str3	#String 3
	li	$a2, 0
	jal	checkLength
	la	$a1, str3
	la	$t2, str3
	jal	palindrome
	li	$v0, 10
	syscall
checkLength:
	lb	$a1, 0($a0)
	blez	$a1, done	#Nullspace
	addi	$a0, $a0, 1
	addi	$a2, $a2, 1
	b	checkLength

done:	addi	$a0, $a0, -1	#go to last letter
	jr	$ra 

palindrome:
	beqz	$a2, complete	#All matches
	lb	$t0, 0($a1)	
	lb	$t1, 0($a0)
	beq	$t0, 32, shiftR	#if a space is met, continue
	beq	$t1, 32, shiftL	#if a space is met, continue
	beq	$t1, $t0, match	#check for match
	j	noMatch		#no match
match:	addi	$a2, $a2, -1	#decrement number of matches left
	j	palindrome
noMatch:
	move	$a0, $t2	#string address
	li	$v0, 4
	syscall
	la	$a0, decline	#no palindrome message
	syscall
	jr	$ra
complete:
	move	$a0, $t2	#string address
	li	$v0, 4
	syscall
	la	$a0, confirm	#palindrome message
	syscall
	jr	$ra
shiftR:	addi	$a1, $a1, 1	#increment
	j	palindrome
shiftL: addi	$a0, $a0, -1	#increment
	j	palindrome	