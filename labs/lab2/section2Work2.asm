.data
    op: .asciiz "Enter number to test : "
    Zero: .asciiz "Zero"
    Negative: .asciiz "Negative"
    Positive: .asciiz "Positive"
    newline: .asciiz "\n"
.text
    main:

        li $v0, 4
        la $a0, op
        syscall

        li $v0, 5
        syscall
        move $t0, $v0

        if:
        bne $t0, $zero, elseif
        li $v0, 4
        la $a0, Zero
        syscall
        j endif
        elseif:
        ble $t0, $zero, else
        li $v0, 4
        la $a0, Positive
        syscall
        j endif
        else:
        li $v0, 4
        la $a0, Negative
        syscall
        j endif
        endif:
        li $v0, 4
        la $a0, newline
        syscall
    exit:
    li $v0 10
    syscall