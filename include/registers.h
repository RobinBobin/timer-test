#include "registers/eth.h"
#include "registers/flash.h"
#include "registers/gpio.h"
#include "registers/lan8742a.h"
#include "registers/mpu.h"
#include "registers/pwr.h"
#include "registers/rcc.h"
#include "registers/scb.h"
#include "registers/syscfg.h"
#include "registers/syst.h"

#define ETH_DMA_TDES3                   \
  ETH_DMA_TDES3_OWN                     \
    | ETH_DMA_TDES3_FD                  \
    | ETH_DMA_TDES3_LD                  \
    | ETH_DMA_TDES3_CPC_CRC_PAD_INSERT  \
    | ETH_DMA_TDES3_CIC_IP

#define ETH_MACMDIOAR_CR  ETH_MACMDIOAR_CR_102
