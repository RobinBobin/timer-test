include(arch-flags)

target_link_options(${PROJECT_NAME} PRIVATE
  ${ARCH_FLAGS}
  "LINKER:-T,${CMAKE_CURRENT_SOURCE_DIR}/linker.ld"
  -Wl,-Map=${CMAKE_CURRENT_BINARY_DIR}/output.map
  -Wl,--cref
  -Wl,--fatal-warnings
  -Wl,--gc-sections
  -Wl,--print-memory-usage
  -nostartfiles
  -nostdlib
)