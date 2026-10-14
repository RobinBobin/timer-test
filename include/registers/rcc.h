#define RCC_BASE 0x58024400

///////////////////////////////////////////////////////////////////////////////

/* RCC_CR */
#define RCC_CR_OFFSET 0x000

#define RCC_CR_RESET_VALUE  0x00000001

#define RCC_CR_CSION    (1 << 7)
#define RCC_CR_CSIRDY   (1 << 8)

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
