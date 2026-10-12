mov32   r0,   PWR_BASE

@ CR3
mov   r1,   PWR_CR3_SDEN
str   r1,   [r0, PWR_CR3_OFFSET]

.pwr_actvosrdy:
  ldr   r1,   [r0, PWR_CSR1_OFFSET]
  tst   r1,   PWR_CSR1_ACTVOSRDY
  beq   .pwr_actvosrdy

@ D3CR
mov     r1,   PWR_D3CR_VOS_VOS1
str     r1,   [r0, PWR_D3CR_OFFSET]

.pwr_vosrdy:
  ldr   r1,   [r0, PWR_D3CR_OFFSET]
  tst   r1,   PWR_D3CR_VOSRDY
  beq   .pwr_vosrdy
