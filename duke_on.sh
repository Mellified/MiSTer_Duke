#!/bin/bash
# Enable Hyperkin Duke with MiSTer

echo "Copying Xpad driver config..."
echo "2e24 0652" > /sys/bus/usb/drivers/xpad/new_id
echo "Enabling Duke..."
modprobe xpad
echo "Done!"
exit 0
