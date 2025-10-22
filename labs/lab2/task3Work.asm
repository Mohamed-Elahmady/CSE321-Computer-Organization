.data
    operand: .asciiz "Enter number for Switch Case : "
    newline: .asciiz "\n"
    case1_prom: .asciiz "case1 selected"
    case2_prom: .asciiz "case2 selected"
    case3_prom: .asciiz "case3 selected"
    default_prom: .asciiz "no selected cases"
.text
    main:
    
        li $v0, 4
        la $a0, operand
        syscall

        li $v0, 5
        syscall
        move $t0, $v0

        switch:
        case1:
        li $t1, 8
        bne $t0, $t1, case2
        
        li $v0, 4
        la $a0, case1_prom
        syscall

        j end_switch
        case2:
        li $t1, 4
        bne $t0, $t1, case3

        li $v0, 4
        la $a0, case2_prom
        syscall

        j end_switch
        case3:
        li $t1, 2
        bne $t0, $t1, default
        
        li $v0, 4
        la $a0, case3_prom
        syscall

        j end_switch
        default:

        li $v0, 4
        la $a0, default_prom
        syscall

        j end_switch
        end_switch:
        
        li $v0, 4
        la $a0, newline
        syscall

    exit:
    li $v0 10
    syscall