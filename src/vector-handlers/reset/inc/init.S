cpsid   i

@ Init SCB_VTOR
mov32   r0,   SCB_VTOR
mov32   r1,   VECTOR_TABLE_ADDRESS
str     r1,   [r0]

@ Store variable buffer address
mov32   r9,   0x20000000

@ Init button state
mov     r1,   BUTTON_STATE_NONE
str     r1,   [r9, BUTTON_STATE]

@ Init led mode
mov     r1,   LED_MODE_OFF
str     r1,   [r9, LED_MODE]

@ Init state flags
mov     r1,   STATE_FLAG_OFF
str     r1,   [r9, STATE_FLAG_BUTTON_STATE]
str     r1,   [r9, STATE_FLAG_TIM7]

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
