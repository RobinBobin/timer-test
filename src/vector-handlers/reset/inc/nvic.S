@ Enable TIM6_DAC, EXTI15_10
mov32   r0,   NVIC_ISER1
mov32   r1,   NVIC_ISER_SETENA_8 | NVIC_ISER_SETENA_22
str     r1,   [r0]
