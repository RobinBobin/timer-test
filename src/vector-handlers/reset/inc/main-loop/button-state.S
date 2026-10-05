@ Exit if not STATE_FLAG_BUTTON_STATE
ldr     r1,   [r9, STATE_FLAG_BUTTON_STATE]
cbz     r1,   .button_state_end

@ Reset STATE_FLAG_BUTTON_STATE
mov     r1,   STATE_FLAG_OFF
str     r1,   [r9, STATE_FLAG_BUTTON_STATE]

@ Read the button state
ldr     r1,   [r9, BUTTON_STATE]

@ BUTTON_STATE_RAW_UP || BUTTON_STATE_RAW_DOWN
cmp     r1,   BUTTON_STATE_RAW_DOWN
bls     .start_tim7

@ Check if BUTTON_STATE_UP
cmp     r1,   BUTTON_STATE_UP
bne     .button_state_end

@ Reset stored button state
mov     r1,   BUTTON_STATE_NONE
str     r1,   [r9, BUTTON_STATE]

@ Safely increment LED_MODE
ldr     r1,   [r9, LED_MODE]
cmp     r1,   LED_MODE_MAX
ite     eq
moveq   r1,   LED_MODE_OFF
addne   r1,   1

@ Store LED_MODE
str     r1,   [r9, LED_MODE]

mov32   r0,   TIM6_BASE

@ Is the timer enabled?
ldr     r1,   [r0, TIM_CR1_OFFSET]
ubfx    r1,   r1,   TIM_CR1_CEN_INDEX, 1
tst     r1,   r1
beq     .start_tim6

@ Stop the timer
mov     r1,   0
str     r1,   [r0, TIM_CR1_OFFSET]
b       .button_state_end

.start_tim6:
mov     r1,   TIM_EGR_UG_REINIT
str     r1,   [r0, TIM_EGR_OFFSET]

mov     r1,   TIM_CR1_CEN_ENABLED
str     r1,   [r0, TIM_CR1_OFFSET]

b       .button_state_end

.start_tim7:
mov32   r0,   TIM7_BASE

mov     r1,   TIM_EGR_UG_REINIT
str     r1,   [r0, TIM_EGR_OFFSET]

mov     r1,   TIM7_CR1_VALUE
str     r1,   [r0, TIM_CR1_OFFSET]

@ End
.button_state_end:
