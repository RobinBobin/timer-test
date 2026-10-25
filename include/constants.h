#define TIMER_1_MS  (392 * 1000 - 1)

/* Button */
#define BUTTON_STATE_NULL   -1
#define BUTTON_STATE_UP     0
#define BUTTON_STATE_DOWN   1

#define BUTTON_DEBOUNCE   30

/* LEDs */
#define LED_PERIOD_MS   500

#define LED_MODE_OFF            -1
#define LED_MODE_LED1           0
#define LED_MODE_LED2           1
#define LED_MODE_LED1_OR_LED2   2
#define LED_MODE_LED1_AND_LED2  3

#define LED_MODE_MIN  LED_MODE_LED1
#define LED_MODE_MAX  LED_MODE_LED1_AND_LED2
