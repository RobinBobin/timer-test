#define MPU_BASE  0xE000ED90

///////////////////////////////////////////////////////////////////////////////

/* MPU_TYPE */
#define MPU_TYPE_OFFSET   0x00

/* MPU_TYPE_DREGION */
#define MPU_TYPE_DREGION_MASK     0xFF
#define MPU_TYPE_DREGION_OFFSET   0x08

///////////////////////////////////////////////////////////////////////////////

/* MPU_CTRL */
#define MPU_CTRL_OFFSET   0x04

/* MPU_CTRL_ENABLE */
#define MPU_CTRL_ENABLE_OFFSET  0x00

#define MPU_CTRL_DISABLE        0
#define MPU_CTRL_ENABLE         1

/* MPU_CTRL_PRIVDEFENA*/
#define MPU_CTRL_PRIVDEFENA_OFFSET  0x02

#define MPU_CTRL_PRIVDEF_DISABLE  0
#define MPU_CTRL_PRIVDEF_ENABLE   1

#define MPU_CTRL_PACK(PRIVDEF, ENABLE) \
  (((PRIVDEF) << MPU_CTRL_PRIVDEFENA_OFFSET) | ((ENABLE) << MPU_CTRL_ENABLE_OFFSET))

///////////////////////////////////////////////////////////////////////////////

/* MPU_RNR */
#define MPU_RNR_OFFSET    0x08

///////////////////////////////////////////////////////////////////////////////

/* MPU_RBAR */
#define MPU_RBAR_OFFSET   0x0C

/* MPU_RBAR_VALID */
#define MPU_RBAR_INVALID  0
#define MPU_RBAR_VALID    1

/* MPU_RBAR_REGION */
#define MPU_RBAR_REGION_0   0
#define MPU_RBAR_REGION_1   1
#define MPU_RBAR_REGION_2   2
#define MPU_RBAR_REGION_3   3
#define MPU_RBAR_REGION_4   4
#define MPU_RBAR_REGION_5   5
#define MPU_RBAR_REGION_6   6
#define MPU_RBAR_REGION_7   7
#define MPU_RBAR_REGION_8   8
#define MPU_RBAR_REGION_9   9
#define MPU_RBAR_REGION_10  10
#define MPU_RBAR_REGION_11  11
#define MPU_RBAR_REGION_12  12
#define MPU_RBAR_REGION_13  13
#define MPU_RBAR_REGION_14  14
#define MPU_RBAR_REGION_15  15

#define MPU_RBAR_PACK(VALID, REGION) \
  (((VALID) << 4) | (REGION))

///////////////////////////////////////////////////////////////////////////////

/* MPU_RASR */
#define MPU_RASR_OFFSET   0x10

/* MPU_RASR_ENABLE */
#define MPU_RASR_ENABLE_OFFSET  0

#define MPU_RASR_DISABLE        0
#define MPU_RASR_ENABLE         1

/* MPU_RASR_SIZE */
#define MPU_RASR_SIZE_OFFSET  1

/* MPU_RASR_SRD */
#define MPU_RASR_SRD_OFFSET   8

#define MPU_RASR_SR_DISABLE   1
#define MPU_RASR_SR_ENABLE    0

#define MPU_RASR_SRD_NONE   MPU_RASR_SR_ENABLE

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

/* MPU_RASR_B */
#define MPU_RASR_B_OFFSET   16

#define MPU_RASR_B_YES      1
#define MPU_RASR_B_NO       0

/* MPU_RASR_C */
#define MPU_RASR_C_OFFSET   17

#define MPU_RASR_C_YES      1
#define MPU_RASR_C_NO       0

/* MPU_RASR_S */
#define MPU_RASR_S_OFFSET   18

#define MPU_RASR_S_YES      1
#define MPU_RASR_S_NO       0

/* MPU_RASR_TEX*/
#define MPU_RASR_TEX_OFFSET   19

#define MPU_RASR_TEX_0        0
#define MPU_RASR_TEX_1        1
#define MPU_RASR_TEX_2        2
#define MPU_RASR_TEX_4        4

/* MPU_RASR_AP */
#define MPU_RASR_AP_OFFSET  24

#define MPU_RASR_AP_NONE    0
#define MPU_RASR_AP_RW      1
#define MPU_RASR_AP_RW_RO   2
#define MPU_RASR_AP_RW_RW   3
#define MPU_RASR_AP_RO      5
#define MPU_RASR_AP_RO_RO   6

/* MPU_RASR_XN */
#define MPU_RASR_XN_OFFSET  28

#define MPU_RASR_XN_YES     1
#define MPU_RASR_XN_NO      0

#define MPU_RASR_PACK(XN, AP, TEX, S, C, B, SRD, ENABLE)  \
  (                                         \
      ((ENABLE) <<  MPU_RASR_ENABLE_OFFSET) \
    | ((SRD)    <<  MPU_RASR_SRD_OFFSET)    \
    | ((B)      <<  MPU_RASR_B_OFFSET)      \
    | ((C)      <<  MPU_RASR_C_OFFSET)      \
    | ((S)      <<  MPU_RASR_S_OFFSET)      \
    | ((TEX)    <<  MPU_RASR_TEX_OFFSET)    \
    | ((AP)     <<  MPU_RASR_AP_OFFSET)     \
    | ((XN)     <<  MPU_RASR_XN_OFFSET)     \
  )
