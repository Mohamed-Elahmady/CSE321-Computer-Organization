.data
    prom: .asciiz "Enter number to get fibonacci : "
    space: .asciiz " "
    newline: .asciiz "\n"
.text
    fibonacci_func:
        li $t1, 1      # counter i = 1
        li $t2, 1      # previous1 = 1
        li $t3, 0      # previous2 = 0

        for:
            bgt $t1, $a1, end_for
            beq $t1, 1, print_zero
            beq $t1, 2, print_one

            # else → calculate fib(i)
            addu $t4, $t2, $t3   # current = previous1 + previous2
            move $t3, $t2        # previous2 = previous1
            move $t2, $t4        # previous1 = current

            li $v0, 1
            move $a0, $t4
            syscall
            li $v0, 4
            la $a0, space
            syscall

            addi $t1, $t1, 1
            j for

            print_zero:
            li $v0, 1
            move $a0, $t3
            syscall

            li $v0, 4
            la $a0, space
            syscall

            addi $t1, $t1, 1
            j for

            print_one:
            li $v0, 1
            move $a0, $t2
            syscall

            li $v0, 4
            la $a0, space
            syscall

            addi $t1, $t1, 1
            j for

        end_for:
    return_fibonacci:
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

        jal fibonacci_func

        lw $ra, 0($sp)
        addi $sp, $sp, 4

        li $v0, 4
        la $a0, newline
        syscall

    exit:
        li $v0, 10
        syscall