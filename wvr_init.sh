#!/bin/bash 

while [ true ]
do
    read -n1 -s -r -p $'Press to BURN FUSES...\n' key
    ~/esp/esp-idf/components/esptool_py/esptool/espefuse.py --do-not-confirm --port /dev/cu.usbserial-A50285BI set_flash_voltage 3.3V &&
    read -n1 -s -r -p $'Press to FLASH FIRMWARE...\n' key
    echo 'flashing firmware please wait ...'
    arduino-cli upload -p /dev/cu.usbserial-A50285BI --fqbn esp32:esp32:esp32wrover wvr_basic &&
    echo done
done