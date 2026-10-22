mov32   r0,   RCC_BASE


@ Clock HSE and CSI
mov32   r1,   RCC_CR_RESET_VALUE  \
                | RCC_CR_HSEBYP   \
                | RCC_CR_HSEON    \
                | RCC_CR_CSION
str     r1,   [r0, RCC_CR_OFFSET]

.rcc_cr_rdy:
  ldr     r1,   [r0, RCC_CR_OFFSET]
  mov32   r2,   RCC_CR_HSERDY | RCC_CR_CSIRDY
  tst     r1,   r2
  beq     .rcc_cr_rdy


@ Configure MCO2 and SW
mov32   r1,   RCC_CFGR_MCO2SEL_SYS_CK   \
                | RCC_CFGR_MCO2PRE_15   \
                | RCC_CFGR_SW_HSE_CK
str     r1,   [r0,  RCC_CFGR_OFFSET]

.rcc_sws:
  ldr   r1,   [r0, RCC_CFGR_OFFSET]
  lsr   r1,   RCC_CFGR_SWS_OFFSET
  and   r1,   RCC_CFGR_SWS_MASK
  cmp   r1,   RCC_CFGR_SW_HSE_CK
  bne   .rcc_sws


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
