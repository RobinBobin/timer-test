mov32   r0,   ETH_TBUF_SECTION_ADDRESS
movw    r2,   :lower16:(ETH_TDES_COUNT)


.dma_fill_tbuf:
  #include "tbuf/ethernet.S"
  #include "tbuf/ip.S"
  #include "tbuf/udp.S"
  #include "tbuf/data.S"


  @ Shift r0 to hold the next tbuf address
  movw  r3,   :lower16:(ETH_TBUF_SIZE)
  movw  r4,   :lower16:(ETH_TDATA_SIZE)
  sub   r3,   r4
  add   r0,   r3


  @ Process next buffer
  sub   r2,   1
  cmp   r2,   0
  bne   .dma_fill_tbuf
