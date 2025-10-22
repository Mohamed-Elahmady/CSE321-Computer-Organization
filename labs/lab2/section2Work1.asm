.data
    Message1: .asciiz "Enter the first operand : " 
    Message2: .asciiz "Enter the second operand : "
    Output: .asciiz "the Sum = "
    newline: .asciiz "\n"

.text
main:
    li $v0, 4
    la $a0, Message1
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 4
    la $a0, Message2
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    addu $t0, $t1, $t2

    li $v0, 4
    la $a0, Output
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, newline
    syscall

exit:
    li $v0 10
    syscall
      