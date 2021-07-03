#!/bin/bash 

if [ "$1" == "site" ]; then 
    cd react && \
    npm run build && \
    cd ../.. && \
    arduino-cli compile -e --build-property build.code_debug=3 --fqbn esp32:esp32:esp32wrover wvr_gitanova && \
    echo "done compilation, uploading" && \
    curl --data-binary "@/Users/temporary/Documents/Arduino/wvr_gitanova/build/esp32.esp32.esp32wrover/wvr_gitanova.ino.bin" http://192.168.5.18/update --header "content-type:text/plain" ; \
    echo "done"
elif [ "$1" == "code" ]; then 
    echo "compiling"
    cd .. && \
    arduino-cli compile -e --build-property build.code_debug=3 --fqbn esp32:esp32:esp32wrover wvr_gitanova && \
    echo "done compilation, uploading" && \
    curl --data-binary "@/Users/temporary/Documents/Arduino/wvr_gitanova/build/esp32.esp32.esp32wrover/wvr_gitanova.ino.bin" http://192.168.5.18/update --header "content-type:text/plain" ; \
    echo "done"
elif [ "$1" == "codeflags" ]; then 
    echo "compiling"
    cd .. && \
    arduino-cli compile -e --build-property build.code_debug=3 --build-property compiler.ar.extra_flags=-CONFIG_ASYNC_TCP_RUNNING_CORE=0 --fqbn esp32:esp32:esp32wrover wvr_gitanova && \
    # build.extra_flags="-CONFIG_ASYNC_TCP_RUNNING_CORE=0" --build-property compiler.ar.extra_flags=-CONFIG_ASYNC_TCP_USE_WDT=0
    echo "done compilation, uploading" && \
    curl --data-binary "@/Users/temporary/Documents/Arduino/wvr_gitanova/build/esp32.esp32.esp32wrover/wvr_gitanova.ino.bin" http://192.168.5.18/update --header "content-type:text/plain" ; \
    echo "done"
elif [ "$1" == "codenodev" ]; then 
    echo "compiling"
    cd .. && \
    arduino-cli compile -e --build-property build.code_debug=0 --fqbn esp32:esp32:esp32wrover wvr_gitanova && \
    echo "done compilation, uploading" && \
    curl --data-binary "@/Users/temporary/Documents/Arduino/wvr_gitanova/build/esp32.esp32.esp32wrover/wvr_gitanova.ino.bin" http://192.168.5.18/update --header "content-type:text/plain" ; \
    echo "done"
elif [ "$1" == "compile" ]; then 
    echo "compiling"
    cd .. && \
    arduino-cli compile -e --build-property build.code_debug=3 --fqbn esp32:esp32:esp32wrover wvr_gitanova && \
    echo "done compilation"
elif [ "$1" == "compilenodev" ]; then 
    echo "compiling"
    cd .. && \
    arduino-cli compile -e --build-property build.code_debug=0 --fqbn esp32:esp32:esp32wrover wvr_gitanova && \
    echo "done compilation"
elif [ "$1" == "compilerelease" ]; then 
    echo "compiling"
    cd .. && \
    arduino-cli compile -e --build-property build.code_debug=2 --fqbn esp32:esp32:esp32wrover wvr_gitanova && \
    echo "done compilation"
elif [ "$1" == "compilewithsite" ]; then 
    echo "compiling website"
    cd react && \
    npm run build && \
    cd ../.. && \
    echo "compiling binary"
    arduino-cli compile -e --build-property build.code_debug=3 --fqbn esp32:esp32:esp32wrover wvr_gitanova && \
    echo "done compilation"
elif [ "$1" == "compilewithsitenodev" ]; then 
    echo "compiling website"
    cd react && \
    npm run build && \
    cd ../.. && \
    echo "compiling binary"
    arduino-cli compile -e --build-property build.code_debug=0 --fqbn esp32:esp32:esp32wrover wvr_gitanova && \
    echo "done compilation"
elif [ "$1" == "flash" ]; then 
    cd .. && \
    echo "uploading" && \
    curl --data-binary "@/Users/temporary/Documents/Arduino/wvr_gitanova/build/esp32.esp32.esp32wrover/wvr_gitanova.ino.bin" http://192.168.5.18/update --header "content-type:text/plain" ; \
    echo "done"
elif [ "$1" == "ftdi" ]; then 
    cd .. && \
    arduino-cli compile -e --build-property build.code_debug=3 --fqbn esp32:esp32:esp32wrover wvr_gitanova && \
    echo "done compilation, uploading" && \
    arduino-cli upload -p /dev/cu.usbserial-A50285BI --fqbn esp32:esp32:esp32wrover wvr_gitanova && \
    echo "done"
elif [ "$1" == "ftdiflash" ]; then 
    echo "uploading" && \
    arduino-cli upload -p /dev/cu.usbserial-A50285BI --fqbn esp32:esp32:esp32wrover wvr_gitanova && \
    echo "done"
elif [ "$1" == "ftdinodev" ]; then 
    cd .. && \
    arduino-cli compile -e --build-property build.code_debug=0 --fqbn esp32:esp32:esp32wrover wvr_gitanova && \
    echo "done compilation, uploading" && \
    arduino-cli upload -p /dev/cu.usbserial-A50285BI --fqbn esp32:esp32:esp32wrover wvr_gitanova && \
    echo "done"
elif [ "$1" == "test" ]; then 
    echo "compiling"
    cd .. && \
    arduino-cli compile -e --build-property build.code_debug=3 --fqbn esp32:esp32:esp32wrover wvr_gitanova && \
    echo "done compilation, uploading" && \
    curl --data-binary "@/Users/temporary/Documents/Arduino/wvr_gitanova/build/esp32.esp32.esp32wrover/wvr_gitanova.ino.bin" http://192.168.5.18/addfirmware --header "content-type:text/plain" --header "name:test_update" --header "size:100000" ; \
    echo "done"
else
    echo "please use one of flags : site, code, or flash"
fi