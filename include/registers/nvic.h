#include "./scb.h"

#define NVIC_INTERRUPT_DISABLED 0
#define NVIC_INTERRUPT_ENABLED  1

#define NVIC_ISER_ENABLE  1

#define NVIC_ISER0  (SCB_BASE + 0x100)
#define NVIC_ISER1  (NVIC_ISER0 + 4)
