.data

bemvindo:   	.asciiz "Bem-vindo ao meu programa\n\nAluno: Daniel Braz\nCurso: Sistemas de Informacao - Puc Minas\nDisciplina: Arquitetura de Computadores\n\n"
opcao:	 	.asciiz "Escolha uma opcao:\n1 - Somar, 2 - Subtrair, 3 - Multiplicar, 4 - Dividir\n"
msg:		.asciiz "Digite um numero:"
txt:  		.asciiz "\nDeseja iniciar a calculadora? 1-Sim 0-Nao\n"
finaliza:	.asciiz "Finalizando o programa . . ."                                                               
.text

main: 		addi $sp,$sp,-24
		sw $s1,0($sp)
		sw $s2,4($sp)
		sw $s3,8($sp)
		sw $s4,12($sp)
		sw $a0,16($sp)
		sw $ra,20($sp)   	   	
		addi $s1,$t1,1
		addi $s2,$t2,2
		addi $s3,$t3,3
  		addi $s4,$t4,4			
   		li $v0,4
   		la $a0,bemvindo
   		syscall
while:		li $v0,4
   		la $a0,txt
   		syscall
   		li $v0,5
   		syscall 
	 	beq $v0,$zero,fim
		li $v0,4
   		la $a0,opcao
   		syscall
   		li $v0,5
   		syscall 
		beq $v0,$s1,soma 
   	        beq $v0,$s2,subtrair  
   		beq $v0,$s3,multiplicar 
  	        beq $v0,$s4,dividir 
		j while  
		             
fim: 		li $v0,4
   		la $a0,finaliza
   		syscall
		lw $ra,20($sp)
		lw $a0,16($sp)
		lw $s4,12($sp)
		lw $s3,8($sp)
		lw $s2,4($sp)
		lw $s1,0($sp)
		addi $sp,$sp,24	
		jr $ra
   
dividir:	addi $t5,$zero,0
   		addi $t6,$zero,0
   		addi $t7,$zero,0 
   		li $v0,4
  	        la $a0,msg 
   		syscall
   		li $v0,5
   		syscall
   		add $t5,$v0,$zero
   		li $v0,4
   		la $a0,msg 
   		syscall
   		li $v0,5
   		syscall  
   		add $t6,$v0,$zero
   		div $t7, $t5,$t6
   		li $v0, 1
   		move $a0, $t7
   		syscall
   		j while
   
multiplicar:	addi $t5,$zero,0
   		addi $t6,$zero,0
   		addi $t7,$zero,0 
  		li $v0,4
   		la $a0,msg 
   		syscall
   		li $v0,5
   		syscall
   		add $t5,$v0,$zero
   		li $v0,4
   		la $a0,msg 
   		syscall
   		li $v0,5
   		syscall  
   		add $t6,$v0,$zero
   		mul $t7, $t5,$t6
   		li $v0, 1
   		move $a0, $t7
   		syscall 		
		j while
 
subtrair:       addi $t5,$zero,0
   		addi $t6,$zero,0
   		addi $t7,$zero,0 
   		li $v0,4
   		la $a0,msg 
   		syscall
   		li $v0,5
   		syscall
   		add $t5,$v0,$zero
   		li $v0,4
   		la $a0,msg 
   		syscall
   		li $v0,5
   		syscall  
   		add $t6,$v0,$zero
   		sub $t7, $t5,$t6
   		li $v0, 1
   		move $a0, $t7
   		syscall	
		j while

soma:	        addi $t5,$zero,0
   		addi $t6,$zero,0
   		addi $t7,$zero,0 
  		li $v0,4
   		la $a0,msg 
   		syscall
   		li $v0,5
   		syscall
   		add $t5,$v0,$zero
   		li $v0,4
   		la $a0,msg 
   		syscall
   		li $v0,5
   		syscall  
   		add $t6,$v0,$zero
   		add $t7, $t5,$t6
   		li $v0, 1
   		move $a0, $t7
   		syscall
   		j while


	
   

   