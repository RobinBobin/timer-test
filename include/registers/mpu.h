#define MPU_BASE  0xE000ED90

/* TYPE */
#define MPU_TYPE_OFFSET   0x00

#define MPU_TYPE_DREGION_MASK     0xFF
#define MPU_TYPE_DREGION_OFFSET   0x08

/* CTRL */
#define MPU_CTRL_OFFSET   0x04

/* CTRL_ENABLE */
#define MPU_CTRL_ENABLE_OFFSET  0x00

#define MPU_CTRL_DISABLE        0
#define MPU_CTRL_ENABLE         1

/* CTRL_PRIVDEFENA*/
#define MPU_CTRL_PRIVDEFENA_OFFSET  0x02

#define MPU_CTRL_PRIVDEF_DISABLE  0
#define MPU_CTRL_PRIVDEF_ENABLE   1

#define MPU_CTRL_PACK(PRIVDEF, ENABLE) \
  (((PRIVDEF) << MPU_CTRL_PRIVDEFENA_OFFSET) | ((ENABLE) << MPU_CTRL_ENABLE_OFFSET))

/* RNR */
#define MPU_RNR_OFFSET    0x08

/* RBAR */
#define MPU_RBAR_OFFSET   0x0C

#define MPU_RBAR_INVALID  0
#define MPU_RBAR_VALID    1

#define MPU_RBAR_PACK(ADDR, ADDR_OFFSET, VALID, REGION) \
  (((ADDR) & (~(1UL << (ADDR_OFFSET) - 1))) | ((VALID) << 4) | (REGION))

/* RASR */
#define MPU_RASR_OFFSET   0x10

/* RASR_ENABLE */
#define MPU_RASR_ENABLE_OFFSET  0

#define MPU_RASR_DISABLE        0
#define MPU_RASR_ENABLE         1

/* RASR_SIZE */
#define MPU_RASR_SIZE_OFFSET  1

/* RASR_SRD */
#define MPU_RASR_SRD_OFFSET   8

#define MPU_RASR_SR_DISABLE   1
#define MPU_RASR_SR_ENABLE    0

#define MPU_RASR_SRD_PACK(SR1, SR2, SR3, SR4, SR5, SR6, SR7, SR8) \
  (                 \
      ((SR1) << 1)  \
    | ((SR2) << 2)  \
    | ((SR3) << 3)  \
    | ((SR4) << 4)  \
    | ((SR5) << 5)  \
    | ((SR6) << 6)  \
    | ((SR7) << 7)  \
    | ((SR8) << 8)  \
  )

/* RASR_B */
#define MPU_RASR_B_OFFSET   16

#define MPU_RASR_B_YES      1
#define MRU_RASR_B_NO       0

/* RASR_C */
#define MPU_RASR_C_OFFSET   17

#define MPU_RASR_C_YES      1
#define MRU_RASR_C_NO       0

/* RASR_S */
#define MPU_RASR_S_OFFSET   18

#define MPU_RASR_S_YES      1
#define MRU_RASR_S_NO       0

/* RASR_TEX*/
#define MPU_RASR_TEX_OFFSET   19

#define MPU_RASR_TEX_0        0
#define MPU_RASR_TEX_1        1
#define MPU_RASR_TEX_2        2
#define MPU_RASR_TEX_4        4

/* RASR_AP */
#define MPU_RASR_AP_OFFSET  24

#define MPU_RASR_AP_NONE    0
#define MPU_RASR_AP_RW      1
#define MPU_RASR_AP_RW_RO   2
#define MPU_RASR_AP_RW_RW   3
#define MPU_RASR_AP_RO      5
#define MPU_RASR_AP_RO_RO   6

/* RASR_XN */
#define MPU_RASR_XN_OFFSET  28

#define MPU_RASR_XN_YES     1
#define MPU_RASR_XN_NO      0

#define MPU_RASR_PACK(ENABLE, SIZE, SRD, B, C, S, TEX, AP, XN)  \
  (                                         \
      ((ENABLE) <<  MPU_RASR_ENABLE_OFFSET) \
    | ((SIZE)   <<  MPU_RASR_SIZE_OFFSET)   \
    | ((SRD)    <<  MPU_RASR_SRD_OFFSET)    \
    | ((B)      <<  MPU_RASR_B_OFFSET)      \
    | ((C)      <<  MPU_RASR_C_OFFSET)      \
    | ((S)      <<  MPU_RASR_S_OFFSET)      \
    | ((TEX)    <<  MPU_RASR_TEX_OFFSET)    \
    | ((AP)     <<  MPU_RASR_AP_OFFSET)     \
    | ((XN)     <<  MPU_RASR_XN_OFFSET)     \
  )
