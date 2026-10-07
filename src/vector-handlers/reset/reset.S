.syntax unified

.global Reset_Handler

#include "constants.h"
#include "macros.s"
#include "registers.h"
#include "variables.S"

.section .vector-handlers, "ax"
.thumb_func
Reset_Handler:
  #include "./inc/init.S"

  @ Start SysTick
  mov     r1,   SYST_CSR_RESET_VALUE | SYST_CSR_ENABLE
  str     r1,   [r8, SYST_CSR_OFFSET]

.main_loop:
  ldr   r1,   [r8,  SYST_CSR_OFFSET]
  tst   r1,   SYST_TICKED
  beq   .main_loop

  #include "./inc/main-loop.S"
  b .main_loop
