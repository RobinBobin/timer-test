@ Exit if not STATE_FLAG_TIM7
ldr     r1,   [r9, STATE_FLAG_TIM7]
cbz     r1,   .tim7_end

@ Reset STATE_FLAG_TIM7
mov     r1,   STATE_FLAG_OFF
str     r1,   [r9, STATE_FLAG_TIM7]

@ Manage the button state
mov32   r0,   GPIOC_IDR
ldr     r1,   [r0]
ubfx    r1,   r1,   GPIO_IDR_13,  1

ldr     r2,   [r9, BUTTON_STATE]

cmp     r1,   r2
ite     eq
addeq   r2,   2
movne   r2,   BUTTON_STATE_NONE
str     r2,   [r9, BUTTON_STATE]

@ Set STATE_FLAG_BUTTON_STATE
mov     r1,   STATE_FLAG_ON
str     r1,   [r9, STATE_FLAG_BUTTON_STATE]

@ End
.tim7_end:
