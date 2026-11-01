@ Enable Store-and-forward
mov32   r0,   ETH_MTLTXQOMR
mov     r1,   ETH_MTLTXQOMR_TSF_ENABLED
str     r1,   [r0]
