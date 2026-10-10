@ 
@ C1, AF, Ethernet
@ C4, AF, Ethernet
@ C5, AF, Ethernet
@ C13, input, blue button
@ 

mov32   r0,   GPIOC_BASE
mov32   r1,   MODIFY_BITS(
                GPIO_MODER_RESET_VALUE,
                GPIO_MODE_RESET << GPIO_MODER_1
                  | GPIO_MODE_RESET << GPIO_MODER_4
                  | GPIO_MODE_RESET << GPIO_MODER_5
                  | GPIO_MODE_RESET << GPIO_MODER_13,
                GPIO_MODE_AF << GPIO_MODER_1
                  | GPIO_MODE_AF << GPIO_MODER_4
                  | GPIO_MODE_AF << GPIO_MODER_5
                  | GPIO_MODE_INPUT << GPIO_MODER_13
              )
str     r1,   [r0, GPIO_MODER_OFFSET]
