#include <wvr_pins.h>
#include <button_struct.h>
#include <ws_log.h>
#include <wvr_ui.h>
#include <WVR.h>
#include <midiXparser.h>
#include <midi_in.h>
#include <wav_player.h>
#include <button.h>
#include <rpc.h>
#include <file_system.h>
#include <wvr_0.3.h>
#include <gpio.h>

WVR wvr;
extern struct pin_config_t *pin_config_lut;
// extern Button *buttons[14];

Button *wifiPin;

void wifiOn(void)
{
  log_i("wifiOn");
  wvr.wifiOn();
}

void wifiOff(void)
{
  log_i("wifiOff");
  wvr.wifiOff();
}

void setup() {
  wvr.useFTDI = true;
  wvr.useUsbMidi = true;
  wvr.begin();
  wvr.wifiIsOn = get_metadata()->wifi_starts_on;
  log_i("wifi on %d", wvr.wifiIsOn);
  
  buttons[3]->mode = FALLING;
  buttons[3]->onPress(wifiOff);
  buttons[3]->onRelease(wifiOn);
}

void loop() {
  // vTaskDelay(portMAX_DELAY);
  vTaskDelete(NULL);
}