mov32   r0,   ETH_TBUF_SECTION_ADDRESS
movw    r2,   :lower16:(ETH_TDES_COUNT)

@ Calculate the next tbuf offset
movw  r3,   :lower16:(ETH_TOTAL_TBUF_SIZE)
movw  r4,   :lower16:(ETH_TETHERNET_FRAME_SIZE)
sub   r3,   r4


.dma_fill_tbuf:
  #include "tbuf/ethernet.S"
  #include "tbuf/ip.S"
  #include "tbuf/udp.S"
  #include "tbuf/data.S"


  @ Move r0 to the next tbuf address
  add   r0,   r3


  @ Process next buffer
  sub   r2,   1
  cmp   r2,   0
  bne   .dma_fill_tbuf
