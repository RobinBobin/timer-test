.cpu cortex-m7
.syntax unified
.thumb

.global Reset_Handler

#include "constants.h"

.text
  .word 0x20020000
  .word Reset_Handler

.thumb_func
Reset_Handler:
  mov r0, 0x30
  push {r0}

  mov r0, 0x20
  push {r0}

  pop {r0}
  pop {r0}

  mov r0, SUPER_VALUE

.loop:
  b .loop
