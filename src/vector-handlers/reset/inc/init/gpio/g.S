@ 
@ G11, AF, Ethernet
@ G13, AF, Ethernet
@ 

mov32   r0,   GPIOG_BASE
mov     r1,   MODIFY_BITS(
                GPIO_MODER_RESET_VALUE,
                GPIO_MODE_RESET << GPIO_MODER_11
                  | GPIO_MODE_RESET << GPIO_MODER_13,
                GPIO_MODE_AF << GPIO_MODER_11
                  | GPIO_MODE_AF << GPIO_MODER_13
              )
str     r1,   [r0, GPIO_MODER_OFFSET]
