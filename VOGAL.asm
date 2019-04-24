.data
	buffer:		.space 20
	str1:		.asciiz "Enter string \n"
	strP:		.asciiz ":"
	strA:		.asciiz "A"
	strE:		.asciiz "E"
	strI:		.asciiz "I"
	strO:		.asciiz "O"
	strU:		.asciiz "U"
	strlinha:	.asciiz "\n"
	array: .space 20
.text
.globl main
main:	
	la $a0, str1   
	li $v0, 4
	syscall
	
	li $v0, 8       
	la $a0, buffer 
	li $a1, 20      
	move $t0, $a0   
	syscall
	
	move $a0, $t0
	li $v0, 4      
	syscall
	
	lb $t1, 1($t0)
	beq $t1, $zero, vazia
	li $t5, -1
	
	la $t2, array
loop:
	lb $t1, 0($t0)
	beq $t1,$zero, sailoop

	la $t6, strA
	lb $t7, 0($t6)
	beq $t1, $t7, addA

	la $t6, strE
	lb $t7, 0($t6)
	beq $t1, $t7, addE
	

	la $t6, strI
	lb $t7, 0($t6)
	beq $t1, $t7, addI
	
	la $t6, strO
	lb $t7, 0($t6)
	beq $t1, $t7, addO
	
	la $t6, strU
	lb $t7, 0($t6)
	beq $t1, $t7, addU
	j t
addA:
	li $t4, 0
	j sai	
addE:	
	li $t4, 4
	j sai
addI:
	li $t4, 8
	j sai
addO:	
	li $t4, 12
	j sai
addU:
	li $t4, 16
sai:
	add $t2, $t2, $t4
	lb $t3, ($t2)
	addi $t3, $t3, 1
	sb $t3, ($t2)
	mulo $t4, $t4, $t5
	add $t2, $t2, $t4
t:	
	addi $t0, $t0, 1
	j loop
sailoop:
	li $t4, 4
	li $t7, 0

	la $a0, strlinha  
	li $v0, 4
	syscall

	la $a0, strA  
	li $v0, 4
	syscall
	j print
printE:	
	la $a0, strE  
	li $v0, 4
	syscall
	j print
printI:	
	la $a0, strI  
	li $v0, 4
	syscall
	j print
printO:	
	la $a0, strO  
	li $v0, 4
	syscall
	j print
printU:	
	la $a0, strU 
	li $v0, 4
	syscall
	j print
print:
	la $a0, strP 
	li $v0, 4
	syscall	
	
	lb $a0, ($t2)
	li $v0, 1
	syscall
	
	la $a0, strlinha  
	li $v0, 4
	syscall
	
	addi $t2, $t2, 4
	addi $t7, $t7, 4
	beq $t7, 4,printE
	beq $t7, 8,printI
	beq $t7, 12,printO
	beq $t7, 16,printU
	j fim
vazia:
	li $t2, -1
	addi $a0, $t2, 0
	li $v0, 1
	syscall
fim:
	li $v0, 10     
	syscall
