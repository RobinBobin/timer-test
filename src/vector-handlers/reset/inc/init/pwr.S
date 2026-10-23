mov32   r0,   PWR_BASE


@ Enable SMPS
mov   r1,   PWR_CR3_SDEN
str   r1,   [r0, PWR_CR3_OFFSET]
mov   r2,   PWR_CSR1_ACTVOS_VOS3
bl    .pwr_actvosrdy


@ Switch to VOS1
mov   r1,   PWR_D3CR_VOS_VOS1
str   r1,   [r0, PWR_D3CR_OFFSET]

.pwr_vosrdy:
  ldr   r1,   [r0, PWR_D3CR_OFFSET]
  tst   r1,   PWR_D3CR_VOSRDY
  beq   .pwr_vosrdy

mov   r2,   PWR_CSR1_ACTVOS_VOS1
bl    .pwr_actvosrdy
b     .pwr_end


.pwr_actvosrdy:
  ldr   r1,   [r0, PWR_CSR1_OFFSET]
  tst   r1,   PWR_CSR1_ACTVOSRDY
  beq   .pwr_actvosrdy
  and   r1,   r2
  cmp   r1,   r2
  bne   .pwr_actvosrdy
  bx lr


.pwr_end:
