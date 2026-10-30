mov32   r0,   ETH_TBUF_SECTION_ADDRESS
movw    r2,   :lower16:(ETH_TDES_COUNT)


.dma_fill_tbuf:
  @
  @ Ethernet header
  @

  @ DA
  mov   r1,   0xD8
  strb  r1,   [r0],   1

  mov   r1,   0x5E
  strb  r1,   [r0],   1

  mov   r1,   0xD3
  strb  r1,   [r0],   1

  mov   r1,   0xE1
  strb  r1,   [r0],   1

  mov   r1,   0x09
  strb  r1,   [r0],   1

  mov   r1,   0x97
  strb  r1,   [r0],   1

  @ SA
  mov   r1,   0x12
  strb  r1,   [r0],   1

  mov   r1,   0x22
  strb  r1,   [r0],   1

  mov   r1,   0x33
  strb  r1,   [r0],   1

  mov   r1,   0x44
  strb  r1,   [r0],   1

  mov   r1,   0x55
  strb  r1,   [r0],   1

  mov   r1,   0x66
  strb  r1,   [r0],   1

  @ EtherType
  mov   r1,   0x08
  strb  r1,   [r0],   1

  mov   r1,   0x00
  strb  r1,   [r0],   1

  @
  @ IP header
  @

  mov   r1,   0x45
  strb  r1,   [r0],   1

  mov   r1,   0x00
  strb  r1,   [r0],   1

  mov   r1,   0x00
  strb  r1,   [r0],   1

  mov   r1,   46
  strb  r1,   [r0],   1

  mov   r1,   0x00
  strb  r1,   [r0],   1

  mov   r1,   0x00
  strb  r1,   [r0],   1

  mov   r1,   0x40
  strb  r1,   [r0],   1

  mov   r1,   0x00
  strb  r1,   [r0],   1

  mov   r1,   0x40
  strb  r1,   [r0],   1

  mov   r1,   0x11
  strb  r1,   [r0],   1

  mov   r1,   0xB9
  strb  r1,   [r0],   1

  mov   r1,   0x6B
  strb  r1,   [r0],   1

  mov   r1,   0xC0
  strb  r1,   [r0],   1

  mov   r1,   0xA8
  strb  r1,   [r0],   1

  mov   r1,   0x00
  strb  r1,   [r0],   1

  mov   r1,   0x01
  strb  r1,   [r0],   1

  mov   r1,   0xC0
  strb  r1,   [r0],   1

  mov   r1,   0xA8
  strb  r1,   [r0],   1

  mov   r1,   0x00
  strb  r1,   [r0],   1

  mov   r1,   0x02
  strb  r1,   [r0],   1

  @
  @ UDP header
  @

  @ Source Port
  mov   r1,   0x0B
  strb  r1,   [r0],   1

  mov   r1,   0xB8
  strb  r1,   [r0],   1

  mov   r1,   0x0B
  strb  r1,   [r0],   1

  mov   r1,   0xB8
  strb  r1,   [r0],   1

  mov   r1,   0
  strb  r1,   [r0],   1

  mov   r1,   26
  strb  r1,   [r0],   1

  mov   r1,   0
  strb  r1,   [r0],   1

  mov   r1,   0
  strb  r1,   [r0],   1

  mov   r1,   10
  strb  r1,   [r0],   1

  mov   r1,   20
  strb  r1,   [r0],   1

  mov   r1,   30
  strb  r1,   [r0],   1

  mov   r1,   40
  strb  r1,   [r0],   1

  mov   r1,   50
  strb  r1,   [r0],   1

  mov   r1,   60
  strb  r1,   [r0],   1

  mov   r1,   70
  strb  r1,   [r0],   1

  mov   r1,   80
  strb  r1,   [r0],   1

  mov   r1,   90
  strb  r1,   [r0],   1

  mov   r1,   90
  strb  r1,   [r0],   1

  mov   r1,   80
  strb  r1,   [r0],   1

  mov   r1,   70
  strb  r1,   [r0],   1

  mov   r1,   6
  strb  r1,   [r0],   1

  mov   r1,   5
  strb  r1,   [r0],   1

  mov   r1,   4
  strb  r1,   [r0],   1

  mov   r1,   3
  strb  r1,   [r0],   1

  mov   r1,   2
  strb  r1,   [r0],   1

  mov   r1,   12
  strb  r1,   [r0],   1


  @ Shift r0 to hold the next tbuf address
  add   r0,   1988


  @ Process next buffer
  sub   r2,   1
  cmp   r2,   0
  bne   .dma_fill_tbuf
