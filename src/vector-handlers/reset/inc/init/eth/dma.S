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
ldr     r1,   [r0]
dmb


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
str     r1,   [r0]

.dma_wait_tdes3:
  mov32   r0,   ETH_DMACSR
  ldr     r1,   [r0]
  mov     r1,   ETH_DMACSR_RESET_MASK
  str     r1,   [r0]

  mov32   r0,   ETH_DMADSR
  ldr     r1,   [r0]

  @ ETH_MACHWF0R
  mov32   r0,   ETH_BASE
  ldr     r1,   [r0, 0x011C]

  @ ETH_MACRXTXSR
  ldr     r1,   [r0, 0x00B8]

  @ ETH_MTLTXQUR
  ldr     r1,   [r0, 0x0D04]

  @ ETH_MACDR
  ldr     r1,   [r0, 0x0114]

  @ ETH_MTLTXQDR
  ldr     r1,   [r0, 0x0D08]

  mov32   r0,   ETH_SECTION_ADDRESS
  ldr     r1,   [r0, TDES3]
  tst     r1,   ETH_DMA_TDES3_OWN
  bne     .dma_wait_tdes3
