cmake_minimum_required(VERSION 3.20)

message(STATUS "👋 ${CMAKE_COMMAND}")

set(TOOLCHAIN_PREFIX  arm-none-eabi-)

set(CMAKE_ASM_COMPILER            ${TOOLCHAIN_PREFIX}gcc)
set(CMAKE_OBJCOPY                 ${TOOLCHAIN_PREFIX}objcopy)
set(CMAKE_SIZE                    ${TOOLCHAIN_PREFIX}size)

set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)
set(CMAKE_SYSTEM_NAME             Generic)
set(CMAKE_SYSTEM_PROCESSOR        arm)

project(timer-test LANGUAGES ASM)

add_executable(${PROJECT_NAME})
set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ".elf")

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

include(compile-options)
include(link-options)

target_compile_definitions(${PROJECT_NAME} PRIVATE 
  $<$<CONFIG:Debug>: 
    DEBUG
  >
)

target_include_directories(${PROJECT_NAME} PRIVATE
  "${CMAKE_CURRENT_SOURCE_DIR}/include"
)

file(
  GLOB_RECURSE
  ASM_SOURCES
  RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
  "src/*.S"
)

target_sources(${PROJECT_NAME} PRIVATE ${ASM_SOURCES})
