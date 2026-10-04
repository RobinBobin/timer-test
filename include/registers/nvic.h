#include "./scb.h"

#define NVIC_INTERRUPT_DISABLED 0
#define NVIC_INTERRUPT_ENABLED  1

/* ISERx */
#define NVIC_ISER0_OFFSET   0x100
#define NVIC_ISER1_OFFSET   0x104

#define NVIC_ISER0  (SCB_BASE + NVIC_ISER0_OFFSET)
#define NVIC_ISER1  (SCB_BASE + NVIC_ISER1_OFFSET)

#define NVIC_ISER_SETENA_0    (1 << 0)
#define NVIC_ISER_SETENA_1    (1 << 1)
#define NVIC_ISER_SETENA_2    (1 << 2)
#define NVIC_ISER_SETENA_3    (1 << 3)
#define NVIC_ISER_SETENA_4    (1 << 4)
#define NVIC_ISER_SETENA_5    (1 << 5)
#define NVIC_ISER_SETENA_6    (1 << 6)
#define NVIC_ISER_SETENA_7    (1 << 7)
#define NVIC_ISER_SETENA_8    (1 << 8)
#define NVIC_ISER_SETENA_9    (1 << 9)
#define NVIC_ISER_SETENA_10   (1 << 10)
#define NVIC_ISER_SETENA_11   (1 << 11)
#define NVIC_ISER_SETENA_12   (1 << 12)
#define NVIC_ISER_SETENA_13   (1 << 13)
#define NVIC_ISER_SETENA_14   (1 << 14)
#define NVIC_ISER_SETENA_15   (1 << 15)
#define NVIC_ISER_SETENA_16   (1 << 16)
#define NVIC_ISER_SETENA_17   (1 << 17)
#define NVIC_ISER_SETENA_18   (1 << 18)
#define NVIC_ISER_SETENA_19   (1 << 19)
#define NVIC_ISER_SETENA_20   (1 << 20)
#define NVIC_ISER_SETENA_21   (1 << 21)
#define NVIC_ISER_SETENA_22   (1 << 22)
#define NVIC_ISER_SETENA_23   (1 << 23)
#define NVIC_ISER_SETENA_24   (1 << 24)
#define NVIC_ISER_SETENA_25   (1 << 25)
#define NVIC_ISER_SETENA_26   (1 << 26)
#define NVIC_ISER_SETENA_27   (1 << 27)
#define NVIC_ISER_SETENA_28   (1 << 28)
#define NVIC_ISER_SETENA_29   (1 << 29)
#define NVIC_ISER_SETENA_30   (1 << 30)
#define NVIC_ISER_SETENA_31   (1 << 31)
