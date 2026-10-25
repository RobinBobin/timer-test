@ 
@ A1, AF, Ethernet
@ A2, AF, Ethernet
@ A7, AF, Ethernet
@ 

@ MODER
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

@ OSPEEDR
mov32   r1,   GPIOA_OSPEEDR_RESET_VALUE                   \
                | GPIO_SPEED_VERY_HIGH << GPIO_OSPEEDR1   \
                | GPIO_SPEED_VERY_HIGH << GPIO_OSPEEDR2   \
                | GPIO_SPEED_VERY_HIGH << GPIO_OSPEEDR7
str     r1,   [r0, GPIO_OSPEEDR_OFFSET]

@ PUPDR
mov   r1,   MODIFY_BITS(
              GPIOA_PUPDR_RESET_VALUE,
              GPIO_PUPD_RESERVED << GPIO_PUPDR1
                | GPIO_PUPD_RESERVED << GPIO_PUPDR2
                | GPIO_PUPD_RESERVED << GPIO_PUPDR7,
              GPIO_PUPD_NONE << GPIO_PUPDR1
                | GPIO_PUPD_NONE << GPIO_PUPDR2
                | GPIO_PUPD_NONE << GPIO_PUPDR7
            )
str   r1,   [r0, GPIO_PUPDR_OFFSET]

@ AFRL
mov32   r1,   GPIO_AFR_AF11 << GPIO_AFRL_AFR1       \
                | GPIO_AFR_AF11 << GPIO_AFRL_AFR2   \
                | GPIO_AFR_AF11 << GPIO_AFRL_AFR7
str     r1,   [r0, GPIO_AFRL_OFFSET]

