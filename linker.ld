ENTRY(Reset_Handler)

/* ethernet frame size + DMA padding + power of 2 padding */
ETH_TBUF_SIZE   =   1514 + 22 + 512;

ETH_TDES_COUNT          =   4;
ETH_TDES_SECTION_SIZE   =   ETH_TDES_COUNT * 16;
ETH_TBUF_SECTION_SIZE   =   ETH_TDES_COUNT * ETH_TBUF_SIZE;

MEMORY {
  VECTOR_TABLE  (r)   :   ORIGIN = 0x08000000, LENGTH = 0x2A0
  FLASH1        (rx)  :   ORIGIN = 0x080002A0, LENGTH = 1047904
  SRAM1         (rw)  :   ORIGIN = 0x30000000, LENGTH = 0x20000
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

  .eth-tdes (NOLOAD) : ALIGN(ETH_TDES_SECTION_SIZE) {
    ASSERT(
      ETH_TDES_SECTION_SIZE >= 32,
      "ETH_TDES_SECTION_SIZE must be >= 32"
    );

    ETH_TDES_SECTION_ADDRESS = .;

    ETH_TDES_MPU_RASR_SIZE = LOG2CEIL(ETH_TDES_SECTION_SIZE);

    ASSERT(
      (1 << ETH_TDES_MPU_RASR_SIZE) == ETH_TDES_SECTION_SIZE,
      "Error: ETH_TDES_SECTION_SIZE must be an exact power of 2"
    );

    ETH_TDES_MPU_RASR_SIZE = ETH_TDES_MPU_RASR_SIZE - 1;

    . += ETH_TDES_SECTION_SIZE;
  } > SRAM1

  .eth-tbuf (NOLOAD) : ALIGN(ETH_TBUF_SECTION_SIZE) {
    ASSERT(
      ETH_TBUF_SECTION_SIZE >= 32,
      "ETH_TBUF_SECTION_SIZE must be >= 32"
    );

    ETH_TBUF_SECTION_ADDRESS = .;

    ETH_TBUF_MPU_RASR_SIZE = LOG2CEIL(ETH_TBUF_SECTION_SIZE);

    ASSERT(
      (1 << ETH_TBUF_MPU_RASR_SIZE) == ETH_TBUF_SECTION_SIZE,
      "Error: ETH_TBUF_SECTION_SIZE must be an exact power of 2"
    );

    ETH_TBUF_MPU_RASR_SIZE = ETH_TBUF_MPU_RASR_SIZE - 1;

    . += ETH_TBUF_SECTION_SIZE;
  } > SRAM1
}
