///////////////////////////////////////////////////////////////////////////////

/* DMAMR */
#define ETH_DMAMR_OFFSET  0x1000
#define ETH_DMAMR         (ETH_BASE + 0x1000)

/* DMAMR_INTM */
#define ETH_DMAMR_INTM_OFFSET   16

#define ETH_DMAMR_INTM_0  (0 << ETH_DMAMR_INTM_OFFSET)
#define ETH_DMAMR_INTM_1  (1 << ETH_DMAMR_INTM_OFFSET)
#define ETH_DMAMR_INTM_2  (2 << ETH_DMAMR_INTM_OFFSET)

/* DMAMR_TXPR */
#define ETH_DMAMR_TXPR  (1 << 11)

/* DMAMR_DA */
#define ETH_DMAMR_DA_FIXED  (1 << 1)

/* DMAMR_SWR*/
#define ETH_DMAMR_SWR   (1 << 0)

#define ETH_DMAMR_PACK(INTM, TXPR, DA, SWR)  \
  ((INTM) | (TXPR) | (DA) | (SWR))

///////////////////////////////////////////////////////////////////////////////

/* DMASBMR */

///////////////////////////////////////////////////////////////////////////////

/* DMAISR */

///////////////////////////////////////////////////////////////////////////////

/* DMADSR */

///////////////////////////////////////////////////////////////////////////////

/* DMACCR */
#define ETH_DMACCR_OFFSET   0x1100
#define ETH_DMACCR          (ETH_BASE + ETH_DMACCR)

/* DMACCR_DSL */
#define ETH_DMACCR_DSL_OFFSET   18

/* DMACCR_PBLX8 */
#define ETH_DMACCR_PBLX8  (1 << 16)

#define ETH_DMACCR_PACK(DSL, PBLX8)   \
  (((DSL) << ETH_DMACCR_DSL_OFFSET) | (PBLX8))

///////////////////////////////////////////////////////////////////////////////

/* DMACTXCR */
#define ETH_DMACTXCR_OFFSET   0x1104
#define ETH_DMACTXCR          (ETH_BASE + ETH_DMACTXCR_OFFSET)

/* DMACTXCR_TXPBL */
#define ETH_DMACTXCR_TXPBL_OFFSET   16

#define ETH_DMACTXCR_TXPBL_1    (1 << ETH_DMACTXCR_TXPBL_OFFSET)
#define ETH_DMACTXCR_TXPBL_2    (2 << ETH_DMACTXCR_TXPBL_OFFSET)
#define ETH_DMACTXCR_TXPBL_4    (4 << ETH_DMACTXCR_TXPBL_OFFSET)
#define ETH_DMACTXCR_TXPBL_8    (8 << ETH_DMACTXCR_TXPBL_OFFSET)
#define ETH_DMACTXCR_TXPBL_16   (16 << ETH_DMACTXCR_TXPBL_OFFSET)
#define ETH_DMACTXCR_TXPBL_32   (32 << ETH_DMACTXCR_TXPBL_OFFSET)

/* DMACTXCR_ST */
#define ETH_DMACTXCR_ST   1

#define ETH_DMACTXCR_PACK(TXPBL, ST)  \
  ((TXPBL) | (ST))

///////////////////////////////////////////////////////////////////////////////

/* DMACRXCR */

///////////////////////////////////////////////////////////////////////////////

/* DMACTXDLAR */
#define ETH_DMACTXDLAR_OFFSET   0x1114
#define ETH_DMACTXDLAR          (ETH_BASE + ETH_DMACTXDLAR_OFFSET)

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMACRXDLAR */

///////////////////////////////////////////////////////////////////////////////

/* DMACTXDTPR */
#define ETH_DMACTXDTPR_OFFSET   0x1120
#define ETH_DMACTXDTPR          (ETH_BASE + ETH_DMACTXDTPR_OFFSET)

///////////////////////////////////////////////////////////////////////////////

/* DMACRXDTPR */

///////////////////////////////////////////////////////////////////////////////

/* Prepare channel descriptor ring length */
#define ETH_DMA_PREPARE_CDRL(DESCRIPTOR_RING_LENGTH)  \
  ((DESCRIPTOR_RING_LENGTH) - 1)

///////////////////////////////////////////////////////////////////////////////

/* DMACTXRLR */
#define ETH_DMACTXRLR_OFFSET  0x112C
#define ETH_DMACTXRLR         (ETH_BASE + ETH_DMACTXRLR_OFFSET)

///////////////////////////////////////////////////////////////////////////////

/* DMACRXRLR */

///////////////////////////////////////////////////////////////////////////////

/* DMACIER */

///////////////////////////////////////////////////////////////////////////////

/* DMACRXIWTR */

///////////////////////////////////////////////////////////////////////////////

/* DMACCATXDR */

///////////////////////////////////////////////////////////////////////////////

/* DMACCARXDR */

///////////////////////////////////////////////////////////////////////////////

/* DMACCATXBR */

///////////////////////////////////////////////////////////////////////////////

/* DMACCARXBR */

///////////////////////////////////////////////////////////////////////////////

/* DMACSR */
#define ETH_DMACSR_OFFSET   0x1160
#define ETH_DMACSR          (ETH_BASE + ETH_DMACSR)

#define ETH_DMACSR_RESET_MASK   0xFDC7

/* DMACSR_TEB */
#define ETH_DMACSR_TEB_OFFSET   16

#define ETH_DMACSR_TEB_ERROR_DATA_TRANSFER      (4 << ETH_DMACSR_TEB_OFFSET)
#define ETH_DMACSR_TEB_ERROR_DESCRIPTOR_ACCESS  (2 << ETH_DMACSR_TEB_OFFSET)
#define ETH_DMACSR_TEB_ERROR_READ_TRANSFER      (1 << ETH_DMACSR_TEB_OFFSET)

/* DMACSR_CDE */
#define ETH_DMACSR_CDE  (1 << 13)

/* DMACSR_FBE */
#define ETH_DMACSR_FBE  (1 << 12)

/* DMACSR_ERI */
#define ETH_DMACSR_ERI  (1 << 11)

/* DMACSR_ETI */
#define ETH_DMACSR_ETI  (1 << 10)

/* DMACSR_RWT */
#define ETH_DMACSR_RWT  (1 << 9)

/* DMACSR_RPS */
#define ETH_DMACSR_RPS  (1 << 8)

/* DMACSR_RBU */
#define ETH_DMACSR_RBU  (1 << 7)

/* DMACSR_RI */
#define ETH_DMACSR_RI   (1 << 6)

/* DMACSR_TBU */
#define ETH_DMACSR_TBU  (1 << 2)

/* DMACSR_TPS */
#define ETH_DMACSR_TPS  (1 << 1)

/* DMACSR_TI */
#define ETH_DMACSR_TI   (1 << 0)

///////////////////////////////////////////////////////////////////////////////

/* ETH_DMACMFCR */
