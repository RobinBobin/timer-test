/* Button states */
#define BUTTON_STATE_NONE       -1
#define BUTTON_STATE_RAW_UP     0
#define BUTTON_STATE_RAW_DOWN   1
#define BUTTON_STATE_UP         2
#define BUTTON_STATE_DOWN       3

/* LED mode */
#define LED_MODE_OFF            -1
#define LED_MODE_LED1           0
#define LED_MODE_LED2           1
#define LED_MODE_LED1_OR_LED2   2
#define LED_MODE_LED1_AND_LED2  3

#define LED_MODE_MIN  LED_MODE_LED1
#define LED_MODE_MAX  LED_MODE_LED1_AND_LED2

/* State flags */
#define STATE_FLAG_OFF  0
#define STATE_FLAG_ON   1

.struct 0
/* Variables */
BUTTON_STATE:   .word   0
LED_MODE:       .word   0

/* State flags */
STATE_FLAG_BUTTON_STATE:  .word   0
STATE_FLAG_TIM6:          .word   0
STATE_FLAG_TIM7:          .word   0
