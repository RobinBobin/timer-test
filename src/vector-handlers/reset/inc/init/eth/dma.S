#include "dma/reset.S"
#include "dma/tdes.S"

@ Set Tx ring length
mov32   r0,   ETH_DMACTXRLR
mov     r1,   ETH_DMA_PREPARE_CDRL(1)
str     r1,   [r0]

@ Set Tx descriptor list address
mov32   r0,   ETH_DMACTXDLAR
mov32   r1,   ETH_SECTION_ADDRESS
str     r1,   [r0]

@ Set Tx descriptor tail pointer
mov32   r0,   ETH_DMACTXDTPR
add     r1,   TX_BUFFER
str     r1,   [r0]

@ Set channel control value
mov32   r0,   ETH_DMACCR
mov     r1,   0
str     r1,   [r0]

@ Set channel Tx control value
mov32   r0,   ETH_DMACTXCR
mov32   r1,   ETH_DMACTXCR_PACK(
                ETH_DMACTXCR_TXPBL_8,
                ETH_DMACTXCR_START
              )
