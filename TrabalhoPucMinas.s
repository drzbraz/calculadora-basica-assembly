.data

bemvindo:   	.asciiz "Bem-vindo ao meu programa\n\nAluno: Daniel Braz\nCurso: Sistemas de Informacao - Puc Minas\nDisciplina: Arquitetura de Computadores\n\n"
opcao:	 	.asciiz "Escolha uma opcao:\n1 - Somar, 2 - Subtrair, 3 - Multiplicar, 4 - Dividir\n"
msg:		.asciiz "Digite um numero:"
txt:  		.asciiz "\nDeseja iniciar a calculadora? 1-Sim 0-Nao\n"
finaliza:	.asciiz "Finalizando o programa . . ."                                                               
.text
		#Inicio da pilha
main: 		addi $sp,$sp,-24
		sw $s1,0($sp)
		sw $s2,4($sp)
		sw $s3,8($sp)
		sw $s4,12($sp)
		sw $a0,16($sp)
		sw $ra,20($sp)  
		#Atribuindo valores aos registradores	   	
		addi $s1,$t1,1
		addi $s2,$t2,2
		addi $s3,$t3,3
  		addi $s4,$t4,4			
   		#imprimindo na tela mensagem de bem-vindo
		li $v0,4
   		la $a0,bemvindo
   		syscall
		#Confirmação se deseja iniciar a calculadora
while:		li $v0,4
   		la $a0,txt
   		syscall
   		#Lendo um inteiro do teclado
		li $v0,5
   		syscall 
		#Comparando o valor informado
	 	beq $v0,$zero,fim
		#Imprimindo as opções
		li $v0,4
   		la $a0,opcao
   		syscall
		#Lendo um inteiro do teclado
   		li $v0,5
   		syscall 
		#Comparando se o valor informado bate com as opções
		beq $v0,$s1,soma 
   	        beq $v0,$s2,subtrair  
   		beq $v0,$s3,multiplicar 
  	        beq $v0,$s4,dividir 
		j while  
		        
		#Imprime mensagem de encerramento     
fim: 		li $v0,4
   		la $a0,finaliza
   		syscall
		#Desempilhando a pilha
		lw $ra,20($sp)
		lw $a0,16($sp)
		lw $s4,12($sp)
		lw $s3,8($sp)
		lw $s2,4($sp)
		lw $s1,0($sp)
		addi $sp,$sp,24	
		jr $ra
   
		#Zerando os temporários
dividir:	addi $t5,$zero,0
   		addi $t6,$zero,0
   		addi $t7,$zero,0 
		#Mostrando mensagem na tela
   		li $v0,4
  	        la $a0,msg 
   		syscall	
		#Lendo inteiro do teclado
   		li $v0,5
   		syscall
		#Adicionando o valor no temporário
   		add $t5,$v0,$zero
		#Mostrando mensagem na tela
   		li $v0,4
   		la $a0,msg 
   		syscall
		#Lendo inteiro do teclado
   		li $v0,5
   		syscall  
		#Adicionando o valor no temporário
   		add $t6,$v0,$zero
		#Dividindo os valores
   		div $t7, $t5,$t6
   		li $v0, 1
   		move $a0, $t7
   		syscall
		#Voltando para o While
   		j while
   
		#Zerando os temporários
multiplicar:	addi $t5,$zero,0
   		addi $t6,$zero,0
   		addi $t7,$zero,0 
		#Mostrando mensagem na tela 
  		li $v0,4
   		la $a0,msg 
   		syscall
		#Lendo inteiro do teclado
   		li $v0,5
   		syscall
		#Adicionando o valor no temporário
   		add $t5,$v0,$zero
		#Mostrando mensagem na tela
   		li $v0,4
   		la $a0,msg 
   		syscall
		#Lendo inteiro do teclado
   		li $v0,5
   		syscall 
		#Adicionando o valor no temporário 
   		add $t6,$v0,$zero
		#Multiplicando os valores
   		mul $t7, $t5,$t6
   		li $v0, 1
   		move $a0, $t7
   		syscall 	
		#Voltando para o While	
		j while
 
		#Zerando os temporários
subtrair:       addi $t5,$zero,0
   		addi $t6,$zero,0
   		addi $t7,$zero,0 
		#Mostrando mensagem na tela 
   		li $v0,4
   		la $a0,msg 
   		syscall
		#Lendo inteiro do teclado
   		li $v0,5
   		syscall	
		#Adicionando o valor no temporário
   		add $t5,$v0,$zero
		#Mostrando mensagem na tela 
   		li $v0,4
   		la $a0,msg 
   		syscall
		#Lendo inteiro do teclado
   		li $v0,5
   		syscall  
		#Adicionando o valor no temporário
   		add $t6,$v0,$zero
		#Subtraindo os valores
   		sub $t7, $t5,$t6
   		li $v0, 1
   		move $a0, $t7
   		syscall	
		#Voltando para o While
		j while

                #Zerando os temporários
soma:	        addi $t5,$zero,0
   		addi $t6,$zero,0
   		addi $t7,$zero,0
		#Mostrando mensagem na tela 
  		li $v0,4
   		la $a0,msg 
   		syscall
		#Lendo inteiro do teclado
   		li $v0,5
   		syscall
		#Adicionando o valor no temporário
   		add $t5,$v0,$zero
		#Mostrando mensagem na tela
   		li $v0,4
   		la $a0,msg 
   		syscall
   		li $v0,5
   		syscall
		#Adicionando o valor no temporário  
   		add $t6,$v0,$zero
		#Somando os valores
   		add $t7, $t5,$t6
		#Mostrando o resultado na tela
   		li $v0, 1
   		move $a0, $t7
   		syscall
		#Voltando para o While
   		j while


	
   

   
