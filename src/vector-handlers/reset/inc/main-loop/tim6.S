@ Init registers
mov32   r0,   GPIOB_BASE
mov32   r1,   GPIOE_BASE
ldr     r2,   [r9, LED_MODE]

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

.tim6_jump_table:
  .byte   (.tim6_led1           -   .tim6_jump_table) / 2
  .byte   (.tim6_led2           -   .tim6_jump_table) / 2
  .byte   (.tim6_led1_or_led2   -   .tim6_jump_table) / 2
  .byte   (.tim6_led1_and_led2  -   .tim6_jump_table) / 2

.tim6_led1:
  @ BSRR mask to turn off LED2
  mov   r4,   GPIO_IDR_1 + GPIO_BSRR_BR_0
  lsl   r4,   r6,   r4

  b .tim6_handle_leds

.tim6_led2:
  @ BSRR mask to turn off LED1
  mov   r3,   GPIO_IDR_0 + GPIO_BSRR_BR_0
  lsl   r3,   r6,   r3

  b .tim6_handle_leds

.tim6_led1_or_led2:
  @ BSRR mask to toggle LED2
  cmp     r3,   GPIO_BSRR_VALUE << GPIO_BSRR_BR_0
  ite     eq
  moveq   r4,   GPIO_BSRR_BS_1
  movne   r4,   GPIO_BSRR_BR_1
  lsl     r4,   r6,   r4

  b .tim6_handle_leds

.tim6_led1_and_led2:
  @ BSRR mask to toggle LED2
  add   r5,   GPIO_IDR_1
  lsl   r4,   r6,   r5
  b .tim6_handle_leds

.tim6_handle_leds:
str     r3,   [r0, GPIO_BSRR_OFFSET]
str     r4,   [r1, GPIO_BSRR_OFFSET]

.tim6_end:
