#include "dma/reset.S"
#include "dma/tdes.S"

@ Tx ring length
mov32   r0,   ETH_DMACTXRLR
mov     r1,   ETH_DMA_PREPARE_CDRL(1)
str     r1,   [r0]

@ Tx descriptor list address
mov32   r0,   ETH_DMACTXDLAR
mov32   r1,   ETH_SECTION_ADDRESS
str     r1,   [r0]

@ Tx descriptor tail pointer
mov32   r0,   ETH_DMACTXDTPR
add     r1,   TX_BUFFER
str     r1,   [r0]

@ Channel control
mov32   r0,   ETH_DMACCR
mov     r1,   0
str     r1,   [r0]

@ Channel transmit control
mov32   r0,   ETH_MTLTXQOMR
ldr     r1,   [r0]
nop
