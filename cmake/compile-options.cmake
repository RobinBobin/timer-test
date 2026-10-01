include(arch-flags)

set(COMPILE_OPTIONS
  ${ARCH_FLAGS}
  -Wa,--fatal-warnings
  -Wa,--warn
  -Wall
  -Werror
  -Wextra
)

target_compile_options(${PROJECT_NAME} PRIVATE
  ${COMPILE_OPTIONS}
  $<$<CONFIG:Debug>:
    -O0
    -ggdb3
  >
  $<$<CONFIG:Release>:
    -O3
  >
)
