@ TDES0
mov32   r0,   ETH_SECTION_ADDRESS
mov     r1,   r0
add     r1,   TX_BUFFER
str     r1,   [r0, TDES0]

@ TDES1
mov   r1,   0
str   r1,   [r0, TDES1]

@ TDES2
mov   r1,   ETH_DMA_TDES2_PACK(
              ETH_DMA_TDES2_IOC_ENABLE,
              ETH_DMA_TDES2_TTS_DISABLE,
              0,
              0
            )
str   r1,   [r0, TDES2]

@ TDES3
mov   r1,   ETH_DMA_TDES3_OWN
str   r1,   [r0, TDES3]
