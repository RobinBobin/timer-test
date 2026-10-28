mov32   r0,   ETH_BASE

#include "configuration/reset-phy.S"
#include "configuration/wait-link.S"
#include "configuration/set-mac-cr.S"

.mac_configuration_wait_mii:
  ldr   r1,   [r0, ETH_MACMDIOAR_OFFSET]
  tst   r1,   ETH_MACMDIOAR_MB
  bne   .mac_configuration_wait_mii

  bx lr

.mac_configuration_end:
