.syntax unified

.global Reset_Handler

#include "macros.s"
#include "registers.h"

.section .vector-handlers, "ax"
.thumb_func
Reset_Handler:
  cpsid   i

  mov32   r0,   SCB_VTOR
  mov32   r1,   VECTOR_TABLE_ADDRESS
  str     r1,   [r0]

  #include "./inc/tim6.S"

  dsb
  isb
  cpsie   i

  b .
