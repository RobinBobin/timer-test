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

.main_loop:
  #include "./inc/main-loop.S"
  b .main_loop
