#!/bin/sh
timedatectl set-timezone America/Argentina/Buenos_Aires

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/America/Argentina/Buenos_Aires /etc/localtime
hwclock --systohc
locale-gen
/etc/locale.conf
LANG=en_US.UTF-8
echo solaire >> /etc/hostname
mkinitcpio -P
passwd
useradd -m solaire

pacman -S git neovim dhcpcd wayland plasma plasma-workspace plasma-wayland-protocols grub efibootmgr sddm sudo networkmanager os-prober kitty dophin

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable dhcpcd.service
systemctl enable sddm
systemctl enable NetworkManager.service

EDITOR=nvim visudo
