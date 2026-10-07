#define SYST_BASE   0xE000E010

/* CSR */
#define SYST_CSR_OFFSET       0x00

#define SYST_CSR_RESET_VALUE  0x00000004

#define SYST_CSR_ENABLE     (1 << 0)
#define SYST_CSR_COUNTFLAG  (1 << 16)

/* RVR */
#define SYST_RVR_OFFSET   0x04

/* CVR */
#define SYST_CVR_OFFSET   0x08
