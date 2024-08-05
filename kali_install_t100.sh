sudo su

mount mmcblk2p2 /target
mount mmcblk2p1 /target/boot/efi

for i in /dev /dev/pts /proc /sys /sys/firmware/efi/efivars /run; do mount --bind "$dir" /target/"$dir"; done

modprobe efivarfs

chroot /target

apt update

apt install grub-efi-ia32

grub-install --target=i386-efi --efi-directory=/boot/efi --bootloader-id=kali --debug /dev/mmcblk2 --removable

update-grub

exit

exit

reboot