.data
    prom: .asciiz "Enter number to get factorial : "
.text
    rec_factorial_func:
        
        move $t0, $a0
        beqz $t0, zero_case
        
        addi $sp, $sp, -8
        sw $ra, 0($sp)
        sw $a0, 4($sp)

        sub $t0, $t0, 1
        move $a0, $t0

        jal rec_factorial_func

        lw $ra, 0($sp)
        lw $a0, 4($sp)
        addi $sp, $sp, 8

        mul $v0, $v0, $a0
        j return_rec_factorial

        zero_case:
            li $v0, 1
            j return_rec_factorial
    return_rec_factorial:
        jr $ra
    main:
        
        li $v0, 4
        la $a0, prom
        syscall

        li $v0, 5
        syscall
        move $a0, $v0

        addi $sp, $sp, -4
        sw $ra, 0($sp)

        jal rec_factorial_func

        lw $ra, 0($sp)
        addi $sp, $sp, 4

        move $a0, $v0
        li $v0, 1
        syscall

    exit:
        li $v0, 10
        syscall