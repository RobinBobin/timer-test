#include "macros.h"

@ Clock GPIOB, GPIOE
mov32   r0,   RCC_C1_AHB4ENR
mov     r1,   RCC_AHB4ENR_GPIOB_ENABLED | RCC_AHB4ENR_GPIOE_ENABLED
str     r1,   [r0]

@ Set GPIOB0 to output
mov32   r0,   GPIOB_MODER
mov     r1,   MODIFY_BITS(
                GPIOB_MODER_RESET_VALUE,
                GPIO_MODE_RESET,
                GPIO_MODE_OUTPUT,
                GPIO_MODER_0
              )
str     r1,   [r0]

@ Set GPIOE1 to output
mov32   r0,   GPIOE_MODER
mov     r1,   MODIFY_BITS(
                GPIO_MODER_RESET_VALUE,
                GPIO_MODE_RESET,
                GPIO_MODE_OUTPUT,
                GPIO_MODER_1
              )
str     r1,   [r0]
