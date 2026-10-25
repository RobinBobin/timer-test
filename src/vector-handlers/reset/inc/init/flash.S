mov32   r0,   FLASH_BASE

@ Set latency and write-high-freq
mov   r1,   FLASH_ACR_LATENCY_WS_2 | FLASH_ACR_WRHIGHFREQ_2
str   r1,   [r0, FLASH_ACR_OFFSET]
ldr   r1,   [r0, FLASH_ACR_OFFSET]
