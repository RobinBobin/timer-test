.syntax unified

.global TIM6_DAC_Handler

#include "macros.s"
#include "registers.h"

.section .vector-handlers, "ax"
.thumb_func
TIM6_DAC_Handler:
  mov32   r0,   TIM6_SR
  ldr     r1,   [r0]
  bic     r1,   TIM_SR_UIF_PENDING
  str     r1,   [r0]

  ldr     r1,   [r0]
  dsb
  isb

  bx lr
