@ Reset...
mov   r1,   LAN8742A_BCR_RESET
str   r1,   [r0, ETH_MACMDIODR_OFFSET]

mov   r1,   ETH_MACMDIOAR_PACK(
              LAN8742A_BCR,
              ETH_MACMDIOAR_CR,
              ETH_MACMDIOAR_GOC_WRITE
            )
str   r1,   [r0, ETH_MACMDIOAR_OFFSET]
bl    .mac_wait_mii

@ ... and wait for the bit to be cleared
.mac_reset_phy_rdy:
  mov   r1,   ETH_MACMDIOAR_PACK(
                LAN8742A_BCR,
                ETH_MACMDIOAR_CR,
                ETH_MACMDIOAR_GOC_READ
              )
  str   r1,   [r0, ETH_MACMDIOAR_OFFSET]
  bl    .mac_wait_mii

  ldr   r1,   [r0, ETH_MACMDIODR_OFFSET]
  tst   r1,   LAN8742A_BCR_RESET
  bne   .mac_reset_phy_rdy
