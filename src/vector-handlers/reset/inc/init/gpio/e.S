@ 
@ E1, output, yellow LED
@ 

mov32   r0,   GPIOE_BASE
mov     r1,   MODIFY_BITS( 
                GPIO_MODER_RESET_VALUE,
                GPIO_MODE_RESET << GPIO_MODER_1,
                GPIO_MODE_OUTPUT << GPIO_MODER_1
              )
str     r1,   [r0, GPIO_MODER_OFFSET]
