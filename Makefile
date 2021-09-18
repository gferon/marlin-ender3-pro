.PHONY: flash
export PATH := $(shell pwd):$(PATH)

all: build

#arduino-cli:
#	curl -sL https://github.com/arduino/arduino-cli/releases/download/0.11.0/arduino-cli_0.11.0_Linux_64bit.tar.gz | tar -xz arduino-cli

#prepare: arduino-cli
#	arduino-cli core update-index
#	arduino-cli core install arduino:avr MightyCore:avr@2.1.3
#	# since marlin 2.0.8 we need a patched U8glib / arduino-cli lib install U8glib@1.18.0
#	# install the version from https://github.com/MarlinFirmware/U8glib-HAL.git

build:
	cp config/* Marlin/Marlin/
	# arduino-cli compile --verbose --libraries ./U8glib-HAL --output-dir target --fqbn MightyCore:avr:1284:pinout=sanguino,LTO=Os_flto Marlin/Marlin
	platformio run -d Marlin -e melzi_optiboot_optimized

flash: build
	scp Marlin/.pio/build/melzi_optiboot_optimized/firmware.hex pi@octopi:firmware.hex
	ssh pi@octopi "avrdude -C /etc/avrdude.conf -v -p atmega1284p -carduino -P /dev/ttyUSB0 -b 115200 -D -Uflash:w:firmware.hex:i"

clean:
	rm -f Marlin/Marlin/{_Bootscreen.h,_Statusscreen.h}
	git checkout Marlin/Marlin/{Configuration.h,Configuration_adv.h}