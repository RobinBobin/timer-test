mov32   r0,   ETH_TDES_SECTION_ADDRESS
mov32   r2,   ETH_TBUF_SECTION_ADDRESS
movw    r3,   :lower16:(ETH_TDES_COUNT)
movw    r4,   :lower16:(ETH_TBUF_SIZE)


.dma_fill_tdes:
  @ TDES0
  str   r2,   [r0],   4


  @ TDES1
  mov   r1,   0
  str   r1,   [r0],   4


  @
  @ TDES2
  @

  @ B1L
  movw  r1,   :lower16:(ETH_TETHERNET_FRAME_SIZE)
  lsl   r1,   ETH_DMA_TDES2_HL_OR_B1L_OFFSET

  @ Others
  orr   r1,   ETH_DMA_TDES2_IOC_DISABLE
  orr   r1,   ETH_DMA_TDES2_TTS_DISABLE
  str   r1,   [r0],   4


  @ TDES3
  mov   r1,   0xB0000000
  str   r1,   [r0],   4


  @ Shift r2 to hold the next tbuf address
  add   r2,   r4


  @ Process next TDES
  sub   r3,   1
  cmp   r3,   0
  bne   .dma_fill_tdes
