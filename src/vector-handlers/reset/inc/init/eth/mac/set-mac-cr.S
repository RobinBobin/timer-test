@ Read LAN8742A_PSCSR
mov32   r1,   ETH_MACMDIOAR_PACK(
                LAN8742A_PSCSR,
                ETH_MACMDIOAR_CR,
                ETH_MACMDIOAR_GOC_READ
              )
str     r1,   [r0, ETH_MACMDIOAR_OFFSET]
bl      .mac_wait_mii

@ to get ...
ldr   r1,   [r0, ETH_MACMDIODR_OFFSET]

@ ... speed into r2
ubfx  r2,   r1,   LAN8742A_PSCSR_SI_100BASE_TX_OFFSET,    1
lsl   r2,   ETH_MACCR_FES_OFFSET

@ ... and duplex into r3
ubfx  r3,   r1,   LAN8742A_PSCSR_SI_FULL_DUPLEX_OFFSET,   1
lsl   r3,   ETH_MACCR_DM_OFFSET


@ Set configuration
mov   r1,   ETH_MACCR_RESET_VALUE       \
              | ETH_MACCR_IPC_DISABLED  \
              | ETH_MACCR_TX_ENABLED
orr   r1,   r2
orr   r1,   r3
str   r1,   [r0, ETH_MACCR_OFFSET]

b     .mac_end
