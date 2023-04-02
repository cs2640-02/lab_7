# Name: Joshua Ho
# Date: 04/02/2023
# Assignment: Program 1: Getting Familiar with Assembly
# Objectives: 
# Task 1
#  - User main label
#  - Get two numbers from user (integers)
#  - Values should be held in registers $s0 and $s1
#  - Output the user input

# Task 2
#  - Use input values to add, subtract, multiply, and divide
#  - Output results back to user

# Task 3
#  - If the user inputs are equal, print "User inputs are the same"
#  - If the user input is not equal, print "User inputs are different"



.data

getNum1: .asciiz "\nPlease enter an int: "
getNum2: .asciiz "\nPlease enter another int: "

printNum1: .asciiz "\nInput 1: "
printNum2: .asciiz "\nInput 2: "

addResult: .asciiz "\nAddition result: "
subResult: .asciiz "\nSubtraction result: "
mulResult: .asciiz "\nMultiplication reuslt: "
divResult: .asciiz "\nDivision result: "

sameInput: .asciiz "\nUser inputs are the same"
differentInput: .asciiz "\nUser inputs are different"

.text

main: 
# Task 1 start

	# print out getNum1
	li $v0, 4
	la $a0, getNum1
	syscall
	
	# get user input
	li $v0, 5
	syscall
	
	move $s0, $v0 # move $v0 to $s0
	
	# print out getNum2
	li $v0, 4
	la $a0, getNum2
	syscall
	
	# get user input
	li $v0, 5
	syscall
	
	move $s1, $v0 # move $v0 to $s1
	
	
	# Return inputs bask to user
	
	# print out printNum1
	li $v0, 4
	la $a0, printNum1
	syscall
	
	# print $s0
	li $v0, 1
	move $a0, $s0
	syscall
	
	# print out printNum2
	li $v0, 4
	la $a0, printNum2
	syscall
	
	# print $s1
	li $v0, 1
	move $a0, $s1
	syscall
	
# Task 1 end
	
	
# Task 2 start
	
	# addition
	add $t1, $s0, $s1
	
	li $v0, 4
	la $a0, addResult
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	# subtraction
	sub $t2, $s0, $s1
	
	li $v0, 4
	la $a0, subResult
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	# multiplication
	mul $t3, $s0, $s1
	
	li $v0, 4
	la $a0, mulResult
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	
	# division
	div $t4, $s0, $s1
	
	li $v0, 4
	la $a0, divResult
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
# Task 2 end

# Task 3 start
	
	beq $s0, $s1, equal
	
	li $v0, 4
	la $a0, differentInput
	syscall
	
# Task 3 end
	
	j exit 

equal: # print equal input
	li $v0, 4
	la $a0, sameInput
	syscall

exit: #exit program
	li $v0 10
	syscall
	
	
	
	
	
	
