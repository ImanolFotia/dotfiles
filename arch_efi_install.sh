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
passwd solaire

pacman -S git neovim dhcpcd wayland plasma plasma-workspace plasma-wayland-protocols xdg-desktop-portal-kde grub efibootmgr sddm sudo networkmanager os-prober kitty dolphin nvidia nvidia-utils nvidia-settings opencl-nvidia xorg-server-devel

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable dhcpcd.service
systemctl enable sddm
systemctl enable NetworkManager.service

EDITOR=nvim visudo

sudo cp /etc/environment ~/environment.bak

sudo nvim /etc/environment
  QT_QPA_PLATFORMTHEME="wayland;xcb"
  GBM_BACKEND=nvidia-drm
  __GLX_VENDOR_LIBRARY_NAME=nvidia
  ENABLE_VKBASALT=1
  LIBVA_DRIVER_NAME=nvidia
  WLR_NO_HARDWARE_CURSORS=1

sudo nvim /etc/mkinitcpio.conf
  MODULES(... nvidia nvidia_modeset nvidia_uvm nvidia_drm)
sudo mkinitcpio -P

sudo nvim /etc/default/grub
  GRUB_CMDLINE_LINUX_DEFAULT="... nvidia-drm.modeset=1"
sudo grub-mkconfig -o /boot/grub/grub.cfg
