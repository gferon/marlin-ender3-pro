# marlin-ender3-pro

Configuration and build scripts to build Marlin 2.x for my 3D printer.

## Disclaimer

This set of configuration files is designed to be used with a Creality Ender 3 Pro with [Creality glass bed](https://www.creality3dofficial.com/products/creality-new-upgraded-heated-bed-build-plate-surface) and a [TouchMI bed-leveling sensor](https://www.hotends.fr/fr/accessoires/64-capteur-auto-leveling-touch-mi.html).

## Usage

1. Run `git submodule update`
2. Install the [arduino-cli](https://arduino.github.io/arduino-cli/installation/)
3. Run the `build` script
4. Find the `.hex` file and flash it on the mainboard of the Ender-3

## Updating to a newer Marlin

First, update both the `Marlin` and `Configurations` git sub-modules to track the git revision of your choice.

Then, you'll have to manually update the configuration files stored under `config`.

It is tedious, but has to be done. Since I use my printer quite often, I try to update it as often as I can.
