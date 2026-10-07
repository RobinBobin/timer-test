@ Read the button state
mov32   r0,   GPIOC_IDR
ldr     r1,   [r0]

@ Check the button state and load debounce counter
tst   r1,   GPIO_PIN_ON << GPIO_IDR_13
ldr   r1,   [r9, BUTTON_DEBOUNCE_COUNTER]
bne   .button_state_down

@ Button is up, decrement safely
cmp     r1,   0
it      hi
subhi   r1,   1
b       .button_state_save_debounce_counter

.button_state_down:
  cmp     r1,   BUTTON_DEBOUNCE
  it      lo
  addlo   r1, 1

.button_state_save_debounce_counter:
  str   r1,   [r9, BUTTON_DEBOUNCE_COUNTER]

@ Load BUTTON_IS_DOWN into r2
ldr   r2,   [r9, BUTTON_IS_DOWN]

@ Has just switched up -> down?
cmp     r1,   BUTTON_DEBOUNCE
itt     eq
cmpeq   r2,   FALSE
beq     .button_state_on_down

@ Has just switched down -> up?
cmp     r1,   0
itt     eq
cmpeq   r2,   TRUE
beq     .button_state_on_up

b   .button_state_end

.button_state_on_down:
  @ Save the new state
  mov   r1,   TRUE
  str   r1,   [r9, BUTTON_IS_DOWN]

  b .button_state_end

.button_state_on_up:
  @ Save the new state
  mov   r1,   FALSE
  str   r1,   [r9, BUTTON_IS_DOWN]

@ End
.button_state_end:



@ @ BUTTON_STATE_RAW_UP || BUTTON_STATE_RAW_DOWN
@ cmp     r1,   BUTTON_STATE_RAW_DOWN
@ bls     .start_tim7

@ @ Check if BUTTON_STATE_UP
@ cmp     r1,   BUTTON_STATE_UP
@ bne     .button_state_end

@ @ Reset stored button state
@ mov     r1,   BUTTON_STATE_NONE
@ str     r1,   [r9, BUTTON_STATE]

@ @ Safely increment LED_MODE
@ ldr     r2,   [r9, LED_MODE]
@ cmp     r2,   LED_MODE_MAX
@ ite     eq
@ moveq   r2,   LED_MODE_OFF
@ addne   r2,   1

@ @ Store LED_MODE
@ str     r2,   [r9, LED_MODE]

@ @ Turn off leds
@ mov32   r0,   GPIOB_BASE
@ mov     r1,   GPIO_BSRR_VALUE << GPIO_BSRR_BR_0
@ str     r1,   [r0, GPIO_BSRR_OFFSET]

@ mov32   r0,   GPIOE_BASE
@ mov     r1,   GPIO_BSRR_VALUE << GPIO_BSRR_BR_1
@ str     r1,   [r0, GPIO_BSRR_OFFSET]

@ @ Save TIM6_BASE in r0
@ mov32   r0,   TIM6_BASE

@ @ Stop TIM6
@ mov     r1,   !TIM_CR1_CEN_ENABLED
@ str     r1,   [r0, TIM_CR1_OFFSET]

@ @ Continue if LED_MODE_OFF
@ cmp   r2,   LED_MODE_OFF
@ beq   .button_state_end

@ @ Start TIM6
@ mov     r1,   TIM_EGR_UG_REINIT
@ str     r1,   [r0, TIM_EGR_OFFSET]

@ mov     r1,   TIM_CR1_CEN_ENABLED
@ str     r1,   [r0, TIM_CR1_OFFSET]

@ b   .button_state_end

@ .start_tim7:
@   mov32   r0,   TIM7_BASE

@   mov     r1,   TIM_EGR_UG_REINIT
@   str     r1,   [r0, TIM_EGR_OFFSET]

@   mov     r1,   TIM7_CR1_VALUE
@   str     r1,   [r0, TIM_CR1_OFFSET]

@   b       .button_state_end


