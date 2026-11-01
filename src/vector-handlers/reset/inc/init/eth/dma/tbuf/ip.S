.macro strip  ip
  mov32   r1,   \ip
  rev     r1,   r1
  strh    r1,   [r0],   2
  lsr     r1,   16
  strh    r1,   [r0],   2
.endm


@ Version + IHL
mov   r1,   0x45
strb  r1,   [r0],   1


@ DSCP + ECN (TOS)
mov   r1,   0
strb  r1,   [r0],   1


@ Total Length
movw    r1,   :lower16:(ETH_TIP_PACKET_SIZE)
rev16   r1,   r1
strh    r1,   [r0],   2


@ Identification
mov   r1,   0
strh  r1,   [r0],   2


@ Flags + Fragment Offset
mov     r1,   0x4000
rev16   r1,   r1
strh    r1,   [r0],   2


@ TTL
mov   r1,   64
strb  r1,   [r0],   1


@ Protocol
mov   r1,   17
strb  r1,   [r0],   1


@ Header Checksum
mov     r1,   0xb96b
rev16   r1,   r1
strh    r1,   [r0],   2


@ Source Address
strip   ETH_SOURCE_IP


@ Destination Address
strip   ETH_DESTINATION_IP
