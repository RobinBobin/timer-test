#define TIMER_1_MS  (384 * 1000 - 1)

/* Button */
#define BUTTON_STATE_NULL   -1
#define BUTTON_STATE_UP     0
#define BUTTON_STATE_DOWN   1

#define BUTTON_DEBOUNCE   30

/* Ethernet */
#define ETH_DESTINATION_ADDRESS   0xd85ed3e10997  // D8:5E:D3:E1:09:97
#define ETH_DESTINATION_IP        0xc0a80002      // 192.168.0.2
#define ETH_DESTINATION_PORT      3000
#define ETH_SOURCE_ADDRESS        0x122233445566  // 12:22:33:44:55:66
#define ETH_SOURCE_IP             0xc0a80001      // 192.168.0.1
#define ETH_SOURCE_PORT           3000

/* LEDs */
#define LED_PERIOD_MS   500

#define LED_MODE_OFF            -1
#define LED_MODE_LED1           0
#define LED_MODE_LED2           1
#define LED_MODE_LED1_OR_LED2   2
#define LED_MODE_LED1_AND_LED2  3

#define LED_MODE_MIN  LED_MODE_LED1
#define LED_MODE_MAX  LED_MODE_LED1_AND_LED2
