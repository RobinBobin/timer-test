.syntax unified

.global TIM6_DAC_Handler

#include "macros.s"
#include "registers.h"

.section .vector-handlers, "ax"
.thumb_func
TIM6_DAC_Handler:
  @ Reset UIF
  mov32   r0,   TIM6_SR
  mov32   r1,   TIM_SR_UIF_CLEARED
  str     r1,   [r0]
  ldr     r1,   [r0]

  @ Toggle GPIOB0
  mov32   r0,   GPIOB_IDR
  ldr     r1,   [r0]
  and     r1,   1 << GPIO_IDR_0

  cmp     r1,   0
  ite     eq
  moveq   r1,   GPIO_BSRR_BS_0
  movne   r1,   GPIO_BSRR_BR_0

  mov     r2,   GPIO_BSRR_VALUE
  lsl     r1,   r2,  r1

  mov32   r0,   GPIOB_BSRR
  str     r1,   [r0]

  @ Exit
  dsb
  isb

  bx lr
