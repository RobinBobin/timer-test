#define RCC_BASE 0x58024400

/* RCC_APB1LENR */
#define RCC_APB1LENR      (RCC_BASE + 0x0E8)
#define RCC_C1_APB1LENR   (RCC_BASE + 0x148)
#define RCC_C2_APB1LENR   (RCC_BASE + 0x1A8)

#define TIM6EN          4
#define TIM6EN_ENABLED  (1 << TIM6EN)
