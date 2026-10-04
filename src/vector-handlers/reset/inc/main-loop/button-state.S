ldr     r1,   [r9, BUTTON_STATE]
cmp     r1,   BUTTON_STATE_UP
bne     .main_loop

@ Reset stored button state
mov     r1,   BUTTON_STATE_NONE
str     r1,   [r9, BUTTON_STATE]

mov32   r0,   TIM6_BASE

@ Is the timer enabled?
ldr     r1,   [r0, TIM_CR1_OFFSET]
ubfx    r1,   r1,   TIM_CR1_CEN_INDEX, 1
tst     r1,   r1
beq     .start_tim6

@ Stop the timer
mov     r1,   0
str     r1,   [r0, TIM_CR1_OFFSET]
b       .main_loop

.start_tim6:
  mov     r1,   TIM_EGR_UG_REINIT
  str     r1,   [r0, TIM_EGR_OFFSET]

  mov     r1,   TIM_CR1_CEN_ENABLED
  str     r1,   [r0, TIM_CR1_OFFSET]

b .main_loop
