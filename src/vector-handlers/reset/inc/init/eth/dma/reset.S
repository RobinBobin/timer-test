@ Reset
mov32   r0,   ETH_DMAMR
mov     r1,   ETH_DMAMR_SWR
str     r1,   [r0]

.dma_reset:
  ldr   r1,   [r0]
  tst   r1,   ETH_DMAMR_SWR
  bne   .dma_reset

mov32   r1,   ETH_DMAMR_PACK(
                ETH_DMAMR_INTM_FORBID,
                ETH_DMAMR_TXPR,
                ETH_DMAMR_DA_FIXED
              )
str     r1,   [r0]
