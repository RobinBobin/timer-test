@ Clock GPIOB
mov32   r0,   RCC_C1_AHB4ENR
mov     r1,   GPIOBEN_ENABLED
str     r1,   [r0]

@ Set GPIOB0 to output
mov32   r0,   GPIOB_MODER
mov32   r1,   GPIOB_MODER_RESET_VALUE - GPIO_MODE_RESET + GPIO_MODE_OUTPUT
str     r1,   [r0]
