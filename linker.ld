ENTRY(Reset_Handler)

MEMORY {
  VECTOR_TABLE      (r)   :   ORIGIN = 0x08000000, LENGTH = 0x2A0
  VECTOR_HANDLERS   (rx)  :   ORIGIN = 0x080002A0, LENGTH = 0x2900
  FLASH1            (rx)  :   ORIGIN = 0x08002BA0, LENGTH = 1037408
  ETH_SECTION       (rw)  :   ORIGIN = 0x30000000, LENGTH = 4 * (16 + 2032)
}

SECTIONS {
  .vector-table : {
    . = ALIGN(4);
    VECTOR_TABLE_ADDRESS = .;
    KEEP(*(.vector-table))
    . = ALIGN(4);
  } > VECTOR_TABLE

  .vector-handlers : {
    . = ALIGN(4);
    *(.vector-handlers)
    . = ALIGN(4);
  } > VECTOR_HANDLERS

  .eth-section (NOLOAD) : {
    ETH_SECTION_ADDRESS = .;

    . += LENGTH(ETH_SECTION);

    ETH_SECTION_SIZE = SIZEOF(.eth-section);

    ETH_MPU_RASR_SIZE = LOG2CEIL(ETH_SECTION_SIZE);

    ASSERT(
      (1 << ETH_MPU_RASR_SIZE) == ETH_SECTION_SIZE,
      "Error: ETH_SECTION_SIZE must be an exact power of 2"
    );

    ETH_MPU_RASR_SIZE = ETH_MPU_RASR_SIZE - 1;
  } > ETH_SECTION
}
