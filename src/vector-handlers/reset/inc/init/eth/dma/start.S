@ Set Tx ring length
mov32   r0,   ETH_DMACTXRLR
mov     r1,   ETH_DMA_PREPARE_CDRL(4)
str     r1,   [r0]


@ Set Tx descriptor list address
mov32   r0,   ETH_DMACTXDLAR
mov32   r1,   ETH_TDES_SECTION_ADDRESS
str     r1,   [r0]


@ Set Tx descriptor tail pointer
mov32   r0,   ETH_DMACTXDTPR
movw    r2,   :lower16:(ETH_TDES_SECTION_SIZE)
add     r1,   r2
str     r1,   [r0]
ldr     r1,   [r0]
dmb


@ Set channel control value
mov32   r0,   ETH_DMACCR
mov     r1,   0
str     r1,   [r0]


@ Set channel Tx control value
mov32   r0,   ETH_DMACTXCR
mov32   r1,   ETH_DMACTXCR_PACK(
                ETH_DMACTXCR_TXPBL_8,
                ETH_DMACTXCR_START
              )
str     r1,   [r0]

.dma_wait_tdes3:
  mov32   r0,   ETH_TDES_SECTION_ADDRESS

  @ TDES 1
  ldr   r1,   [r0, TDES3]
  tst   r1,   ETH_DMA_TDES3_OWN
  bne   .dma_wait_tdes3
  mov   r1,   0xB0000000
  str   r1,   [r0, TDES3]

  @ TDES 2
  add   r0,   16
  ldr   r1,   [r0, TDES3]
  tst   r1,   ETH_DMA_TDES3_OWN
  bne   .dma_wait_tdes3
  mov   r1,   0xB0000000
  str   r1,   [r0, TDES3]

  @ TDES 3
  add   r0,   16
  ldr   r1,   [r0, TDES3]
  tst   r1,   ETH_DMA_TDES3_OWN
  bne   .dma_wait_tdes3
  mov   r1,   0xB0000000
  str   r1,   [r0, TDES3]

  @ TDES 4
  add   r0,   16
  ldr   r1,   [r0, TDES3]
  tst   r1,   ETH_DMA_TDES3_OWN
  bne   .dma_wait_tdes3
  mov   r1,   0xB0000000
  str   r1,   [r0, TDES3]

  dmb

  @ Set Tx descriptor tail pointer
  mov32   r0,   ETH_DMACTXDTPR
  mov32   r1,   ETH_TDES_SECTION_ADDRESS
  movw    r2,   :lower16:(ETH_TDES_SECTION_SIZE)
  add     r1,   r2
  str     r1,   [r0]
  ldr     r1,   [r0]

  b       .dma_wait_tdes3
  