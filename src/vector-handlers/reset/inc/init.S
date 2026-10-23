cpsid   i

#include "./init/general.S"
#include "./init/pwr.S"
#include "./init/rcc.S"

#include "./init/gpio.S"
#include "./init/mpu.S"
#include "./init/syscfg.S"
#include "./init/eth.S"

dsb
isb
cpsie   i
