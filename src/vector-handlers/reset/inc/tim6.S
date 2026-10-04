mov32   r0,   TIM6_BASE
mov     r1,   TIM_DIER_UIE_ENABLED
str     r1,   [r0, TIM_DIER]

mov     r1,   999
str     r1,   [r0, TIM_ARR]

mov     r1,   63999
str     r1,   [r0, TIM_PSC]

mov     r1,   TIM_EGR_UG_REINIT
str     r1,   [r0, TIM_EGR]

mov     r1,   TIM_CR1_CEN_ENABLED
str     r1,   [r0, TIM_CR1]
ldr     r1,   [r0, TIM_CR1]
