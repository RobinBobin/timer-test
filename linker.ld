ENTRY(Reset_Handler)

MEMORY {
  VECTOR_TABLE  (r)   :   ORIGIN = 0x08000000, LENGTH = 0x2A0
  FLASH1        (rx)  :   ORIGIN = 0x080002A0, LENGTH = 1047904
  ETH_SECTION   (rw)  :   ORIGIN = 0x30000000, LENGTH = 4 * (16 + 2032)
}

SECTIONS {
  .vector-table : ALIGN(4) {
    VECTOR_TABLE_ADDRESS = .;
    KEEP(*(.vector-table))
  } > VECTOR_TABLE

  .vector-handlers : ALIGN(4) {
    *(.vector-handlers)
  } > FLASH1

  .flash1 : ALIGN(4){
    *(.flash1)
  } > FLASH1

  .eth-section (NOLOAD) : ALIGN(32) {
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
