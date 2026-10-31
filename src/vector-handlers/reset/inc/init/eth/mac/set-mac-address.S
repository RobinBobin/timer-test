@ Set MAC LO
mov32   r0,   ETH_MACA0LR
mov32   r1,   0x44332212
str     r1,   [r0]

@ Set MAC HI
mov32   r0,   ETH_MACA0HR
mov32   r1,   0x80006655
str     r1,   [r0]
