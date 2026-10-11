@ 
@ G11, AF, Ethernet
@ G13, AF, Ethernet
@ 

@ Moder
mov32   r0,   GPIOG_BASE
mov     r1,   MODIFY_BITS(
                GPIO_MODER_RESET_VALUE,
                GPIO_MODE_RESET << GPIO_MODER_11
                  | GPIO_MODE_RESET << GPIO_MODER_13,
                GPIO_MODE_AF << GPIO_MODER_11
                  | GPIO_MODE_AF << GPIO_MODER_13
              )
str     r1,   [r0, GPIO_MODER_OFFSET]

@ OSPEEDR
mov   r1,   GPIO_SPEED_HIGH << GPIO_OSPEEDR11       \
              | GPIO_SPEED_HIGH << GPIO_OSPEEDR13
str   r1,   [r0, GPIO_OSPEEDR_OFFSET]

@ AFRH
mov32   r1,   GPIO_AFR_AF11 << GPIO_AFRH_AFR11      \
                | GPIO_AFR_AF11 << GPIO_AFRH_AFR13
str     r1,   [r0, GPIO_AFRH_OFFSET]
