cpsid   i

#include "./init/general.S"
#include "./init/rcc.S"
#include "./init/gpio.S"
#include "./init/pwr.S"
#include "./init/syscfg.S"

dsb
isb
cpsie   i
