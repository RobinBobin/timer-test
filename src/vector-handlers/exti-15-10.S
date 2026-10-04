.syntax unified

.global EXTI15_10_Handler

#include "constants.h"
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

  tst     r1,   GPIO_PIN_ON << GPIO_IDR_13
  ite     eq
  moveq   r1,   BUTTON_STATE_RAW_UP
  movne   r1,   BUTTON_STATE_RAW_DOWN
  str     r1,   [r9, BUTTON_STATE]

  @ Start the timer
  mov32   r0,   TIM7_BASE

  mov     r1,   TIM_EGR_UG_REINIT
  str     r1,   [r0, TIM_EGR_OFFSET]

  mov     r1,   TIM7_CR1_VALUE
  str     r1,   [r0, TIM_CR1_OFFSET]

  @ Exit
  dsb
  isb

  bx lr
