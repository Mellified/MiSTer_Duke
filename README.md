# MiSTer_Duke
Hyperkin Duke controller support for the MiSTer FPGA

## Contents
* duke_init_script - init.d script to enable or disable support
* duke_on.sh - MiSTer script to install init script and enable support for The Duke
* duke_off.sh - MiSTer script to remove init script and disable support for The Duke

## Installation
1. Download the [latest release](https://github.com/Mellified/MiSTer_Duke/releases/latest).
2. Unzip files to the MiSTer's SD card base directory (/media/fat/).

## Usage
1. From the MiSTer main menu open the OSD (F12).
2. Navigate to **Scripts**.
3. To enable Duke support, navigate to the **duke_on** entry and hit enter.
4. To disable Duke support, navigate to the **duke_off** entry and hit enter.

## Technical Details
The Hyperkin Duke uses the standard Xbox One interface over USB supported by MiSTer's xpad linux driver. However, it uses the Hyperkin USB vendor ID, rather than the typical Microsoft vendor ID. The on script simply adds Hyperkin's vendor ID via the xpad /sys/ interface and pokes xpad to update. A init.d entry is also added to automatically enable support at startup.

The duke_off script removes the Hyperkin vendor ID from xpad, pokes it, and removes the init.d script.

An issue to add Duke support has been [added](https://github.com/MiSTer-devel/Linux-Kernel_MiSTer/issues/21) to the MiSTer's linux-kernel project. Once added this script will no longer be needed.
