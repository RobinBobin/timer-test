#include "macros.h"

@ Set B0 to output (green LED)
mov32   r0,   GPIOB_MODER
mov     r1,   MODIFY_BITS(
                GPIOB_MODER_RESET_VALUE,
                GPIO_MODE_RESET,
                GPIO_MODE_OUTPUT,
                GPIO_MODER_0
              )
str     r1,   [r0]

@ Set C13 to input (blue button)
mov32   r0,   GPIOC_MODER
mov     r1,   MODIFY_BITS(
                GPIO_MODER_RESET_VALUE,
                GPIO_MODE_RESET,
                GPIO_MODE_INPUT,
                GPIO_MODER_13
              )
str     r1,   [r0]

@ Set E1 to output (yellow LED)
mov32   r0,   GPIOE_MODER
mov     r1,   MODIFY_BITS(
                GPIO_MODER_RESET_VALUE,
                GPIO_MODE_RESET,
                GPIO_MODE_OUTPUT,
                GPIO_MODER_1
              )
str     r1,   [r0]
