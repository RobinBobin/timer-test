@ Clock GPIOA, GPIOB, GPIOC, GPIOE, GPIOG
mov32   r0,   RCC_C1_AHB4ENR
mov     r1,   (                               \
                RCC_AHB4ENR_GPIOA_ENABLED     \
                | RCC_AHB4ENR_GPIOB_ENABLED   \
                | RCC_AHB4ENR_GPIOC_ENABLED   \
                | RCC_AHB4ENR_GPIOE_ENABLED   \
                | RCC_AHB4ENR_GPIOG_ENABLED   \
              )
str     r1,   [r0]
