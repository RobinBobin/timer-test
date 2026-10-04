@ Clock GPIOB, GPIOC, GPIOE
mov32   r0,   RCC_C1_AHB4ENR
mov     r1,   (                               \
                RCC_AHB4ENR_GPIOB_ENABLED     \
                | RCC_AHB4ENR_GPIOC_ENABLED   \
                | RCC_AHB4ENR_GPIOE_ENABLED   \
              )
str     r1,   [r0]

@ Clock SYSCFG
mov32   r0,   RCC_C1_APB4ENR
mov32   r1,   RCC_APB4ENR_RESET_VALUE | RCC_APB4ENR_SYSCFG_ENABLED
str     r1,   [r0]
ldr     r1,   [r0]

@ Clock TIM6
mov32   r0,   RCC_C1_APB1LENR
mov     r1,   RCC_APB1LENR_TIM6_ENABLED
str     r1,   [r0]
ldr     r1,   [r0]
