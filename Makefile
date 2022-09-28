.PHONY: flash
export PATH := $(shell pwd):$(PATH)

username := $(shell id -u -n)

all: build

build:
	cd Marlin/Marlin/ && ln -sf ../../config/* .
	PLATFORMIO_BUILD_CACHE_DIR=/tmp/marlin-build-cache platformio run -d Marlin -e STM32F103RE_creality
	rm -fv /run/media/$(username)/37E7-8DBC/*.bin
	(cd Marlin/.pio/build/STM32F103RE_creality/ && cp -v $(shell ls -t . | grep bin | head -n1) /run/media/$(username)/37E7-8DBC/)

diff:
	meld config/Configuration.h Configurations/config/examples/Creality/Ender-3\ Pro/CrealityV427/Configuration.h
	meld config/Configuration_adv.h Configurations/config/examples/Creality/Ender-3\ Pro/CrealityV427/Configuration_adv.h

clean:
	rm -f Marlin/Marlin/{_Bootscreen.h,_Statusscreen.h}
	git checkout Marlin/Marlin/{Configuration.h,Configuration_adv.h}