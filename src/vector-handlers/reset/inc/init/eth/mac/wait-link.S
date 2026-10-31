@ A recheck is to be performed
mov   r3,   1


@ Wait for the connection
.mac_wait_link:
  mov32   r1,   ETH_MACMDIOAR_PACK(
                  LAN8742A_BSR,
                  ETH_MACMDIOAR_CR,
                  ETH_MACMDIOAR_GOC_READ
                )
  str     r1,   [r0, ETH_MACMDIOAR_OFFSET]
  bl      .mac_wait_mii

  @ Check LINK_UP and AUTO_NEGOTIATE_COMPLETE
  ldr     r1,   [r0, ETH_MACMDIODR_OFFSET]
  mov     r2,   LAN8742A_BSR_LINK_UP | LAN8742A_BSR_AUTO_NEGOTIATE_COMPLETE
  and     r1,   r2
  cmp     r1,   r2
  bne     .mac_wait_link


  @ Exit if rechecked
  cbz   r3,   .mac_wait_link_end


  @ Wait for 100 millis
  mov   r1,   100
  bl    delay


  @ Recheck
  mov   r3,   0
  b     .mac_wait_link


@ End
.mac_wait_link_end:
