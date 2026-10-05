.syntax unified

.global TIM6_DAC_Handler

#include "macros.s"
#include "registers.h"
#include "variables.S"

.section .vector-handlers, "ax"
.thumb_func
TIM6_DAC_Handler:
  @ Reset the interrupt
  mov32   r0,   TIM6_SR
  mov     r1,   TIM_SR_UIF_CLEARED
  str     r1,   [r0]

  @ Set STATE_FLAG_TIM6
  mov     r1,   STATE_FLAG_ON
  str     r1,   [r9, STATE_FLAG_TIM6]

  @ Exit
  dsb
  isb

  bx lr
