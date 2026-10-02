#define TIM_CR1_CEN           0
#define TIM_CR1_CEN_ENABLED   (1 << TIM_CR1_CEN)
#define TIM_EGR_UG            0
#define TIM_EGR_UG_REINIT     (1 << TIM_EGR_UG)
#define TIM_DIER_UIE          0
#define TIM_DIER_UIE_ENABLED  (1 << TIM_DIER_UIE)
#define TIM_SR_UIF            0
#define TIM_SR_UIF_PENDING    (1 << TIM_SR_UIF)

// TIM6
#define TIM6_BASE   0x40001000
#define TIM6_CR1    (TIM6_BASE + 0x00)
#define TIM6_DIER   (TIM6_BASE + 0x0C)
#define TIM6_SR     (TIM6_BASE + 0x10)
#define TIM6_EGR    (TIM6_BASE + 0x14)
#define TIM6_PSC    (TIM6_BASE + 0x28)
#define TIM6_ARR    (TIM6_BASE + 0x2C)
