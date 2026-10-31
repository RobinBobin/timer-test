#include "mac/set-mac-address.S"

mov32   r0,   ETH_BASE

#include "mac/reset-phy.S"
#include "mac/wait-link.S"
#include "mac/set-mac-cr.S"

.mac_wait_mii:
  ldr   r1,   [r0, ETH_MACMDIOAR_OFFSET]
  tst   r1,   ETH_MACMDIOAR_MB
  bne   .mac_wait_mii

  bx lr

.mac_end:
