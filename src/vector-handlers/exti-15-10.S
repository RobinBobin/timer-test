.syntax unified

.global EXTI15_10_Handler

#include "macros.s"
#include "registers.h"
#include "variables.S"

.section .vector-handlers, "ax"
.thumb_func
EXTI15_10_Handler:
  @ Reset the interrupt
  mov32   r0,   EXTI_C1PR1
  mov     r1,   EXTI_CnPR1_PR13
  str     r1,   [r0]

  @ Save the button state
  mov32   r0,   GPIOC_IDR
  ldr     r1,   [r0]
  ubfx    r1,   r1,   GPIO_IDR_13,  1
  str     r1,   [r9, BUTTON_STATE]

  @ Set STATE_FLAG_BUTTON_STATE
  mov     r1,   STATE_FLAG_ON
  str     r1,   [r9, STATE_FLAG_BUTTON_STATE]

  @ Exit
  dsb
  isb

  bx lr
