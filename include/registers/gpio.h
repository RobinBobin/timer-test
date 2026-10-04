#define GPIO_PIN_ON   1

/* MODER */
#define GPIO_MODE_INPUT   0
#define GPIO_MODE_OUTPUT  1
#define GPIO_MODE_AF      2
#define GPIO_MODE_RESET   3

#define GPIO_MODER  0x00

#define GPIO_MODER_0    0
#define GPIO_MODER_1    2
#define GPIO_MODER_2    4
#define GPIO_MODER_3    6
#define GPIO_MODER_4    8
#define GPIO_MODER_5    10
#define GPIO_MODER_6    12
#define GPIO_MODER_7    14
#define GPIO_MODER_8    16
#define GPIO_MODER_9    18
#define GPIO_MODER_10   20
#define GPIO_MODER_11   22
#define GPIO_MODER_12   24
#define GPIO_MODER_13   26
#define GPIO_MODER_14   28
#define GPIO_MODER_15   30

#define GPIO_MODER_RESET_VALUE  0xFFFFFFFF

/* IDR */
#define GPIO_IDR    0x10

#define GPIO_IDR_0    0
#define GPIO_IDR_1    1
#define GPIO_IDR_2    2
#define GPIO_IDR_3    3
#define GPIO_IDR_4    4
#define GPIO_IDR_5    5
#define GPIO_IDR_6    6
#define GPIO_IDR_7    7
#define GPIO_IDR_8    8
#define GPIO_IDR_9    9
#define GPIO_IDR_10   10
#define GPIO_IDR_11   11
#define GPIO_IDR_12   12
#define GPIO_IDR_13   13
#define GPIO_IDR_14   14
#define GPIO_IDR_15   15

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

/* GPIOC */
#define GPIOC_BASE    0x58020800
#define GPIOC_MODER   (GPIOC_BASE + GPIO_MODER)
#define GPIOC_IDR     (GPIOC_BASE + GPIO_IDR)
#define GPIOC_BSRR    (GPIOC_BASE + GPIO_BSRR)

/* GPIOE */
#define GPIOE_BASE    0x58021000
#define GPIOE_MODER   (GPIOE_BASE + GPIO_MODER)
#define GPIOE_IDR     (GPIOE_BASE + GPIO_IDR)
#define GPIOE_BSRR    (GPIOE_BASE + GPIO_BSRR)
