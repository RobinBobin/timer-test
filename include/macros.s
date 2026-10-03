.macro mov32, reg, val
  movw  \reg,   #(\val) & 0xFFFF
  movt  \reg,   #(\val) >> 16
.endm
