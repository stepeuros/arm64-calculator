.global _start
.section .data
prompt1: .asciz "Enter first number (0-9): "
prompt2: .asciz "Enter second number (0-9): "
msg:     .asciz "Result: "
newline: .asciz "\n"

.section .bss
num1: .space 1
num2: .space 1
res:  .space 1

.section .text
_start:
    // write prompt1
    mov x0, 1
    ldr x1, =prompt1
    ldr x2, =23
    mov x8, 64
    svc 0

    // read num1
    mov x0, 0
    ldr x1, =num1
    mov x2, 1
    mov x8, 63
    svc 0

    // convert ASCII to number
    ldrb w1, [x1]
    sub w1, w1, #'0'
    strb w1, [x1]

    // write prompt2
    mov x0, 1
    ldr x1, =prompt2
    ldr x2, =24
    mov x8, 64
    svc 0

    // read num2
    mov x0, 0
    ldr x1, =num2
    mov x2, 1
    mov x8, 63
    svc 0

    // convert ASCII to number
    ldrb w2, [x1]
    sub w2, w2, #'0'
    strb w2, [x1]

    // add numbers
    ldrb w1, [x1]  
    ldrb w0, [num1]
    add w0, w0, w1
    add w0, w0, #'0'
    strb w0, [res]

    // print msg
    mov x0, 1
    ldr x1, =msg
    ldr x2, =8
    mov x8, 64
    svc 0

    // print result
    mov x0, 1
    ldr x1, =res
    mov x2, 1
    mov x8, 64
    svc 0

    // print newline
    mov x0, 1
    ldr x1, =newline
    ldr x2, =1
    mov x8, 64
    svc 0

    // exit
    mov x0, 0
    mov x8, 93
    svc 0
