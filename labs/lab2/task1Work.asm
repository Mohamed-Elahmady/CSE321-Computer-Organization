.data
    OP1: .asciiz "Enter the first operand : " 
    OP2: .asciiz "Enter the second operand : "
    OP3: .asciiz "Enter the third operand : "
    OP4: .asciiz "Enter the fourth operand : "
    OUT: .asciiz "The Out = "
    newline: .asciiz "\n"

.text
main:
    li $v0, 4
    la $a0, OP1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, OP2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, OP3
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    li $v0, 4
    la $a0, OP4
    syscall

    li $v0, 5
    syscall
    move $t3, $v0

    addu $t4, $t0, $t1
    addu $t5, $t2, $t3
    addu $t6, $t4, $t5
    li $t7, 4
    div $t6, $t7
    mflo $t8

    li $v0, 4
    la $a0, OUT
    syscall

    li $v0, 1
    move $a0 $t8
    syscall

    li $v0, 4
    la $a0, newline
    syscall

exit:
    li $v0 10
    syscall
      