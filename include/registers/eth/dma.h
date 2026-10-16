///////////////////////////////////////////////////////////////////////////////

/* ETH_DMAMR */
#define ETH_DMAMR_OFFSET  0x1000
#define ETH_DMAMR         (ETH_BASE + 0x1000)

/* ETH_DMAMR_INTM */
#define ETH_DMAMR_INTM_OFFSET   16

#define ETH_DMAMR_INTM_ALLOW        (0 << ETH_DMAMR_INTM_OFFSET)
#define ETH_DMAMR_INTM_FORBID       (1 << ETH_DMAMR_INTM_OFFSET)
#define ETH_DMAMR_INTM_ACCUMULATE   (2 << ETH_DMAMR_INTM_OFFSET)

/* ETH_DMAMR_TXPR */
#define ETH_DMAMR_TXPR_OFFSET   11

#define ETH_DMAMR_RXPR  (0 << ETH_DMAMR_TXPR_OFFSET)
#define ETH_DMAMR_TXPR  (1 << ETH_DMAMR_TXPR_OFFSET)

/* ETH_DMAMR_DA */
#define ETH_DMAMR_DA_OFFSET   1

#define ETH_DMAMR_DA_WRR    (0 << ETH_DMAMR_DA_OFFSET)
#define ETH_DMAMR_DA_FIXED  (1 << ETH_DMAMR_DA_OFFSET)

/* ETH_DMAMR_SWR*/
#define ETH_DMAMR_SWR   (1 << 0)

#define ETH_DMAMR_PACK(INTM, TXPR, DA)  \
  ((INTM) | (TXPR) | (DA))

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMASBMR */
#define ETH_DMASBMR_OFFSET  0x1004
#define ETH_DMASBMR         (ETH_BASE + ETH_DMASBMR_OFFSET)

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMAISR */

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMADSR */

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMACCR */
#define ETH_DMACCR_OFFSET   0x1100
#define ETH_DMACCR          (ETH_BASE + ETH_DMACCR_OFFSET)

/* ETH_DMACCR_DSL */
#define ETH_DMACCR_DSL_OFFSET   18

/* ETH_DMACCR_PBLX8 */
#define ETH_DMACCR_PBLX8  (1 << 16)

#define ETH_DMACCR_PACK(DSL, PBLX8)   \
  (((DSL) << ETH_DMACCR_DSL_OFFSET) | (PBLX8))

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMACTXCR */
#define ETH_DMACTXCR_OFFSET   0x1104
#define ETH_DMACTXCR          (ETH_BASE + ETH_DMACTXCR_OFFSET)

/* ETH_DMACTXCR_TXPBL */
#define ETH_DMACTXCR_TXPBL_OFFSET   16

#define ETH_DMACTXCR_TXPBL_1    (1 << ETH_DMACTXCR_TXPBL_OFFSET)
#define ETH_DMACTXCR_TXPBL_2    (2 << ETH_DMACTXCR_TXPBL_OFFSET)
#define ETH_DMACTXCR_TXPBL_4    (4 << ETH_DMACTXCR_TXPBL_OFFSET)
#define ETH_DMACTXCR_TXPBL_8    (8 << ETH_DMACTXCR_TXPBL_OFFSET)
#define ETH_DMACTXCR_TXPBL_16   (16 << ETH_DMACTXCR_TXPBL_OFFSET)
#define ETH_DMACTXCR_TXPBL_32   (32 << ETH_DMACTXCR_TXPBL_OFFSET)

/* ETH_DMACTXCR_ST */
#define ETH_DMACTXCR_ST   1

#define ETH_DMACTXCR_PACK(TXPBL, ST)  \
  ((TXPBL) | (ST))

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMACRXCR */

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMACTXDLAR */
#define ETH_DMACTXDLAR_OFFSET   0x1114
#define ETH_DMACTXDLAR          (ETH_BASE + ETH_DMACTXDLAR_OFFSET)

///////////////////////////////////////////////////////////////////////////////

/* ETH_ETH_DMACRXDLAR */

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMACTXDTPR */
#define ETH_DMACTXDTPR_OFFSET   0x1120
#define ETH_DMACTXDTPR          (ETH_BASE + ETH_DMACTXDTPR_OFFSET)

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMACRXDTPR */

///////////////////////////////////////////////////////////////////////////////

/* ETH_Prepare channel descriptor ring length */
#define ETH_DMA_PREPARE_CDRL(DESCRIPTOR_RING_LENGTH)  \
  ((DESCRIPTOR_RING_LENGTH) - 1)

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMACTXRLR */
#define ETH_DMACTXRLR_OFFSET  0x112C
#define ETH_DMACTXRLR         (ETH_BASE + ETH_DMACTXRLR_OFFSET)

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMACRXRLR */

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMACIER */

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMACRXIWTR */

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMACCATXDR */

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMACCARXDR */

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMACCATXBR */

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMACCARXBR */

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMACSR */
#define ETH_DMACSR_OFFSET   0x1160
#define ETH_DMACSR          (ETH_BASE + ETH_DMACSR)

#define ETH_DMACSR_RESET_MASK   0xFDC7

/* ETH_DMACSR_TEB */
#define ETH_DMACSR_TEB_OFFSET   16

#define ETH_DMACSR_TEB_ERROR_DATA_TRANSFER      (4 << ETH_DMACSR_TEB_OFFSET)
#define ETH_DMACSR_TEB_ERROR_DESCRIPTOR_ACCESS  (2 << ETH_DMACSR_TEB_OFFSET)
#define ETH_DMACSR_TEB_ERROR_READ_TRANSFER      (1 << ETH_DMACSR_TEB_OFFSET)

/* ETH_DMACSR_CDE */
#define ETH_DMACSR_CDE  (1 << 13)

/* ETH_DMACSR_FBE */
#define ETH_DMACSR_FBE  (1 << 12)

/* ETH_DMACSR_ERI */
#define ETH_DMACSR_ERI  (1 << 11)

/* ETH_DMACSR_ETI */
#define ETH_DMACSR_ETI  (1 << 10)

/* ETH_DMACSR_RWT */
#define ETH_DMACSR_RWT  (1 << 9)

/* ETH_DMACSR_RPS */
#define ETH_DMACSR_RPS  (1 << 8)

/* ETH_DMACSR_RBU */
#define ETH_DMACSR_RBU  (1 << 7)

/* ETH_DMACSR_RI */
#define ETH_DMACSR_RI   (1 << 6)

/* ETH_DMACSR_TBU */
#define ETH_DMACSR_TBU  (1 << 2)

/* ETH_DMACSR_TPS */
#define ETH_DMACSR_TPS  (1 << 1)

/* ETH_DMACSR_TI */
#define ETH_DMACSR_TI   (1 << 0)

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMACMFCR */

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMA_TDES2_IOC */
#define ETH_DMA_TDES2_IOC_ENABLE    1
#define ETH_DMA_TDES2_IOC_DISABLE   0

/* ETH_DMA_TDES2_TTS */
#define ETH_DMA_TDES2_TTS_ENABLE    1
#define ETH_DMA_TDES2_TTS_DISABLE   0

/* ETH_DMA_TDES2_PACK */
#define ETH_DMA_TDES2_PACK(IOC, TTSE, B2L, HL_OR_B1L)   \
  (                           \
      ((IOC)        <<  31)   \
    | ((TTSE)       <<  30)   \
    | ((B2L)        <<  16)   \
    | ((HL_OR_B1L)  <<  0)    \
  )

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMA_TDES3_OWN */
#define ETH_DMA_TDES3_OWN   (1 << 31)
