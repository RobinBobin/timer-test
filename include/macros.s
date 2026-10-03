.macro mov32, reg, val
  movw  \reg,   :lower16:(\val)
  movt  \reg,   :upper16:(\val)
.endm
