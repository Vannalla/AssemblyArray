	.data
array:	.space 20

	.text
main:	la	$s1, array	# loads the address of the array into a register

	li	$t0, 1
	sw	$t0, 0($s1)	# stores 1 in array[0]
	li	$t0, 2
	sw	$t0, 4($s1)	# stores 2 in array[1]
	li	$t0, 3
	sw	$t0, 8($s1)	# stores 3 in array[2]
	li	$t0, 4
	sw	$t0, 12($s1)	# stores 4 in array[3]
	li	$t0, 5
	sw	$t0, 16($s1)	# stores 5 in array[4]
	
	lw	$t0, 0($s1)	# loading array[0]
	lw	$t1, 8($s1)	# loading array[2]
	sub	$t2, $t1, $t0 	# stores array[0] - array[2] in array[0]
	sw	$t2, 0($s1)	# storing in array[0]
	lw	$t0, 0($s1)	# reloading array[0]
	lw	$t3, 16($s1)    # loading array[4]
	add	$t4, $t0, $t1	# adding array[0] + array[2] in $t4
	add	$t0, $t3, $t4	# adding array[4] + $t4
	sw	$t0, 16($s1)	# storing in array[4]
	lw	$t0, 4($s1)	# loading array[1]
	lw	$t4, 12($s1)	# loading array[3]
	or	$t5, $t0, $t4	# bitwise or on array[1] and array[3]
	sw	$t5, 4($s1)	# storing in array[1]
	lw	$t0, 4($s1)	# reloading array[1]
	sll	$t5, $t0, 2	# shifting array[1] by 2 to the left\
	sw	$t5, 4($s1)	# stores the shift array[1] back into array[1]
	lw	$t0, 4($s1)	# reloading array[1]
	andi	$t4, $t0, 21	# bitwise and on array[1] with 21
	sw	$t4, 12($s1)	# storing in array[3]
	lw	$t3, 16($s1)	# reloading array[4]
	not	$t4, $t3	# bitwise inverse on array[4]
	sw	$t4, 8($s1)	# storing in array[2]
	lw	$t1, 0($s1)	# loading array[0]
	li	$v0, 1		# preparing to print
	move	$a0, $t1	# stores array[0] in $a0
	syscall			# printing
	lw	$t1, 4($s1)	# loading array[1]
	li	$v0, 1		# preparing to print
	move	$a0, $t1	# stores array[1] in $a0
	syscall			# printing
	lw	$t1, 8($s1)	# loading array[2]
	li	$v0, 1		# preparing to print
	move	$a0, $t1	# stores array[2] in $a0
	syscall			# printing
	lw	$t1, 12($s1)	# loading array[3]
	li	$v0, 1		# preparing to print
	move	$a0, $t1	# stores array[3] in $a0
	syscall			# printing
	lw	$t1, 16($s1)	# loading array[4]
	li	$v0, 1		# preparing to print
	move	$a0, $t1	# stores array[0] in $a0
	syscall			# printing
	
	
	
	
	li	$v0, 10		# exit cleanly
	syscall