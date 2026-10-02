.syntax unified

.global Reset_Handler

#include "constants.h"

.section .vector-handlers, "ax"
.thumb_func
Reset_Handler:
  bkpt #42

  mov r0, 0x30
  push {r0}

  mov r0, 0x20
  push {r0}

  pop {r0}
  pop {r0}

  mov r0, SUPER_VALUE

.loop:
  b .loop
