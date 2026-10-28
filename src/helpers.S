.syntax unified

.global  delay

#include "registers.h"
#include "macros.s"

.section .flash1, "ax"
.thumb_func

@ 
@ Delay for r1 millis
@ 

delay:
  @ Exit if r1 is 0
  cmp   r1,   0
  it    eq
  bxeq  lr


  @ Reset SysTick current value
  mov   r2,   0
  str   r2,   [r8, SYST_CVR_OFFSET]


  @ Wait
  .sleep_body:
    wait  .sleep_body

    sub   r1,   1
    cmp   r1,   0
    it    eq
    bxeq  lr
    b     .sleep_body
