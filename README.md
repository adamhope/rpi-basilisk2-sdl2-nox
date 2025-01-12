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

### Requirements
- A Raspberry Pi
- A blank SD card

### Step 1: Create a fresh Raspibian Lite image

1. Download the Raspberry Pi Imager from https://www.raspberrypi.com/software/
2. Insert the SD card
3. Select your Raspberry Pi Device
4. Select Raspbian Lite as the OS, it's under **Raspberry Pi OS (other)**
5. Select the SD card as your storage device
6. When the SD card has been prepared you can put it in your Raspberry Pi and boot the machine

### Step 2: Install Basilisk II

To install, boot into your freshly created Raspberry Pi OS Lite and login with the default user "pi" (password "raspberry"). Then run the following commands:
```bash
sudo apt install git
git clone https://github.com/ekbann/rpi-basilisk2-sdl2-nox
cd rpi-basilisk2-sdl2-nox
bash run.sh
```
When the script ends, it will run Basilisk II automatically but you can also manually start by typing `BasiliskII`. Enjoy!

### Optional: Starting Basilisk II automatically.

These instructions will guide you to configure your Raspberry Pi running Raspbian to **boot directly into Basilisk II** after a **5-second delay** for a more seamless experience.

#### Step 1: Auto-Start Basilisk II

Copy basilisk_autostart.sh to your home directory and make it executable

```bash
cd ~
cp rpi-basilisk2-sdl2-nox/basilisk_autostart.sh .
chmod +x basilisk_autostart.sh
```

Open the /etc/rc.local file for editing:
```bash
sudo nano /etc/rc.local
```

Add the following line before the exit 0 line:
```bash
/home/pi/basilisk_autostart.sh &
```
Save and exit by pressing Ctrl + X, then Y, then Enter.

#### Step 2: Hide boot messages
Open cmdline.txt:
```bash
sudo nano /boot/firmware/cmdline.txt
```
Add the following options to the end of the line:
```bash
quiet splash
```
Save and exit by pressing Ctrl + X, then Y, then Enter.

#### Step 3: Enable Auto-Login to Console using raspi-config
```bash
sudo raspi-config
```
Navigate to System Options > Boot / Auto Login.
Select Console Auto Login.

Reboot your Raspberry Pi to test the configuration:
```bash
sudo reboot
```

## Configuring Basilisk II

The Basilisk II emulator is highly configurable. It is likely that you'll want to change some of the default configuration options e.g.
- Path(s) to hard drive images for Basilisk II
- Display settings, depending on which version of Mac OS you are emulating you won't always be able to do this directly in the guest vesion of Mac OS and you'll have to make changes in `.basilisk_ii_prefs` instead.

### Display settings

You can change the screen resolution by editing the .basilisk_ii_prefs and change the `screen` parameter. For some serious work, you can try the following:
```plaintext
screen dga/1024/768
displaycolordepth 16
```
Then go to Mac OS 7.6.1 Control Panel and under Monitors, select "Thousands" of colors.

_Note: Many older games require 256 colours and will report an error if Thousands (16 bit) is selected._

### Keyboard mapping

There is a folder called `keyboard` that has the default raw keycodes used by Basilisk II. Basically it converts the host OS scancodes into the emulated Basilisk II keycodes. This allows the ALT and WINDOWS keys to be assigned the COMMAND and OPTION keys respectively. There are many keycode sets depending on which video driver is being used, e.g. X11, Quartz, Linux framebuffer, Cocoa, or Windows. This is especially needed when using non-QWERTY keyboard layouts.

_Note: If you are using an ADB keyboard with an ADB to USB adapter this will result in the command and option keys being swapped._


## Getting help with Basilisk II, and Macintosh emulation in general
- [E-Maculation wiki](https://www.emaculation.com/doku.php) setup guides for Basilisk II and other emulators
- [E-Maculation forums](https://www.emaculation.com/forum/), active discussion about several Mac emulators]