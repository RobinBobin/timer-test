@ Source Port
mov     r1,   ETH_SOURCE_PORT
rev16   r1,   r1
strh    r1,   [r0],   2


@ Destination Port
mov     r1,   ETH_DESTINATION_PORT
rev16   r1,   r1
strh    r1,   [r0],   2


@ Length
movw    r1,   :lower16:(ETH_TUDP_PACKET_SIZE)
rev16   r1,   r1
strh    r1,   [r0],   2


@ Checksum
mov   r1,   0
strh  r1,   [r0],   2
