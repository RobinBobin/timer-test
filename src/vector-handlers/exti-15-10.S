.syntax unified

.global EXTI15_10_Handler

#include "macros.s"
#include "registers.h"

.section .vector-handlers, "ax"
.thumb_func
EXTI15_10_Handler:
  mov32   r0,   EXTI_C1PR1
  mov     r1,   EXTI_CnPR1_PR13
  str     r1,   [r0]

  @ Exit
  dsb
  isb

  bx lr
