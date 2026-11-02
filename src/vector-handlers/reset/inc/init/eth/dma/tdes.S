mov32   r0,   ETH_TDES_SECTION_ADDRESS
mov32   r2,   ETH_TBUF_SECTION_ADDRESS
movw    r3,   :lower16:(ETH_TDES_COUNT)
movw    r4,   :lower16:(ETH_TOTAL_TBUF_SIZE)
movw    r5,   :lower16:(ETH_TOTAL_HEADER_SIZE)
movw    r6,   :lower16:(ETH_TBUF2_OFFSET)


.dma_fill_tdes:
  @ TDES0
  str   r2,   [r0],   4


  @ TDES1
  mov   r1,   r2
  add   r1,   r5
  add   r1,   r6
  str   r1,   [r0],   4


  @
  @ TDES2
  @

  @ B1L
  mov   r1,   r5
  lsl   r1,   ETH_DMA_TDES2_HL_OR_B1L_OFFSET

  @ B2L
  movw  r7,   :lower16:(ETH_TDATA_SIZE)
  lsl   r7,   ETH_DMA_TDES2_B2L_OFFSET
  orr   r1,   r7

  @ Others
  orr   r1,   ETH_DMA_TDES2_IOC_DISABLE
  orr   r1,   ETH_DMA_TDES2_TTS_DISABLE
  str   r1,   [r0],   4


  @ TDES3
  mov32   r1,   ETH_DMA_TDES3
  str     r1,   [r0],   4


  @ Shift r2 to hold the next tbuf address
  add   r2,   r4


  @ Process next TDES
  sub   r3,   1
  cmp   r3,   0
  bne   .dma_fill_tdes
