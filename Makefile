.PHONY: flash
export PATH := $(shell pwd):$(PATH)

all: build

platformio:
	virtualenv .venv
	( \
		source .venv/bin/activate; \
		pip install -q platformio; \
	)

build:
	cp config/* Marlin/Marlin/
	( \
		source .venv/bin/activate; \
		platformio run -d Marlin -e STM32F103RET6_creality; \
	)

# flash: build
# 	scp Marlin/.pio/build/STM32F103RET6_creality/firmware.hex pi@octopi:firmware.hex
# 	# ssh pi@octopi "avrdude -C /etc/avrdude.conf -v -p atmega1284p -carduino -P /dev/ttyUSB0 -b 115200 -D -Uflash:w:firmware.hex:i"

clean:
	rm -f Marlin/Marlin/{_Bootscreen.h,_Statusscreen.h}
	git checkout Marlin/Marlin/{Configuration.h,Configuration_adv.h}