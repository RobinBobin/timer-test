.syntax unified

.section .vector-table, "a"
  .word 0x20020000
  .word Reset_Handler

  .org 0x000000E0, 0
  .word EXTI15_10_Handler

  .org 0x00000118, 0
  .word TIM6_DAC_Handler
