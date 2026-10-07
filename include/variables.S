/* LED mode */
#define LED_MODE_OFF            -1
#define LED_MODE_LED1           0
#define LED_MODE_LED2           1
#define LED_MODE_LED1_OR_LED2   2
#define LED_MODE_LED1_AND_LED2  3

#define LED_MODE_MIN  LED_MODE_LED1
#define LED_MODE_MAX  LED_MODE_LED1_AND_LED2

.struct 0
/* Button */
BUTTON_DEBOUNCE_COUNTER:  .word   0
BUTTON_IS_DOWN:           .word   0

/* Leds */
LED_MODE:       .word   0
