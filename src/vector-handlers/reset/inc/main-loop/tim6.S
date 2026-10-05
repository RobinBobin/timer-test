@ Exit if not STATE_FLAG_TIM6
ldr   r1,   [r9, STATE_FLAG_TIM6]
cmp   r1,   STATE_FLAG_OFF
beq   .tim6_end

@ Reset STATE_FLAG_TIM6
mov   r1,   STATE_FLAG_OFF
str   r1,   [r9, STATE_FLAG_TIM6]

@ Get LED_MODE
ldr   r1,   [r9, LED_MODE]

@ Jump table
tbb   [pc, r1]

.tim6_jump_table:
  .byte   (.tim6_led1           -   .tim6_jump_table) / 2
  .byte   (.tim6_led2           -   .tim6_jump_table) / 2
  .byte   (.tim6_led1_or_led2   -   .tim6_jump_table) / 2
  .byte   (.tim6_led1_and_led2  -   .tim6_jump_table) / 2

.tim6_led1:
  @ Handle LED1
  mov32   r0,   GPIOB_BASE
  mov     r2,   GPIO_IDR_0
  bl      .tim6_get_toggling_value
  str     r2,   [r0, GPIO_BSRR_OFFSET]

  @ Handle LED2
  mov32   r0,   GPIOE_BASE
  mov     r2,   GPIO_BSRR_VALUE << GPIO_BSRR_BR_1
  str     r2,   [r0, GPIO_BSRR_OFFSET]

  b       .tim6_end

.tim6_led2:
  @ Handle LED1
  mov32   r0,   GPIOB_BASE
  mov     r2,   GPIO_BSRR_VALUE << GPIO_BSRR_BR_0
  str     r2,   [r0, GPIO_BSRR_OFFSET]

  @ Handle LED2
  mov32   r0,   GPIOE_BASE
  mov     r2,   GPIO_IDR_1
  bl      .tim6_get_toggling_value
  str     r2,   [r0, GPIO_BSRR_OFFSET]

  b   .tim6_end

.tim6_led1_or_led2:
  b   .tim6_end

.tim6_led1_and_led2:
  mov32   r0,   GPIOB_BASE
  mov     r2,   GPIO_IDR_0
  mov     r3,   GPIO_IDR_1
  bl      .tim6_get_toggling_value
  str     r2,   [r0, GPIO_BSRR_OFFSET]

  mov32   r0,   GPIOE_BASE
  str     r3,   [r0, GPIO_BSRR_OFFSET]

  b       .tim6_end

.tim6_get_toggling_value:
  @
  @ Input:
  @ r0 = GPIOx_BASE
  @ r1 = LED_MODE
  @ r2 = GPIO_IDR_x
  @ r3 = GPIO_IDR_y if r1 eq LED_MODE_LED1_*_LED2, otherwise undefined
  @
  @ Output:
  @ r2 = value to toggle GPIO_IDR_x
  @ r3 = value to toggle GPIO_IDR_y if r1 eq LED_MODE_LED1_*_LED2, otherwise undefined
  @

  @ Get the current pin state
  ldr   r4,   [r0, GPIO_IDR_OFFSET]
  lsr   r4,   r2
  ands  r4,   GPIO_PIN_ON

  @ Save Z in r4
  ite     eq
  moveq   r4,   1
  movne   r4,   0

  @ Save GPIO_BSRR_VALUE in r5
  mov     r5,   GPIO_BSRR_VALUE

  @ Prepare r2
  it      ne
  addne   r2,   GPIO_BSRR_BR_0
  lsl     r2,   r5,  r2

  @ Exit if LED_MODE < LED_MODE_LED1_OR_LED2
  cmp   r1,   LED_MODE_LED1_OR_LED2
  it    lo
  bxlo  lr

  @ Prepare for easy comparison
  sub   r5,   r1,   LED_MODE_LED1_OR_LED2
  
  @ LED_MODE_LED1_AND_LED2
  cbz     r5,   .tim6_get_toggling_value_led1_or_led2
  cmp     r4,   1
  it      ne
  addne   r3,   GPIO_BSRR_BR_0
  lsl     r3,   r5,  r3

  bx lr

  .tim6_get_toggling_value_led1_or_led2:
    nop

  bx    lr

.tim6_end:
