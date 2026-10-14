mov32   r0,   RCC_BASE

@ Clock CSI
mov   r1,   RCC_CR_RESET_VALUE | RCC_CR_CSION
str   r1,   [r0, RCC_CR_OFFSET]

.rcc_csirdy:
  ldr   r1,   [r0, RCC_CR_OFFSET]
  tst   r1,   RCC_CR_CSIRDY
  beq   .rcc_csirdy

@ Clock SYSCFG
mov32   r1,   RCC_APB4ENR_RESET_VALUE | RCC_APB4ENR_SYSCFGEN
str     r1,   [r0, RCC_C1_APB4ENR_OFFSET]

@ Clock Ethernet
mov   r1,   RCC_AHB1ENR_ETH1RXEN        \
              | RCC_AHB1ENR_ETH1TXEN    \
              | RCC_AHB1ENR_ETH1MACEN
str   r1,   [r0, RCC_C1_AHB1ENR_OFFSET]

@ Clock GPIOA, GPIOB, GPIOC, GPIOE, GPIOG
mov   r1,   RCC_AHB4ENR_GPIOA_ENABLED       \
              | RCC_AHB4ENR_GPIOB_ENABLED   \
              | RCC_AHB4ENR_GPIOC_ENABLED   \
              | RCC_AHB4ENR_GPIOE_ENABLED   \
              | RCC_AHB4ENR_GPIOG_ENABLED
str   r1,   [r0, RCC_C1_AHB4ENR_OFFSET]

@ Wait
ldr   r1,   [r0, RCC_C1_AHB4ENR_OFFSET]
