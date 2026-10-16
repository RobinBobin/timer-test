.mac_configuration_read_bsr:
  mov32   r0,   ETH_MACMDIOAR
  mov32   r1,   ETH_MACMDIOAR_PACK(
                  LAN8742A_BSR,
                  ETH_MACMDIOAR_GOC_READ
                )
  str     r1,   [r0]
  bl      .mac_configuration_wait_mii

  @ Check LINK_UP and AUTO_NEGOTIATE_COMPLETE
  mov32   r0,   ETH_MACMDIODR
  ldr     r1,   [r0]
  and     r1,   LAN8742A_BSR_LINK_UP | LAN8742A_BSR_AUTO_NEGOTIATE_COMPLETE
  cmp     r1,   LAN8742A_BSR_LINK_UP | LAN8742A_BSR_AUTO_NEGOTIATE_COMPLETE
  bne     .mac_configuration_read_bsr

  @ Read LAN8742A_PSCSR
  mov32   r0,   ETH_MACMDIOAR
  mov32   r1,   ETH_MACMDIOAR_PACK(
                  LAN8742A_PSCSR,
                  ETH_MACMDIOAR_GOC_READ
                )
  str     r1,   [r0]
  bl      .mac_configuration_wait_mii

  @ Get speed and duplex
  mov32   r0,   ETH_MACMDIODR
  ldr     r1,   [r0]

  @ Speed
  ubfx    r2,   r1,   LAN8742A_PSCSR_SI_100BASE_TX_OFFSET,    1
  lsl     r2,   ETH_MACCR_FES_OFFSET

  @ Duplex
  ubfx    r3,   r1,   LAN8742A_PSCSR_SI_FULL_DUPLEX_OFFSET,   1
  lsl     r3,   ETH_MACCR_DM_OFFSET

  @ Set configuration
  mov32   r0,   ETH_MACCR

  b       .mac_configuration_end

.mac_configuration_wait_mii:
  ldr   r1,   [r0]
  tst   r1,   ETH_MACMDIOAR_MB
  bne   .mac_configuration_wait_mii

  bx lr

@ End
.mac_configuration_end:
