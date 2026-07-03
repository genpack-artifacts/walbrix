set -e

if [ -f /boot/grub/grub.cfg ]; then
	VERSION=$(cat /usr/src/linux/include/config/kernel.release|sed 's/^[^0-9]\+//'|sed 's/-gentoo\(-dist\(-bin\)\?\)\?//')
	sed -i "s/__VERSION__/$VERSION/g" /boot/grub/grub.cfg /etc/os-release
	mkdir -p /.genpack
	echo $VERSION > /.genpack/version
fi
