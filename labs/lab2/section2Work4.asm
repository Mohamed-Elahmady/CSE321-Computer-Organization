.data
    newline: .asciiz "\n"
.text
    main:
    li $t0, 0

    do_while:
    li $v0, 5
    syscall
    move $t1, $v0

    beq $t1, $zero, end_do_while
    add $t0, $t0, $t1
    j do_while
    end_do_while:

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    exit:
    li $v0, 10
    syscall