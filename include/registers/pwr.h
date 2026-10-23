#define PWR_BASE 0x58024800

///////////////////////////////////////////////////////////////////////////////

/* PWR_CSR1 */
#define PWR_CSR1_OFFSET   0x004
#define PWR_CSR1          (PWR_BASE + PWR_CSR1_OFFSET)

/* PWR_CSR1_ACTVOS */
#define PWR_CSR1_ACTVOS_OFFSET  14

#define PWR_CSR1_ACTVOS_VOS3  (1 << PWR_CSR1_ACTVOS_OFFSET)
#define PWR_CSR1_ACTVOS_VOS2  (2 << PWR_CSR1_ACTVOS_OFFSET)
#define PWR_CSR1_ACTVOS_VOS1  (3 << PWR_CSR1_ACTVOS_OFFSET)

/* PWR_CSR1_ACTVOSRDY */
#define PWR_CSR1_ACTVOSRDY_OFFSET   13
#define PWR_CSR1_ACTVOSRDY          (1 << PWR_CSR1_ACTVOSRDY_OFFSET)

///////////////////////////////////////////////////////////////////////////////

/* PWR_CR3 */
#define PWR_CR3_OFFSET  0x00C
#define PWR_CR3         (PWR_BASE + PWR_CR3_OFFSET)

/* PWR_CR3_SDEN */
#define PWR_CR3_SDEN  (1 << 2)

/* PWR_CR3_SDLEVEL */
#define PWR_CR3_SDLEVEL_OFFSET  4

#define PWR_CR3_SDLEVEL_1V8   (1 << PWR_CR3_SDLEVEL_OFFSET)
#define PWR_CR3_SDLEVEL_2V5   (2 << PWR_CR3_SDLEVEL_OFFSET)

///////////////////////////////////////////////////////////////////////////////

/* PWR_D3CR */
#define PWR_D3CR_OFFSET   0x018
#define PWR_D3CR          (PWR_BASE + PWR_D3CR_OFFSET)

/* PWR_D3CR_VOSRDY */
#define PWR_D3CR_VOSRDY   (1 << 13)

/* PWR_D3CR_VOS */
#define PWR_D3CR_VOS_OFFSET   14

#define PWR_D3CR_VOS_VOS3   (1 << PWR_D3CR_VOS_OFFSET)
#define PWR_D3CR_VOS_VOS2   (2 << PWR_D3CR_VOS_OFFSET)
#define PWR_D3CR_VOS_VOS1   (3 << PWR_D3CR_VOS_OFFSET)
