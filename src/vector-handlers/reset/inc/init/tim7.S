mov32   r0,   TIM7_BASE

mov     r1,   TIM_DIER_UIE_ENABLED
str     r1,   [r0, TIM_DIER_OFFSET]

mov     r1,   49
str     r1,   [r0, TIM_ARR_OFFSET]

mov     r1,   TIM_PSC_1MS
str     r1,   [r0, TIM_PSC_OFFSET]
