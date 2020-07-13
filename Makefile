.PHONY: flash
export PATH := $(shell pwd):$(PATH)

all: build flash

arduino-cli:
	curl -sL https://github.com/arduino/arduino-cli/releases/download/0.11.0/arduino-cli_0.11.0_Linux_64bit.tar.gz | tar -xz arduino-cli

prepare: arduino-cli
	arduino-cli core install arduino:avr MightyCore:avr@2.0.3
	arduino-cli lib install U8glib@1.18.0

build: prepare
	cp config/* Marlin/Marlin/
	arduino-cli compile --output-dir target --fqbn MightyCore:avr:1284:pinout=sanguino,LTO=Os_flto Marlin/Marlin

clean:
	rm Marlin/Marlin/$(ls config/)

flash:
	scp target/Marlin.ino.hex pi@octopi:.
	ssh pi@octopi "avrdude -C /etc/avrdude.conf -v -p atmega1284p -carduino -P ${1:-/dev/ttyUSB0} -b115200 -D -Uflash:w:Marlin.MightyCore.avr.1284.hex:i"
