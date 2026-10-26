.syntax unified

.global Reset_Handler

#include "constants.h"
#include "registers.h"
#include "macros.s"
#include "variables.S"

.section .vector-handlers, "ax"
.thumb_func
Reset_Handler:
  #include "./inc/init.S"

  @ Reset SysTick current value
  mov   r1,   0
  str   r1,   [r8, SYST_CVR_OFFSET]

.main_loop:
  wait  .main_loop

  #include "./inc/main-loop.S"

  b   .main_loop
