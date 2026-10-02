.syntax unified

.global Reset_Handler

#include "macros.s"
#include "registers.h"

.section .vector-handlers, "ax"
.thumb_func
Reset_Handler:
  @ bkpt #42

  @ Start TIM6
  mov32   r0,   RCC_APB1LENR
  mov     r1,   TIM6EN_ENABLED
  str     r1,   [r0]

  mov32   r0,   0xE000ED08
  mov32   r1,   0x08000000
  str     r1,   [r0]

  mov32   r0,   0xE000E104
  mov     r1,   (1 << 22)
  str     r1,   [r0]

  mov32   r0,   TIM6_ARR
  mov     r1,   999
  str     r1,   [r0]

  mov32   r0,   TIM6_PSC
  mov     r1,   63999
  str     r1,   [r0]

  mov32   r0,   TIM6_DIER
  mov     r1,   TIM_DIER_UIE_ENABLED
  str     r1,   [r0]

  mov32   r0,   TIM6_EGR
  mov     r1,   TIM_EGR_UG_REINIT
  str     r1,   [r0]

  mov32   r0,   TIM6_CR1
  mov     r1,   TIM_CR1_CEN_ENABLED
  str     r1,   [r0]

.loop:
  b .loop
