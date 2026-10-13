mov32   r0,   SYSCFG_BASE

@ Select RMII
ldr     r1,   [r0, SYSCFG_PMCR_OFFSET]
orr     r1,   SYSCFG_PMCR_EPIS_RMII
str     r1,   [r0, SYSCFG_PMCR_OFFSET]

@ Enable compensation cell
mov     r1,   SYSCFG_CCCSR_EN
str     r1,   [r0, SYSCFG_CCCSR_OFFSET]

.syscfg_ccready:
  ldr   r1,   [r0, SYSCFG_CCCSR_OFFSET]
  tst   r1,   SYSCFG_CCCSR_READY
  beq   .syscfg_ccready
