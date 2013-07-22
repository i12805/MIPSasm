  	.text
.globl main

main:
enterS:	li $v0,4
		la $a0, prompt
		syscall
		li $v0,5
		syscall
		slti $s0,$v0,25
		beq $s0,$0,enterS
		nop
		sw $v0,size
		
		lw $s0,size
		la $s1, dates
		
dates1:	beq $s0,$0,print
		nop
		li $v0,9
		li $a0,12
		syscall
		move $s2, $v0
		sw $s2,0($s1)
		addiu $s1,$s1,4
		li $v0,4
		la $a0,day
		syscall
		li $v0,5
		syscall
		sw $v0,0($s2)
		li $v0,4
		la $a0,month
		syscall
		li $v0,5
		syscall
		sw $v0,4($s2)
		li $v0,4
		la $a0,year
		syscall
		li $v0,5
		syscall
		sw $v0,8($s2)
		addiu $s0,$s0,-1
		li $v0,4
		la $a0, newlne
		j dates1
		syscall
		
print:	lw $s0,size
		la $s2,dates
loop:	beq $s0,$0,done
		nop
		lw $s1,0($s2)
		nop
		lw $a0,0($s1)
		li $v0,1
		nop
		syscall
		la $a0,datsep
		li $v0,4
		syscall
		lw $a0,4($s1)
		li $v0,1
		syscall
		la $a0,datsep
		li $v0,4
		syscall
		lw $a0,8($s1)
		li $v0,1
		syscall
		la $a0,newlne
		li $v0,4
		syscall
		addiu $s2,$s2,4
		j loop
		addiu $s0,$s0,-1
		
done:	li $v0,10
		syscall

		.data
size:	.word	0
dates:	.space	25*4
prompt:	.asciiz	"Size = "
day:	.asciiz	"Day = "
month:	.asciiz	"Month = "
year:	.asciiz	"Year = "
datsep:	.asciiz	"/"
newlne:	.byte	0xa
