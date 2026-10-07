@ Read button state
mov32   r0,   GPIOC_IDR
ldr     r1,   [r0]

@ Check button state and load debounce counter
tst   r1,   GPIO_PIN_ON << GPIO_IDR_13
ldr   r1,   [r9, BUTTON_DEBOUNCE_COUNTER]
bne   .button_state_down

@ Decrement debounce counter
cmp     r1,   0
it      hi
subhi   r1,   1
b       .button_state_save_debounce_counter

.button_state_down:
  @ Increment debounce counter
  cmp     r1,   BUTTON_DEBOUNCE
  it      lo
  addlo   r1, 1

.button_state_save_debounce_counter:
  str   r1,   [r9, BUTTON_DEBOUNCE_COUNTER]

@ Load BUTTON_STATE into r2
ldr   r2,   [r9, BUTTON_STATE]

@ Handle press
cmp     r1,   BUTTON_DEBOUNCE
ittt    eq
cmpeq   r2,   BUTTON_STATE_NULL
moveq   r2,   BUTTON_STATE_DOWN
streq   r2,   [r9, BUTTON_STATE]

@ Handle release
cmp     r1,   0
ittt    eq
cmpeq   r2,   BUTTON_STATE_DOWN
moveq   r2,   BUTTON_STATE_UP
streq   r2,   [r9, BUTTON_STATE]
