mov32   r0,   PWR_D3CR
mov     r1,   PWR_D3CR_VOS_VOS1 << PWR_D3CR_VOS_OFFSET
str     r1,   [r0]

.pwr_vosrdy:
  ldr   r1,   [r0]
  tst   r1,   PWR_D3CR_VOSRDY
  beq   .pwr_vosrdy
