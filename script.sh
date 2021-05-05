#!/bin/bash

sudo snap remove lxd
sudo snap remove core18
sudo snap remove snapd
sudo apt purge snapd ubuntu-advantage-tools info vim htop byobu vim-common vim-runtime vim-tiny -y
sudo apt-mark hold snapd
sudo apt autoremove -y
sudo apt install -y --no-install-recommends --no-install-suggests network-manager-gnome gnome-session gnome-terminal xinit gdm3 gnome-software gnome-control-center gnome-control-center-faces nautilus gnome-icon-theme gnome-tweaks dmz-cursor-theme gnome-shell-extensions adwaita-icon-theme-full gnome-system-monitor pulseaudio gnome-core xorg vino plymouth-theme-ubuntu-gnome-logo gnome-screenshot gnome-boxes gnome-clocks gnome-music gnome-calendar gnome-photos evolution cheese file-roller mutter chrome-gnome-shell gnome-shell-extensions gnome-shell-extension-arc-menu gnome-shell-extension-dash-to-panel epiphany-browser nautilus-extension-gnome-terminal nautilus-share nautilus-ideviceinfo nautilus-admin samba seahorse gnome-sound-recorder dconf-editor deja-dup gnome-documents gnome-weather printer-driver-all

sudo apt upgrade -y

sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=""/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/g' /etc/default/grub

sudo update-grub

sudo sed -i '2 a \  renderer: \NetworkManager' /etc/netplan/00-installer-config.yaml
sudo netplan apply

sudo reboot
