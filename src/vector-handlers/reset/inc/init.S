cpsid   i

mov32   r0,   SCB_VTOR
mov32   r1,   VECTOR_TABLE_ADDRESS
str     r1,   [r0]

mov32   r9,   0x20000000

mov     r1,   BUTTON_STATE_NONE
str     r1,   [r9, BUTTON_STATE]

#include "./init/rcc.S"

#include "./init/exti.S"
#include "./init/gpio.S"
#include "./init/nvic.S"
#include "./init/syscfg.S"
#include "./init/tim6.S"
#include "./init/tim7.S"

dsb
isb
cpsie   i
