@ Set Tx ring length
mov32   r0,   ETH_DMACTXRLR
movw    r1,   :lower16:(ETH_TDES_COUNT)
sub     r1,   1
str     r1,   [r0]


@ Load tdes section address into r2
mov32   r2,   ETH_TDES_SECTION_ADDRESS


@ Load Tx descriptor tail pointer into r3
movw  r4,   :lower16:(ETH_TDES_SECTION_SIZE)
add   r3,   r2,   r4


@ Set Tx descriptor list address
mov32   r0,   ETH_DMACTXDLAR
str     r2,   [r0]


@ Set Tx descriptor tail pointer
mov32   r0,   ETH_DMACTXDTPR
str     r3,   [r0]


@ @ Set channel control value
@ mov32   r0,   ETH_DMACCR
@ mov     r1,   0
@ str     r1,   [r0]


dmb


@ Set channel Tx control value
mov32   r0,   ETH_DMACTXCR
mov32   r1,   ETH_DMACTXCR_PACK(
                ETH_DMACTXCR_TXPBL_8,
                ETH_DMACTXCR_START
              )
str     r1,   [r0]


@ Load tail pointer register address into r0
mov32   r0,   ETH_DMACTXDTPR


.dma_loop:
  @ Load tdes count into r4
  movw  r4,   :lower16:(ETH_TDES_COUNT)


  @ Load current tdes3 offset into r5
  mov   r5,   TDES3


  .dma_reinit_tdes:
    @ Read current TDES3
    ldr   r1,   [r2, r5]
    tst   r1,   ETH_DMA_TDES3_OWN


    @ Break to the outer loop if OWN is set
    bne   .dma_loop


    @ Set it again
    mov   r1,   0xB0000000
    str   r1,   [r2, r5]


    @ Decrement and check the iteration counter
    sub   r4,   1
    cmp   r4,   0
    ittt  eq


    @
    @ Set Tx descriptor tail pointer and break to
    @ the outer loop if all tdess are processed
    @
    dmbeq
    streq   r3,   [r0]
    beq     .dma_loop


    @ Increment the current tdes3 offset and continue
    add   r5,   16
    b     .dma_reinit_tdes
