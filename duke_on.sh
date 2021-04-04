#!/bin/bash
# Enable Hyperkin Duke with MiSTer

# Location of init script
DUKE_STARTUP_SCRIPT="/media/fat/linux/duke_init_script"

# Check if script exists
if [ ! -f ${DUKE_STARTUP_SCRIPT} ]; then
	echo "Duke initialization script missing from:"
	echo "${DUKE_STARTUP_SCRIPT}"
	echo "Cannot proceed."
	exit 1
fi

echo "Remounting root filesystem as read-write..."
mount | grep "on / .*[(,]ro[,$]" -q && RO_ROOT="true"
[ "${RO_ROOT}" == "true" ] && mount / -o remount,rw

echo "Adding startup script..."
ln -s ${DUKE_STARTUP_SCRIPT} /etc/init.d/S99duke > /dev/null 2>&1

echo "Remounting root filesystem as read-only..."
sync
[ "${RO_ROOT}" == "true" ] && mount / -o remount,ro
sync

echo "Starting Duke..."
/etc/init.d/S99duke start

echo "Done!"
exit 0
