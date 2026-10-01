ENTRY(Reset_Handler)

MEMORY {
  FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 1024K
}

SECTIONS {
  .text : {
    . = ALIGN(4);
    KEEP(*(.text))
    . = ALIGN(4);
  } > FLASH
}
