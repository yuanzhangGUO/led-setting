      arm-linux-gcc  -c  led.S
      arm-linux-ld    leds.o   -Ttext=0x50000000  -o  led
      arm-linux-objcopy  -O  binary  led  led.bin
