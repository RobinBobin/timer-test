mov32   r0,   MPU_BASE

@ Enable MPU
mov   r1,   MPU_CTRL_PACK(
              MPU_CTRL_PRIVDEF_ENABLE,
              MPU_CTRL_ENABLE
            )
str   r1,   [r0, MPU_CTRL_ENABLE_OFFSET]
