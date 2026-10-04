#define EXTI_BASE   0x58000000

/* RTSR1 / FTSR1 */
#define EXTI_RTSR1_OFFSET   0x00
#define EXTI_FTSR1_OFFSET   0x04

#define EXTI_RTSR1  (EXTI_BASE + EXTI_RTSR1_OFFSET)
#define EXTI_FTSR1  (EXTI_BASE + EXTI_FTSR1_OFFSET)

#define EXTI_xTSR1_TR0    (1 << 0)
#define EXTI_xTSR1_TR1    (1 << 1)
#define EXTI_xTSR1_TR2    (1 << 2)
#define EXTI_xTSR1_TR3    (1 << 3)
#define EXTI_xTSR1_TR4    (1 << 4)
#define EXTI_xTSR1_TR5    (1 << 5)
#define EXTI_xTSR1_TR6    (1 << 6)
#define EXTI_xTSR1_TR7    (1 << 7)
#define EXTI_xTSR1_TR8    (1 << 8)
#define EXTI_xTSR1_TR9    (1 << 9)
#define EXTI_xTSR1_TR10   (1 << 10)
#define EXTI_xTSR1_TR11   (1 << 11)
#define EXTI_xTSR1_TR12   (1 << 12)
#define EXTI_xTSR1_TR13   (1 << 13)
#define EXTI_xTSR1_TR14   (1 << 14)
#define EXTI_xTSR1_TR15   (1 << 15)
#define EXTI_xTSR1_TR16   (1 << 16)
#define EXTI_xTSR1_TR17   (1 << 17)
#define EXTI_xTSR1_TR18   (1 << 18)
#define EXTI_xTSR1_TR19   (1 << 19)
#define EXTI_xTSR1_TR20   (1 << 20)
#define EXTI_xTSR1_TR21   (1 << 21)

/* CnIMR1 */
#define EXTI_C1IMR1_OFFSET  0x80
#define EXTI_C2IMR1_OFFSET  0xC0

#define EXTI_C1IMR1   (EXTI_BASE + EXTI_C1IMR1_OFFSET)
#define EXTI_C2IMR1   (EXTI_BASE + EXTI_C2IMR1_OFFSET)

#define EXTI_CnIMR1_RESET_VALUE   0xFFC00000

#define EXTI_CnIMR1_MR0   (1 << 0)
#define EXTI_CnIMR1_MR1   (1 << 1)
#define EXTI_CnIMR1_MR2   (1 << 2)
#define EXTI_CnIMR1_MR3   (1 << 3)
#define EXTI_CnIMR1_MR4   (1 << 4)
#define EXTI_CnIMR1_MR5   (1 << 5)
#define EXTI_CnIMR1_MR6   (1 << 6)
#define EXTI_CnIMR1_MR7   (1 << 7)
#define EXTI_CnIMR1_MR8   (1 << 8)
#define EXTI_CnIMR1_MR9   (1 << 9)
#define EXTI_CnIMR1_MR10  (1 << 10)
#define EXTI_CnIMR1_MR11  (1 << 11)
#define EXTI_CnIMR1_MR12  (1 << 12)
#define EXTI_CnIMR1_MR13  (1 << 13)
#define EXTI_CnIMR1_MR14  (1 << 14)
#define EXTI_CnIMR1_MR15  (1 << 15)

/* CnPR1 */
#define EXTI_C1PR1_OFFSET   0x88
#define EXTI_C2PR1_OFFSET   0xC8

#define EXTI_C1PR1  (EXTI_BASE + EXTI_C1PR1_OFFSET)
#define EXTI_C2PR1  (EXTI_BASE + EXTI_C2PR1_OFFSET)

#define EXTI_CnPR1_PR1    (1 << 1)
#define EXTI_CnPR1_PR2    (1 << 2)
#define EXTI_CnPR1_PR3    (1 << 3)
#define EXTI_CnPR1_PR4    (1 << 4)
#define EXTI_CnPR1_PR5    (1 << 5)
#define EXTI_CnPR1_PR6    (1 << 6)
#define EXTI_CnPR1_PR7    (1 << 7)
#define EXTI_CnPR1_PR8    (1 << 8)
#define EXTI_CnPR1_PR9    (1 << 9)
#define EXTI_CnPR1_PR10   (1 << 10)
#define EXTI_CnPR1_PR11   (1 << 11)
#define EXTI_CnPR1_PR12   (1 << 12)
#define EXTI_CnPR1_PR13   (1 << 13)
#define EXTI_CnPR1_PR14   (1 << 14)
#define EXTI_CnPR1_PR15   (1 << 15)
#define EXTI_CnPR1_PR16   (1 << 16)
#define EXTI_CnPR1_PR17   (1 << 17)
#define EXTI_CnPR1_PR18   (1 << 18)
#define EXTI_CnPR1_PR19   (1 << 19)
#define EXTI_CnPR1_PR20   (1 << 20)
#define EXTI_CnPR1_PR21   (1 << 21)
