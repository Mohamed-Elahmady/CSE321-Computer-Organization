.data
    prom: .asciiz "Enter number to get factorial : "
.text
    factorial_func:
        move $t0, $a0
        li $t1, 1       # for loop counter
        li $t2, 1       #for factorial value
        for_loop:
            bgt $t1, $t0, end_for
            mult $t2, $t1
            mflo $t2
            addu $t1, $t1, 1
            j for_loop
        end_for:
        move $v0, $t2
    return_factorial:
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

        jal factorial_func

        lw $ra, 0($sp)
        addi $sp, $sp, 4

        move $a0, $v0
        li $v0, 1
        syscall

    exit:
        li $v0, 10
        syscall