# rpi-basilisk2-sdl2-nox

This script will automatically download and compile all the necessary source code to have a fully functional Basilisk II emulator running with SDL2 and without X Windows for maximum performance. In order to have an extremely light Linux system the Raspberry Pi OS Lite was chosen as the base for this project. As of this writing the following versions were used:
```plaintext
Raspberry Pi OS Lite version 2024-11-19-raspios-buster-armhf-lite
SDL2 version 2.26.5
Basilisk II version by kanjitalk755
```
Due to graphics hardware incompatibilities between RPi3 (VideoCore 4) and RPi4 (VideoCore VI), this script recommends running on a RPi versions 1, 2, or 3.

A 200MB disk image is also included here with pre-installed Mac OS 7.6.1 and Prince of Persia 1 for a quick demonstration of sound and graphics at 640x480 and 256 colors.

## Usage

To install, boot into your freshly created Raspberry Pi OS Lite and login with the default user "pi" (password "raspberry"). Then run the following commands:
```bash
sudo apt install git
git clone https://github.com/ekbann/rpi-basilisk2-sdl2-nox
cd rpi-basilisk2-sdl2-nox
bash run.sh
```
When the script ends, it will run Basilisk II automatically but you can also manually start by typing `BasiliskII`. Enjoy!

## Changing display settings

You can change the screen resolution by editing the .basilisk_ii_prefs and change the "screen" parameter. For some serious work, you can try the following:
```plaintext
screen dga/1024/768
displaycolordepth 16
```
Then go to Mac OS 7.6.1 Control Panel and under Monitors, select "Thousands" of colors.

## Changing keyboard mapping

There is a folder called "keyboard" that has the default raw keycodes used by Basilisk II. Basically it converts the host OS scancodes into the emulated Basilisk II keycodes. This allows the ALT and WINDOWS keys to be assigned the COMMAND and OPTION keys respectively. There are many keycode sets depending on which video driver is being used, e.g. X11, Quartz, Linux framebuffer, Cocoa, or Windows. This is especially needed when using non-QWERTY keyboard layouts.

## Getting help with Basilisk II and Macintosh emulation in general
- [E-Maculation wiki](https://www.emaculation.com/doku.php) setup guides for Basilisk II and other emulators
- [E-Maculation forums](https://www.emaculation.com/forum/), active discussion about several Mac emulators]