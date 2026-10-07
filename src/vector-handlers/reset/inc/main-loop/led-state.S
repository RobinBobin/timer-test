@ Read button state
ldr   r1,   [r9,  BUTTON_STATE]

@ Read led mode
ldr   r2,   [r9, LED_MODE]

@
@ Branch to handling the led mode, unless
@ the button has just been released
@
cmp   r1,   BUTTON_STATE_UP
bne   .led_state_handle_led_mode

@ Reset button state
mov   r1,   BUTTON_STATE_NULL
str   r1,   [r9, BUTTON_STATE]

@ Increment led mode
cmp     r2,   LED_MODE_MAX
ite     eq
moveq   r2,   LED_MODE_OFF
addne   r2,   1

@ Store LED_MODE
str     r2,   [r9, LED_MODE]

@ Turn off leds
mov32   r0,   GPIOB_BASE
mov     r1,   GPIO_BSRR_VALUE << GPIO_BSRR_BR_0
str     r1,   [r0, GPIO_BSRR_OFFSET]

mov32   r0,   GPIOE_BASE
mov     r1,   GPIO_BSRR_VALUE << GPIO_BSRR_BR_1
str     r1,   [r0, GPIO_BSRR_OFFSET]

@ Reset LED_COUNTER
mov   r1,   0
str   r1,   [r9, LED_COUNTER]

.led_state_handle_led_mode:
  @ Continue if LED_MODE_OFF
  cmp   r2,   LED_MODE_OFF
  beq   .led_state_end

  @ Read, decrement and save LED_COUNTER
  ldr     r1,   [r9, LED_COUNTER]
  cmp     r1,   0
  itt     hi
  subhi   r1,   1
  strhi   r1,   [r9, LED_COUNTER]

  @ Continue if LED_COUNTER is not zero
  cbnz    r1,   .led_state_end

  @ Reinit LED_COUNTER
  mov   r1,   LED_PERIOD_MS
  str   r1,   [r9, LED_COUNTER]

  @ Init registers
  mov32   r0,   GPIOB_BASE
  mov32   r1,   GPIOE_BASE

  @
  @ Save master pin state in r3
  @ Save master pin index in r4
  @
  cmp     r2,   LED_MODE_LED2
  ittee   eq
  moveq   r3,   r1
  moveq   r4,   GPIO_IDR_1
  movne   r3,   r0
  movne   r4,   GPIO_IDR_0
  ldr     r3,   [r3, GPIO_IDR_OFFSET]
  lsr     r3,   r4
  and     r3,   GPIO_PIN_ON

  @ Save BSRR shift to toggle master pin in r5
  mov     r5,   r4
  cmp     r3,   GPIO_PIN_ON
  it      eq
  addeq   r5,   GPIO_BSRR_BR_0

  @ Save GPIO_BSRR_VALUE in r6
  mov   r6,   GPIO_BSRR_VALUE

  @ BSRR mask to toggle master pin
  cmp     r2,   LED_MODE_LED2
  ite     eq
  lsleq   r4,   r6,   r5
  lslne   r3,   r6,   r5

  @ Jump table
  tbb     [pc, r2]

  .led_state_jump_table:
    .byte   (.led_state_led1            -   .led_state_jump_table) / 2
    .byte   (.led_state_led2            -   .led_state_jump_table) / 2
    .byte   (.led_state_led1_or_led2    -   .led_state_jump_table) / 2
    .byte   (.led_state_led1_and_led2   -   .led_state_jump_table) / 2

  .led_state_led1:
    @ BSRR mask to turn off LED2
    mov   r4,   GPIO_IDR_1 + GPIO_BSRR_BR_0
    lsl   r4,   r6,   r4

    b .led_state_handle_leds

  .led_state_led2:
    @ BSRR mask to turn off LED1
    mov   r3,   GPIO_IDR_0 + GPIO_BSRR_BR_0
    lsl   r3,   r6,   r3

    b .led_state_handle_leds

  .led_state_led1_or_led2:
    @ BSRR mask to toggle LED2
    cmp     r3,   GPIO_BSRR_VALUE << GPIO_BSRR_BR_0
    ite     eq
    moveq   r4,   GPIO_BSRR_BS_1
    movne   r4,   GPIO_BSRR_BR_1
    lsl     r4,   r6,   r4

    b .led_state_handle_leds

  .led_state_led1_and_led2:
    @ BSRR mask to toggle LED2
    add   r5,   GPIO_IDR_1
    lsl   r4,   r6,   r5

    b .led_state_handle_leds

  .led_state_handle_leds:
    str     r3,   [r0, GPIO_BSRR_OFFSET]
    str     r4,   [r1, GPIO_BSRR_OFFSET]

@ End
.led_state_end:
