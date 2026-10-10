@ 
@ B0, output, green LED
@ B13, AF, Ethernet
@ 

mov32   r0,   GPIOB_BASE
mov32   r1,   MODIFY_BITS(
                GPIOB_MODER_RESET_VALUE,
                GPIO_MODE_RESET << GPIO_MODER_0
                  | GPIO_MODE_RESET << GPIO_MODER_13,
                GPIO_MODE_OUTPUT << GPIO_MODER_0
                  | GPIO_MODE_AF << GPIO_MODER_13
              )
str     r1,   [r0, GPIO_MODER_OFFSET]
