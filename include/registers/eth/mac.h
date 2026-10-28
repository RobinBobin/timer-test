///////////////////////////////////////////////////////////////////////////////

/* ETH_MACCR */
#define ETH_MACCR_OFFSET  0x0000
#define ETH_MACCR         (ETH_BASE + ETH_MACCR_OFFSET)

#define ETH_MACCR_RESET_VALUE   0x00008000

/* ETH_MACCR_IPC */
#define ETH_MACCR_IPC_OFFSET  27

#define ETH_MACCR_IPC_DISABLED  (0UL  <<  ETH_MACCR_IPC_OFFSET)
#define ETH_MACCR_IPC_ENABLED   (1UL  <<  ETH_MACCR_IPC_OFFSET)

/* ETH_MACCR_FES */
#define ETH_MACCR_FES_OFFSET  14

#define ETH_MACCR_FES_10    (0UL  <<  ETH_MACCR_FES_OFFSET)
#define ETH_MACCR_FES_100   (1UL  <<  ETH_MACCR_FES_OFFSET)

/* ETH_MACCR_DM */
#define ETH_MACCR_DM_OFFSET   13

#define ETH_MACCR_DM_FULL   (1UL  <<  ETH_MACCR_DM_OFFSET)
#define ETH_MACCR_DM_HALF   (0UL  <<  ETH_MACCR_DM_OFFSET)

/* ETH_MACCR_TE */
#define ETH_MACCR_TE_OFFSET   1

#define ETH_MACCR_TX_DISABLED   (0UL  <<  ETH_MACCR_TE_OFFSET)
#define ETH_MACCR_TX_ENABLED    (1UL  <<  ETH_MACCR_TE_OFFSET)

/* ETH_MACCR_PACK */
#define ETH_MACCR_PACK(IPC, TE)   \
  (                               \
    ETH_MACCR_RESET_VALUE         \
      | (IPC)                     \
      | (TE)                      \
  )

///////////////////////////////////////////////////////////////////////////////

/* ETH_MACECR */

///////////////////////////////////////////////////////////////////////////////

/* ETH_MACPFR */
#define ETH_MACPFR_OFFSET   0x0008
#define ETH_MACPFR          (ETH_BASE + ETH_MACPFR_OFFSET)

///////////////////////////////////////////////////////////////////////////////

/*  */

///////////////////////////////////////////////////////////////////////////////

/*  */

///////////////////////////////////////////////////////////////////////////////

/*  */

///////////////////////////////////////////////////////////////////////////////

/*  */

///////////////////////////////////////////////////////////////////////////////

/*  */

///////////////////////////////////////////////////////////////////////////////

/* ETH_MACMDIOAR */
#define ETH_MACMDIOAR_OFFSET  0x0200
#define ETH_MACMDIOAR         (ETH_BASE + ETH_MACMDIOAR_OFFSET)

/* ETH_MACMDIOAR_RDA */
#define ETH_MACMDIOAR_RDA_OFFSET  16

/* ETH_MACMDIOAR_CR */
#define ETH_MACMDIOAR_CR_OFFSET   8

#define ETH_MACMDIOAR_CR_42   (0UL  <<  ETH_MACMDIOAR_CR_OFFSET)
#define ETH_MACMDIOAR_CR_62   (1UL  <<  ETH_MACMDIOAR_CR_OFFSET)
#define ETH_MACMDIOAR_CR_16   (2UL  <<  ETH_MACMDIOAR_CR_OFFSET)
#define ETH_MACMDIOAR_CR_26   (3UL  <<  ETH_MACMDIOAR_CR_OFFSET)
#define ETH_MACMDIOAR_CR_102  (4UL  <<  ETH_MACMDIOAR_CR_OFFSET)
#define ETH_MACMDIOAR_CR_124  (5UL  <<  ETH_MACMDIOAR_CR_OFFSET)

/* ETH_MACMDIOAR_GOC */
#define ETH_MACMDIOAR_GOC_OFFSET  2

#define ETH_MACMDIOAR_GOC_WRITE   (1UL  <<  ETH_MACMDIOAR_GOC_OFFSET)
#define ETH_MACMDIOAR_GOC_READ    (3UL  <<  ETH_MACMDIOAR_GOC_OFFSET)

/* ETH_MACMDIOAR_MB */
#define ETH_MACMDIOAR_MB_OFFSET   0

#define ETH_MACMDIOAR_MB  (1UL  <<  ETH_MACMDIOAR_MB_OFFSET)

/* ETH_MACMDIOAR_PACK */
#define ETH_MACMDIOAR_PACK(RDA, CR, GOC)  \
  (                                       \
    ((RDA) << ETH_MACMDIOAR_RDA_OFFSET)   \
      | (CR)                              \
      | (GOC)                             \
      | (ETH_MACMDIOAR_MB)                \
  )

///////////////////////////////////////////////////////////////////////////////

/* ETH_MACMDIODR */
#define ETH_MACMDIODR_OFFSET  0x0204
#define ETH_MACMDIODR         (ETH_BASE + ETH_MACMDIODR_OFFSET)

/* ETH_MACMDIODR_MD_MASK */
#define ETH_MACMDIODR_MD_MASK   0xFFFFUL

///////////////////////////////////////////////////////////////////////////////

/* ETH_MACA0HR */
#define ETH_MACA0HR_OFFSET  0x0300
#define ETH_MACA0HR         (ETH_BASE + ETH_MACA0HR_OFFSET)

///////////////////////////////////////////////////////////////////////////////

/* ETH_MACAxLR */
#define ETH_MACAxLR_OFFSET(X) \
  (0x0304 + 0x8 * (X))

#define ETH_MACAxLR(X) \
  (ETH_BASE + ETH_MACAxLR_OFFSET((X)))

#define ETH_MACA0LR_OFFSET  ETH_MACAxLR_OFFSET(0)
#define ETH_MACA0LR         ETH_MACAxLR(0)
