@ Store SYST_BASE in r8
mov32   r8,   SYST_BASE

@ Store variable buffer address in r9
mov32   r9,   0x20000000

@ Init SCB_VTOR
mov32   r0,   SCB_VTOR
mov32   r1,   VECTOR_TABLE_ADDRESS
str     r1,   [r0]

@ SysTick 1 ms
mov   r1,   TIMER_1_MS
str   r1,   [r8, SYST_RVR_OFFSET]

mov   r1,   0
str   r1,   [r8, SYST_CVR_OFFSET]

@ Init button
mov   r1,   0
str   r1,   [r9, BUTTON_DEBOUNCE_COUNTER]

mov   r1,   BUTTON_STATE_NULL
str   r1,   [r9, BUTTON_STATE]

@ Init led
mov   r1,   0
str   r1,   [r9, LED_COUNTER]

mov   r1,   LED_MODE_OFF
str   r1,   [r9, LED_MODE]
