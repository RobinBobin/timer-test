.macro  strmac  mac
  @ Store the first 4 octets
  mov32   r1,   \mac >> 16
  rev     r1,   r1
  strh    r1,   [r0],   2
  lsr     r1,   16
  strh    r1,   [r0],   2

  @ Store the last 2 octets
  mov     r1,   \mac & 0xFFFF
  rev16   r1,   r1
  strh    r1,   [r0],   2
.endm


@ Destination Address
strmac  ETH_DESTINATION_ADDRESS


@ Source Address
strmac  ETH_SOURCE_ADDRESS


@ Ether Type
mov     r1,   0x0800
rev16   r1,   r1
strh    r1,   [r0],   2
