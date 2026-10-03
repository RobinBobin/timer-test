#define GPIO_BSRR_BS_0  0
#define GPIO_BSRR_BR_0  16
#define GPIO_BSRR_VALUE 1

#define GPIO_IDR_0    0
#define GPIO_PIN_ON   1

#define GPIO_MODE_INPUT   0
#define GPIO_MODE_OUTPUT  1
#define GPIO_MODE_AF      2
#define GPIO_MODE_RESET   3

#define GPIO_MODER_0  0

/* GPIOB */
#define GPIOB_BASE    0x58020400

#define GPIOB_MODER               (GPIOB_BASE + 0x00)
#define GPIOB_MODER_RESET_VALUE   0xFFFFFEBF

#define GPIOB_IDR   (GPIOB_BASE + 0x10)
#define GPIOB_BSRR  (GPIOB_BASE + 0x18)
