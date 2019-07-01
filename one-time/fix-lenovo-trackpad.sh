#!/bin/bash



# This function is used to temporarily fix the trackpad issue.
# It only loads the `i2c_hid` module for the current boot.
# It will not work on reboot.
temp_fix() {
	# Add module for trackpad
	echo "Removing i2c_hid module..."
	sudo rmmod i2c_hid
	echo "Adding i2c_hid module..."
	sudo modprobe i2c_hid
}


perm_fix() {
	echo 'Adding i2c_hid module to `/etc/modules-load.d/trackpad.conf`...'
	echo "i2c_hid" | sudo tee /etc/modules-load.d/trackpad.conf > /dev/null 2>&1
        echo 'Removing `blacklist i2c_hid` from `/etc/modprobe.d/blacklist.conf`...'
	sed '/^blacklist i2c_hid$/d' /etc/modprobe.d/blacklist.conf | sudo tee /etc/modprobe.d/blacklist.conf > /dev/null 2>&1
}



# THIS FUNCTION IS NOT CURRENTLY USED
# Get user to edit grub
function edit_grub {
	echo 'Replace:'
	echo '    GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"'
	echo 'With:'
	echo '    GRUB_CMDLINE_LINUX_DEFAULT="i8042.reset quiet splash"'
	echo "[Press ENTER to continue]"

	read _

	sudo nano /etc/default/grub
	sudo update-grub
}



read -p "Are you using a Lenovo laptop? (y/n) " is_using_lenovo

if [ "$is_using_lenovo" == "y" ]
then
	# Load module for current boot
	temp_fix
	# Add module to list of modules to load on boot
	perm_fix
else
	echo "Skipping Lenovo trackpad fix..."
fi
