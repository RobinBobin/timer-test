#define GPIO_PIN_ON   1

/* MODER */
#define GPIO_MODE_INPUT   0
#define GPIO_MODE_OUTPUT  1
#define GPIO_MODE_AF      2
#define GPIO_MODE_RESET   3

#define GPIO_MODER    0x00
#define GPIO_MODER_0  0
#define GPIO_MODER_1  2

#define GPIO_MODER_RESET_VALUE  0xFFFFFFFF

/* IDR */
#define GPIO_IDR    0x10
#define GPIO_IDR_0  0
#define GPIO_IDR_1  1

/* BSRR */
#define GPIO_BSRR         0x18
#define GPIO_BSRR_VALUE   1

#define GPIO_BSRR_BS_0  0
#define GPIO_BSRR_BS_1  1

#define GPIO_BSRR_BR_0  16
#define GPIO_BSRR_BR_1  17

/* GPIOB */
#define GPIOB_BASE  0x58020400

#define GPIOB_MODER               (GPIOB_BASE + GPIO_MODER)
#define GPIOB_MODER_RESET_VALUE   0xFFFFFEBF

#define GPIOB_IDR   (GPIOB_BASE + GPIO_IDR)
#define GPIOB_BSRR  (GPIOB_BASE + GPIO_BSRR)

/* GPIOE */
#define GPIOE_BASE    0x58021000
#define GPIOE_MODER   (GPIOE_BASE + GPIO_MODER)
#define GPIOE_IDR     (GPIOE_BASE + GPIO_IDR)
#define GPIOE_BSRR    (GPIOE_BASE + GPIO_BSRR)
