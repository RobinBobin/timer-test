mov32   r0,   RCC_BASE


@ Clock HSE and CSI
mov32   r1,   RCC_CR_RESET_VALUE  \
                | RCC_CR_HSEBYP   \
                | RCC_CR_HSEON    \
                | RCC_CR_CSION
str     r1,   [r0, RCC_CR_OFFSET]
mov32   r2,   RCC_CR_HSERDY | RCC_CR_CSIRDY
bl      .rcc_cr_rdy


@ Setup PLL1
mov   r1,   RCC_PLLCKSELR_DIVM1_1 | RCC_PLLCKSELR_PLLSRC_HSE_CK
str   r1,   [r0, RCC_PLLCKSELR_OFFSET]

mov32   r1,   RCC_PLLCFGR_DIVP1EN           \
                | RCC_PLLCFGR_PLL1RGE_8_16  \
                | RCC_PLLCFGR_PLL1VCOSEL_H
str     r1,   [r0, RCC_PLLCFGR_OFFSET]

mov   r1,   RCC_PLL1DIVR_DIVN1_98 | RCC_PLL1DIVR_DIVP1_2
str   r1,   [r0, RCC_PLL1DIVR_OFFSET]


@ Clock PLL1
ldr   r1,   [r0, RCC_CR_OFFSET]
orr   r1,   RCC_CR_PLL1ON
str   r1,   [r0, RCC_CR_OFFSET]
mov   r2,   RCC_CR_PLL1RDY
bl    .rcc_cr_rdy


@ Set HPRE
mov   r1,   RCC_D1CFGR_HPRE_2
str   r1,   [r0, RCC_D1CFGR_OFFSET]


@ Configure MCO2 and SW
mov32   r1,   RCC_CFGR_MCO2SEL_PLL1_P_CK  \
                | RCC_CFGR_MCO2PRE_15     \
                | RCC_CFGR_SW_PLL1_P_CK
str     r1,   [r0,  RCC_CFGR_OFFSET]

.rcc_sws:
  ldr   r1,   [r0, RCC_CFGR_OFFSET]
  and   r1,   RCC_CFGR_SWS_PLL1_P_CK
  cmp   r1,   RCC_CFGR_SWS_PLL1_P_CK
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
b     .rcc_end


.rcc_cr_rdy:
  ldr   r1,   [r0, RCC_CR_OFFSET]
  and   r1,   r2
  cmp   r1,   r2
  bne   .rcc_cr_rdy
  bx    lr


.rcc_end:
