.data
    prom: .asciiz "Enter 2 number to add : "
.text
    add_func:
        addu $v0, $a0, $a1
    return_add:
        jr $ra
    main:
        
        li $v0, 4
        la $a0, prom
        syscall

        li $v0, 5
        syscall
        move $a0, $v0

        li $v0, 5
        syscall
        move $a1, $v0

        addi $sp, $sp, -4
        sw $ra, 0($sp)

        jal add_func

        lw $ra, 0($sp)
        addi $sp, $sp, 4

        move $a0, $v0
        li $v0, 1
        syscall

    exit:
        li $v0, 10
        syscall