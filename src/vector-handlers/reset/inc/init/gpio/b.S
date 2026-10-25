@ 
@ B0, output, green LED
@ B13, AF, Ethernet
@ 

@ MODER
mov32   r0,   GPIOB_BASE
mov32   r1,   MODIFY_BITS(
                GPIOB_MODER_RESET_VALUE,
                GPIO_MODE_RESET << GPIO_MODER_0
                  | GPIO_MODE_RESET << GPIO_MODER_13,
                GPIO_MODE_OUTPUT << GPIO_MODER_0
                  | GPIO_MODE_AF << GPIO_MODER_13
              )
str     r1,   [r0, GPIO_MODER_OFFSET]

@ OSPEEDR
mov32   r1,   GPIOB_OSPEEDR_RESET_VALUE                   \
                | GPIO_SPEED_VERY_HIGH << GPIO_OSPEEDR13
str     r1,   [r0, GPIO_OSPEEDR_OFFSET]

@ PUPDR
mov   r1,   MODIFY_BITS(
              GPIOB_PUPDR_RESET_VALUE,
              GPIO_PUPD_RESERVED << GPIO_PUPDR13,
              GPIO_PUPD_NONE << GPIO_PUPDR13
            )
str   r1,   [r0, GPIO_PUPDR_OFFSET]

@ AFRH
mov   r1,   GPIO_AFR_AF11 << GPIO_AFRH_AFR13
str   r1,   [r0, GPIO_AFRH_OFFSET]
