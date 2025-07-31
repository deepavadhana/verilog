#include "stm32f1xx_hal.h"

UART_HandleTypeDef huart1;
int main(void)
{
  HAL_Init();
  MX_USART1_UART_Init();
  uint8_t tx_data[] = "A";
  uint8_t rx_data[1];
  while (1){
    HAL_UART_Transmit(&huart1, tx_data, 1, HAL_MAX_DELAY);
    HAL_UART_Receive(&huart1, rx_data, 1, HAL_MAX_DELAY);
    tx_data[0]++;
    HAL_Delay(1000);}
}
