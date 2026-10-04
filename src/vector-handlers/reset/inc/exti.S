@ Capture button interrupts
mov32   r0,   EXTI_BASE

mov     r1,   EXTI_xTSR1_TR13
str     r1,   [r0, EXTI_RTSR1_OFFSET]
str     r1,   [r0, EXTI_FTSR1_OFFSET]

mov32   r1,   EXTI_CnIMR1_RESET_VALUE | EXTI_CnIMR1_MR13
str     r1,   [r0, EXTI_C1IMR1_OFFSET]
