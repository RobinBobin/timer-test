mov32   r8,   SYST_BASE


@ 1 ms
mov32   r1,   TIMER_1_MS
str     r1,   [r8, SYST_RVR_OFFSET]


@ Start
mov   r1,   0
str   r1,   [r8, SYST_CVR_OFFSET]

mov   r1,   SYST_CSR_RESET_VALUE | SYST_CSR_ENABLE
str   r1,   [r8, SYST_CSR_OFFSET]