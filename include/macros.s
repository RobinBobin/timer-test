.macro mov32, reg, val
  movw  \reg,   :lower16:(\val)
  movt  \reg,   :upper16:(\val)
.endm


@ Wait for SysTick
.macro wait, label
  ldr   r2,     [r8,  SYST_CSR_OFFSET]
  tst   r2,     SYST_CSR_COUNTFLAG
  beq   \label
.endm
