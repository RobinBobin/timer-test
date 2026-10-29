#define TIMER_1_MS  (384 * 1000 - 1)

/* Button */
#define BUTTON_STATE_NULL   -1
#define BUTTON_STATE_UP     0
#define BUTTON_STATE_DOWN   1

#define BUTTON_DEBOUNCE   30

/* Ethernet */
#define DESTINATION_ADDRESS   0xd85ed3e10997  // D8:5E:D3:E1:09:97
#define DESTINATION_IP        0xc0a80002      // 192.168.0.2
#define DESTINATION_PORT      0x0bb8          // 3000
#define SOURCE_ADDRESS        0x122233445566  // 12:22:33:44:55:66
#define SOURCE_IP             0xc0a80001      // 192.168.0.1
#define SOURCE_PORT           0x0bb8          // 3000

/* LEDs */
#define LED_PERIOD_MS   500

#define LED_MODE_OFF            -1
#define LED_MODE_LED1           0
#define LED_MODE_LED2           1
#define LED_MODE_LED1_OR_LED2   2
#define LED_MODE_LED1_AND_LED2  3

#define LED_MODE_MIN  LED_MODE_LED1
#define LED_MODE_MAX  LED_MODE_LED1_AND_LED2
