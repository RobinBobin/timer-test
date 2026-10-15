///////////////////////////////////////////////////////////////////////////////

/* General state */

.struct 0
/* Button */
BUTTON_DEBOUNCE_COUNTER:  .word   0
BUTTON_STATE:             .word   0

/* Leds */
LED_COUNTER:  .word   0
LED_MODE:     .word   0

///////////////////////////////////////////////////////////////////////////////

/* ETH state */

.struct 0
TDES0:      .word   0
TDES1:      .word   0
TDES2:      .word   0
TDES3:      .word   0
TX_BUFFER:  .word   0
