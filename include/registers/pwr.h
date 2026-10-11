#define PWR_BASE 0x58024800

/* PWR_D3CR */
#define PWR_D3CR_OFFSET   0x018
#define PWR_D3CR          (PWR_BASE + PWR_D3CR_OFFSET)

/* D3CR_VOSRDY */
#define PWR_D3CR_VOSRDY   (1 << 13)

/* D3CR_VOS */
#define PWR_D3CR_VOS_OFFSET   14

#define PWR_D3CR_VOS_VOS3   1
#define PWR_D3CR_VOS_VOS2   2
#define PWR_D3CR_VOS_VOS1   3
