.data
    prom: .asciiz "Enter number to get fibonacci using recusion : "
    space: .asciiz " "
    newline: .asciiz "\n"
.text
    rec_fibonacci_func:
        bgt $a1, 2, recursive_case
        
        li $v0, 1
        beq $a1, 1, return_rec_fibonacci
        beq $a1, 2, return_rec_fibonacci
        
        li $v0, 0
        j return_rec_fibonacci
        
    recursive_case:
        addi $sp, $sp, -12
        sw $ra, 0($sp)
        sw $a1, 4($sp)
        
        addi $a1, $a1, -1
        jal rec_fibonacci_func
        sw $v0, 8($sp)  # save fib(n-1)
        
        lw $a1, 4($sp)
        addi $a1, $a1, -2
        jal rec_fibonacci_func
        lw $t0, 8($sp)
        
        add $v0, $t0, $v0
        
        lw $ra, 0($sp)
        lw $a1, 4($sp)
        addi $sp, $sp, 12
        
    return_rec_fibonacci:
        jr $ra
        
    main:
        li $v0, 4
        la $a0, prom
        syscall

        li $v0, 5
        syscall
        move $a1, $v0

        addi $sp, $sp, -4
        sw $ra, 0($sp)

        jal rec_fibonacci_func

        move $a0, $v0
        li $v0, 1
        syscall

        lw $ra, 0($sp)
        addi $sp, $sp, 4

        li $v0, 4
        la $a0, newline
        syscall

    exit:
        li $v0, 10
        syscall