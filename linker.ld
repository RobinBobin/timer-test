ENTRY(Reset_Handler)

MEMORY {
  VECTOR_TABLE    (r)   : ORIGIN = 0x08000000, LENGTH = 0x2A0
  VECTOR_HANDLERS (rx)  : ORIGIN = 0x080002A0, LENGTH = 0x2900
  FLASH1          (rx)  : ORIGIN = 0x08002BA0, LENGTH = 1037408
}

SECTIONS {
  .vector-table : {
    . = ALIGN(4);
    KEEP(*(.vector-table))
    . = ALIGN(4);
  } > VECTOR_TABLE

  .vector-handlers : {
    . = ALIGN(4);
    *(.vector-handlers)
    . = ALIGN(4);
  } > VECTOR_HANDLERS

  .text : {
    . = ALIGN(4);
    *(.text)
    . = ALIGN(4);
  } > FLASH1
}
