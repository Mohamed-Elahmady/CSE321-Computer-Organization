.data
    Name_prop: .asciiz "Name : "
    ID_prop: .asciiz "ID : "
    Course_prop: .asciiz "Couse : "

    Name: .asciiz "Mohammed Gharieb Mohammed Elahmady"
    ID: .asciiz "20812022100144"
    Course: .asciiz "CSE321-Computer-Organization"
    
    New_Line_prop: .asciiz "\n"
.text
    main:
    
    li $v0, 4
    la $a0, Name_prop
    syscall

    li $v0, 4
    la $a0, Name
    syscall

    li $v0, 4
    la $a0, New_Line_prop
    syscall
    
    li $v0, 4
    la $a0, ID_prop
    syscall

    li $v0, 4
    la $a0, ID
    syscall

    li $v0, 4
    la $a0, New_Line_prop
    syscall

    li $v0, 4
    la $a0, Course_prop
    syscall

    li $v0, 4
    la $a0, Course
    syscall

    li $v0, 4
    la $a0, New_Line_prop
    syscall

    exit:
        li $v0, 10
        syscall