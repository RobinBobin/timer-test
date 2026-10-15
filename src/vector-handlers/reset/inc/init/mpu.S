mov32   r0,   MPU_BASE

@ Enable MPU
mov   r1,   MPU_CTRL_PACK(
              MPU_CTRL_PRIVDEF_ENABLE,
              MPU_CTRL_ENABLE
            )
str   r1,   [r0, MPU_CTRL_ENABLE_OFFSET]

@ 
@ ETH_SECTION
@ 

@ MPU_RBAR
mov32   r1,   ETH_SECTION_ADDRESS
orr     r1,   MPU_RBAR_PACK(
                MPU_RBAR_VALID,
                MPU_RBAR_REGION_0
              )
str     r1,   [r0, MPU_RBAR_OFFSET]

@ MPU_RASR
movw    r1,   :lower16:(ETH_MPU_RASR_SIZE)
lsl     r1,   MPU_RASR_SIZE_OFFSET
mov32   r2,   MPU_RASR_PACK(
                MPU_RASR_XN_YES,
                MPU_RASR_AP_RW,
                MPU_RASR_TEX_0,
                MPU_RASR_S_YES,
                MPU_RASR_C_NO,
                MPU_RASR_B_NO,
                MPU_RASR_SRD_NONE,
                MPU_RASR_ENABLE
              )
orr     r1,   r2
str     r1,   [r0, MPU_RASR_OFFSET]
