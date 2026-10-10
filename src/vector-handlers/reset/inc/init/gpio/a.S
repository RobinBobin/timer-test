@ 
@ A1, AF, Ethernet
@ A2, AF, Ethernet
@ A7, AF, Ethernet
@ 

mov32   r0,   GPIOA_BASE
mov32   r1,   MODIFY_BITS(
                GPIOA_MODER_RESET_VALUE,
                GPIO_MODE_RESET << GPIO_MODER_1
                  | GPIO_MODE_RESET << GPIO_MODER_2
                  | GPIO_MODE_RESET << GPIO_MODER_7,
                GPIO_MODE_AF << GPIO_MODER_1
                  | GPIO_MODE_AF << GPIO_MODER_2
                  | GPIO_MODE_AF << GPIO_MODER_7
              )
str     r1,   [r0, GPIO_MODER_OFFSET]
