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

  @ Manage the button state
  ldr     r2,   [r9, BUTTON_STATE]

  mov32   r0,   GPIOC_IDR
  ldr     r1,   [r0]
  ubfx    r1,   r1,   GPIO_IDR_13,  1

  cmp     r1,   r2
  ite     eq
  addeq   r2,   2
  movne   r2,   BUTTON_STATE_NONE
  str     r2,   [r9, BUTTON_STATE]

  @ Exit
  dsb
  isb

  bx lr
