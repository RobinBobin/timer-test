#define RCC_BASE 0x58024400

///////////////////////////////////////////////////////////////////////////////

/* RCC_CR */
#define RCC_CR_OFFSET   0x000
#define RCC_CR          (RCC_BASE + RCC_CR_OFFSET)

#define RCC_CR_RESET_VALUE  0x00000001

/* RCC_CR_PLL1RDY */
#define RCC_CR_PLL1RDY_OFFSET   25
#define RCC_CR_PLL1RDY          (1 << RCC_CR_PLL1RDY_OFFSET)

/* RCC_CR_PLL1ON */
#define RCC_CR_PLL1ON_OFFSET  24
#define RCC_CR_PLL1ON         (1 << RCC_CR_PLL1ON_OFFSET)

/* RCC_CR_HSEBYP */
#define RCC_CR_HSEBYP_OFFSET  18
#define RCC_CR_HSEBYP         (1 << RCC_CR_HSEBYP_OFFSET)

/* RCC_CR_HSERDY */
#define RCC_CR_HSERDY_OFFSET  17
#define RCC_CR_HSERDY         (1 << RCC_CR_HSERDY_OFFSET)

/* RCC_CR_HSEON */
#define RCC_CR_HSEON_OFFSET   16
#define RCC_CR_HSEON          (1 << RCC_CR_HSEON_OFFSET)

/* RCC_CR_CSIRDY */
#define RCC_CR_CSIRDY_OFFSET  8
#define RCC_CR_CSIRDY         (1 << RCC_CR_CSIRDY_OFFSET)

/* RCC_CR_CSION */
#define RCC_CR_CSION_OFFSET   7
#define RCC_CR_CSION          (1 << RCC_CR_CSION_OFFSET)

///////////////////////////////////////////////////////////////////////////////

/* RCC_CFGR */
#define RCC_CFGR_OFFSET   0x010
#define RCC_CFGR          (RCC_BASE + RCC_CFGR_OFFSET)

/* RCC_CFGR_MCO2SEL */
#define RCC_CFGR_MCO2SEL_OFFSET   29

#define RCC_CFGR_MCO2SEL_SYS_CK     (0 << RCC_CFGR_MCO2SEL_OFFSET)
#define RCC_CFGR_MCO2SEL_PLL2_P_CK  (1 << RCC_CFGR_MCO2SEL_OFFSET)
#define RCC_CFGR_MCO2SEL_HSE_CK     (2 << RCC_CFGR_MCO2SEL_OFFSET)
#define RCC_CFGR_MCO2SEL_PLL1_P_CK  (3 << RCC_CFGR_MCO2SEL_OFFSET)
#define RCC_CFGR_MCO2SEL_CSI_CK     (4 << RCC_CFGR_MCO2SEL_OFFSET)
#define RCC_CFGR_MCO2SEL_LSI_CK     (5 << RCC_CFGR_MCO2SEL_OFFSET)

/* RCC_CFGR_MCO2PRE */
#define RCC_CFGR_MCO2PRE_OFFSET   25

#define RCC_CFGR_MCO2PRE_DISABLED   (0    <<  RCC_CFGR_MCO2PRE_OFFSET)
#define RCC_CFGR_MCO2PRE_1          (1    <<  RCC_CFGR_MCO2PRE_OFFSET)
#define RCC_CFGR_MCO2PRE_2          (2    <<  RCC_CFGR_MCO2PRE_OFFSET)
#define RCC_CFGR_MCO2PRE_3          (3    <<  RCC_CFGR_MCO2PRE_OFFSET)
#define RCC_CFGR_MCO2PRE_4          (4    <<  RCC_CFGR_MCO2PRE_OFFSET)
#define RCC_CFGR_MCO2PRE_5          (5    <<  RCC_CFGR_MCO2PRE_OFFSET)
#define RCC_CFGR_MCO2PRE_6          (6    <<  RCC_CFGR_MCO2PRE_OFFSET)
#define RCC_CFGR_MCO2PRE_7          (7    <<  RCC_CFGR_MCO2PRE_OFFSET)
#define RCC_CFGR_MCO2PRE_8          (8    <<  RCC_CFGR_MCO2PRE_OFFSET)
#define RCC_CFGR_MCO2PRE_9          (9    <<  RCC_CFGR_MCO2PRE_OFFSET)
#define RCC_CFGR_MCO2PRE_10         (10   <<  RCC_CFGR_MCO2PRE_OFFSET)
#define RCC_CFGR_MCO2PRE_11         (11   <<  RCC_CFGR_MCO2PRE_OFFSET)
#define RCC_CFGR_MCO2PRE_12         (12   <<  RCC_CFGR_MCO2PRE_OFFSET)
#define RCC_CFGR_MCO2PRE_13         (13   <<  RCC_CFGR_MCO2PRE_OFFSET)
#define RCC_CFGR_MCO2PRE_14         (14   <<  RCC_CFGR_MCO2PRE_OFFSET)
#define RCC_CFGR_MCO2PRE_15         (15   <<  RCC_CFGR_MCO2PRE_OFFSET)

/* RCC_CFGR_MCO1SEL */
#define RCC_CFGR_MCO1SEL_OFFSET   22

#define RCC_CFGR_MCO1SEL_HSI_CK     (0 << RCC_CFGR_MCO1SEL_OFFSET)
#define RCC_CFGR_MCO1SEL_LSE_CK     (1 << RCC_CFGR_MCO1SEL_OFFSET)
#define RCC_CFGR_MCO1SEL_HSE_CK     (2 << RCC_CFGR_MCO1SEL_OFFSET)
#define RCC_CFGR_MCO1SEL_PLL1_Q_CK  (3 << RCC_CFGR_MCO1SEL_OFFSET)
#define RCC_CFGR_MCO1SEL_HSI48_CK   (4 << RCC_CFGR_MCO1SEL_OFFSET)

/* RCC_CFGR_MCO1PRE */
#define RCC_CFGR_MCO1PRE_OFFSET   18

#define RCC_CFGR_MCO1PRE_DISABLED   (0    <<  RCC_CFGR_MCO1PRE_OFFSET)
#define RCC_CFGR_MCO1PRE_1          (1    <<  RCC_CFGR_MCO1PRE_OFFSET)
#define RCC_CFGR_MCO1PRE_2          (2    <<  RCC_CFGR_MCO1PRE_OFFSET)
#define RCC_CFGR_MCO1PRE_3          (3    <<  RCC_CFGR_MCO1PRE_OFFSET)
#define RCC_CFGR_MCO1PRE_4          (4    <<  RCC_CFGR_MCO1PRE_OFFSET)
#define RCC_CFGR_MCO1PRE_5          (5    <<  RCC_CFGR_MCO1PRE_OFFSET)
#define RCC_CFGR_MCO1PRE_6          (6    <<  RCC_CFGR_MCO1PRE_OFFSET)
#define RCC_CFGR_MCO1PRE_7          (7    <<  RCC_CFGR_MCO1PRE_OFFSET)
#define RCC_CFGR_MCO1PRE_8          (8    <<  RCC_CFGR_MCO1PRE_OFFSET)
#define RCC_CFGR_MCO1PRE_9          (9    <<  RCC_CFGR_MCO1PRE_OFFSET)
#define RCC_CFGR_MCO1PRE_10         (10   <<  RCC_CFGR_MCO1PRE_OFFSET)
#define RCC_CFGR_MCO1PRE_11         (11   <<  RCC_CFGR_MCO1PRE_OFFSET)
#define RCC_CFGR_MCO1PRE_12         (12   <<  RCC_CFGR_MCO1PRE_OFFSET)
#define RCC_CFGR_MCO1PRE_13         (13   <<  RCC_CFGR_MCO1PRE_OFFSET)
#define RCC_CFGR_MCO1PRE_14         (14   <<  RCC_CFGR_MCO1PRE_OFFSET)
#define RCC_CFGR_MCO1PRE_15         (15   <<  RCC_CFGR_MCO1PRE_OFFSET)

/* RCC_CFGR_SWS */
#define RCC_CFGR_SWS_OFFSET   3

#define RCC_CFGR_SWS_HSI_CK     (0 << RCC_CFGR_SWS_OFFSET)
#define RCC_CFGR_SWS_CSI_CK     (1 << RCC_CFGR_SWS_OFFSET)
#define RCC_CFGR_SWS_HSE_CK     (2 << RCC_CFGR_SWS_OFFSET)
#define RCC_CFGR_SWS_PLL1_P_CK  (3 << RCC_CFGR_SWS_OFFSET)


/* RCC_CFGR_SW */
#define RCC_CFGR_SW_OFFSET  0

#define RCC_CFGR_SW_HSI_CK      (0 << RCC_CFGR_SW_OFFSET)
#define RCC_CFGR_SW_CSI_CK      (1 << RCC_CFGR_SW_OFFSET)
#define RCC_CFGR_SW_HSE_CK      (2 << RCC_CFGR_SW_OFFSET)
#define RCC_CFGR_SW_PLL1_P_CK   (3 << RCC_CFGR_SW_OFFSET)

/* RCC_CFGR_PACK */
#define RCC_CFGR_PACK(MCO2SEL, MCO2PRE, MCO1SEL, MCO1PRE, SW)   \
  (                                                             \
    (MCO2SEL)       \
      | (MCO2PRE)   \
      | (MCO1SEL)   \
      | (MCO1PRE)   \
      | (SW)        \
  )

///////////////////////////////////////////////////////////////////////////////

#include "rcc/pllckselr.h"

///////////////////////////////////////////////////////////////////////////////

#include "rcc/pllcfgr.h"

///////////////////////////////////////////////////////////////////////////////

#include "rcc/pll1divr.h"

///////////////////////////////////////////////////////////////////////////////

/* RCC_AHB1ENR */
#define RCC_AHB1ENR_OFFSET      0x0D8
#define RCC_C1_AHB1ENR_OFFSET   0x138
#define RCC_C2_AHB1ENR_OFFSET   0x198

/* RCC_AHB1ENR_ETH1RXEN */
#define RCC_AHB1ENR_ETH1RXEN  (1 << 17)

/* RCC_AHB1ENR_ETH1TXEN */
#define RCC_AHB1ENR_ETH1TXEN  (1 << 16)

/* RCC_AHB1ENR_ETH1MACEN */
#define RCC_AHB1ENR_ETH1MACEN   (1 << 15)

///////////////////////////////////////////////////////////////////////////////

/* RCC_AHB4ENR */
#define RCC_AHB4ENR_OFFSET      0x0E0
#define RCC_C1_AHB4ENR_OFFSET   0x140
#define RCC_C2_AHB4ENR_OFFSET   0x1A0

#define RCC_AHB4ENR       (RCC_BASE + RCC_AHB4ENR_OFFSET)
#define RCC_C1_AHB4ENR    (RCC_BASE + RCC_C1_AHB4ENR_OFFSET)
#define RCC_C2_AHB4ENR    (RCC_BASE + RCC_C2_AHB4ENR_OFFSET)

#define RCC_AHB4ENR_GPIOA_ENABLED   (1 << 0)
#define RCC_AHB4ENR_GPIOB_ENABLED   (1 << 1)
#define RCC_AHB4ENR_GPIOC_ENABLED   (1 << 2)
#define RCC_AHB4ENR_GPIOD_ENABLED   (1 << 3)
#define RCC_AHB4ENR_GPIOE_ENABLED   (1 << 4)
#define RCC_AHB4ENR_GPIOF_ENABLED   (1 << 5)
#define RCC_AHB4ENR_GPIOG_ENABLED   (1 << 6)

///////////////////////////////////////////////////////////////////////////////

/* RCC_APB1LENR */
#define RCC_APB1LENR      (RCC_BASE + 0x0E8)
#define RCC_C1_APB1LENR   (RCC_BASE + 0x148)
#define RCC_C2_APB1LENR   (RCC_BASE + 0x1A8)

#define RCC_APB1LENR_TIM6_ENABLED   (1 << 4)
#define RCC_APB1LENR_TIM7_ENABLED   (1 << 5)

///////////////////////////////////////////////////////////////////////////////

/* RCC_APB4ENR */
#define RCC_APB4ENR_OFFSET      0x0F4
#define RCC_C1_APB4ENR_OFFSET   0x154
#define RCC_C2_APB4ENR_OFFSET   0x1B4

#define RCC_APB4ENR     (RCC_BASE + RCC_APB4ENR_OFFSET)
#define RCC_C1_APB4ENR  (RCC_BASE + RCC_C1_APB4ENR_OFFSET)
#define RCC_C2_APB4ENR  (RCC_BASE + RCC_C2_APB4ENR_OFFSET)

#define RCC_APB4ENR_RESET_VALUE   0x00010000

#define RCC_APB4ENR_SYSCFGEN  (1 << 1)
