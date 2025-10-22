.data
    operand: .asciiz "Enter number of Variables : "
    var_num: .asciiz "U Enter Variable Number "
    avreg:   .asciiz "The Average = "
    newline: .asciiz "\n"
    printdot:  .asciiz " : "
    
.text
    main:

        li $t1, 1
    
        li $v0, 4
        la $a0, operand
        syscall

        li $v0, 5
        syscall
        move $t0, $v0

        while:
        bgt $t1, $t0, end_while

        li $v0, 4
        la $a0, var_num
        syscall

        li $v0, 1
        move $a0, $t1
        syscall

        li $v0, 4
        la $a0, printdot
        syscall

        li $v0, 5
        syscall
        move $t2, $v0
        
        add $t3, $t3, $t2
        add $t1, $t1, 1

        j while
        end_while:

        div $t3, $t0
        mflo $t4

        li $v0, 4
        la $a0, avreg
        syscall

        li $v0, 1
        move $a0, $t4
        syscall

        li $v0, 4
        la $a0, newline
        syscall

    exit:
    li $v0 10
    syscall