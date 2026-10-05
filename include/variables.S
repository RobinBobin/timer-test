/* Button states */
#define BUTTON_STATE_NONE       -1
#define BUTTON_STATE_RAW_UP     0
#define BUTTON_STATE_RAW_DOWN   1
#define BUTTON_STATE_UP         2
#define BUTTON_STATE_DOWN       3

/* LED mode */
#define LED_MODE_OFF        0
#define LED_MODE_LED1_LED2  1
#define LED_MODE_MAX        1

/* State flags */
#define STATE_FLAG_OFF  0
#define STATE_FLAG_ON   1

.struct 0
BUTTON_STATE:   .word   0
LED_MODE:       .word   0

/* State flags */
STATE_FLAG_BUTTON_STATE:  .word   0
STATE_FLAG_TIM7:          .word   0
