.syntax unified

.global TIM7_Handler

#include "constants.h"
#include "macros.s"
#include "registers.h"
#include "variables.S"

.section .vector-handlers, "ax"
.thumb_func
TIM7_Handler:
  mov32   r0,   TIM7_BASE

  @ Reset the interrupt
  mov     r1,   TIM_SR_UIF_CLEARED
  str     r1,   [r0, TIM_SR_OFFSET]

  @ Stop the timer
  mov     r1,   TIM7_CR1_VALUE & ~TIM_CR1_CEN_ENABLED
  str     r1,   [r0, TIM_CR1_OFFSET]

  @ Set the state flag
  mov     r1,   STATE_FLAG_ON
  str     r1,   [r9, STATE_FLAG_TIM7]

  @ Exit
  dsb
  isb

  bx lr
