	.data
user:	.space 100
upper:	.space 108
lower:	.space 104
upAlph:	.asciiz "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
loAlph:	.asciiz "abcdefghijklmnopqrstuvwxyz"
Prompt:	.asciiz	"Please enter a string: "
upres:	.asciiz	"\nThe Uppercase array: "
lowres:	.asciiz	"\nThe Lowercase array: "
spaces:	.asciiz "spaces "
space:	.asciiz " "
	.globl	main
	.text

main:
	la	$a0, Prompt
	li	$v0, 4
	syscall
	li	$v0, 8		
	la	$a0, user	#user input
	li	$a1, 100	#setting string limit
	syscall
	la	$a0, user
	la	$a1, upper
	la	$a2, lower
	li	$t0, 26
	j	populate	#fill uppercase and lowercase counter arrays

filled:	
	la	$a1, upper	
	la	$a2, lower
	jal	frequency	#call function
	la	$a0, upres	#Uppercase results
	li	$v0, 4	
	syscall
	la	$t0, upper	#uppercase array
	li	$t1, 0		#counter
	li	$t2, 65		#Ascii value of A
	jal	print		#print function
	la	$a0, lowres
	li	$v0, 4
	syscall
	la	$t0, lower
	li	$t1, 0		#counter
	li	$t2, 97		#Ascii value of a
	jal	print
	la	$a0, spaces	
	li	$v0, 4
	syscall
	la	$t0, upper
	lw	$a0, 104($t0)	#spaces counter
	li	$v0, 1
	syscall
	li	$v0, 10
	syscall

populate:			#This function fills both arrays with zeros
	li	$t1, 0
	sw	$t1, 0($a1)
	sw	$t1, 0($a2)
	addi	$a1, $a1, 4
	addi	$a2, $a2, 4
	addi	$t0, $t0, -1
	bgez	$t0, populate
	la	$a1, upper
	la	$a2, lower
	j	filled

frequency:
	li	$t1, 0
	lb	$t0, 0($a0)
	beqz	$t0, EOS	#End of String
	ble	$t0, 90, upperc	#Less than 'Z'
	bge	$t0, 97, lowerc	#Greater than 'a'

upperc:	bge	$t0, 65, upletter	#Greater than 'A'
	beq	$t0, 32, wspace		#Whitespace
	addi	$a0, $a0, 1		#increment
	j	frequency

upletter:
	addi	$t1, $t0, -65	#Subtract ascii value of 'A' for array index
	sll	$t1, $t1, 2	#Multiply by 4
	add	$a1, $a1, $t1	#Go to correct index
	lw	$t2, 0($a1)
	addi	$t2, $t2, 1
	sw	$t2, 0($a1)
	la	$a1, upper
	addi	$a0, $a0, 1
	j	frequency

lowerc:	ble	$t0, 122, lowletter	#Less than 'z'
	addi	$a0, $a0, 1		#increment
	j	frequency

lowletter:
	addi	$t1, $t0, -97	#Subtract ascii value of 'a' for array index
	sll	$t1, $t1, 2
	add	$a2, $a2, $t1
	lw	$t2, 0($a2)
	addi	$t2, $t2, 1
	sw	$t2, 0($a2)
	la	$a2, lower
	addi	$a0, $a0, 1
	j	frequency

wspace:	la	$t0, upper
	lw	$t1, 104($t0)	#Space counter index
	addi	$t1, $t1, 1
	sw	$t1, 104($t0)
	addi	$a0, $a0, 1
	j	frequency

EOS:	jr	$ra
	
print:	add	$t3, $t2, $t1	#count + ascii value
	move	$a0, $t3
	li	$v0, 11		#print char
	syscall
	lw	$a0, 0($t0)	
	li	$v0, 1
	syscall
	la	$a0, space
	li	$v0, 4
	syscall
	addi	$t1, $t1, 1
	addi	$t0, $t0, 4
	ble	$t1, 25, print
	jr	$ra