mov32   r0,   ETH_TDES_SECTION_ADDRESS

@ TDES0
mov32   r1,   ETH_TBUF_SECTION_ADDRESS
str     r1,   [r0],   4

@ TDES1
add   r1,   0
str   r1,   [r0],   4

@ TDES2
mov32   r1,   ETH_DMA_TDES2_PACK(
                ETH_DMA_TDES2_IOC_DISABLE,
                ETH_DMA_TDES2_TTS_DISABLE,
                0,  // B2L
                60  // B1L
              )
str     r1,   [r0],   4

dmb

@ TDES3
mov   r1,   0xB0000000
str   r1,   [r0],   4


mov32   r0,   ETH_TBUF_SECTION_ADDRESS

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

mov   r1,   13
strb  r1,   [r0],   1

nop
