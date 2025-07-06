#!/bin/bash

sudo pacman -S figlet --noconfirm

echo "i3 Setup" | figlet

echo "starting install script"
echo "# Installing Applications" | figlet

sudo pacman -Syu --noconfirm vlc xdg-user-dirs xdg-utils xdg-desktop-portal xdg-desktop-portal-gtk curl wget speech-dispatcher nvidia-open-dkms nvidia-settings nvidia-utils i3 rofi picom autotiling kitty firefox chromium lsp-plugins calf easyeffects pipewire-alsa pipewire-audio pipewire-pulse blueman bluez bluez-utils bluez-tools bluez-deprecated-tools xorg brightnessctl playerctl unrar unzip zip plocate thermald tlp gdu udiskie udisks2 pcmanfm-gtk3 lxappearance-gtk3 yazi ttf-inconsolata-nerd inter-font gtk-engine-murrine gnome-themes-extra polkit poppler noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra network-manager-applet flameshot go feh fastfetch flatpak dunst sbctl terminus-font ntp reflector papirus-icon-theme bash-completion xss dex

git clone https://aur.archlinux.org/yay.git "$HOME/yay"
cd "$HOME/yay/" && makepkg -si && cd ..

yay -Sc --noconfirm

yay -S --noconfirm zen-browser-bin google-chrome visual-studio-code-bin pwvucontrol 
sudo pacman -R --noconfirm firefox chromium

echo "Finished Installing Applications"
echo "Starting Config creation" | figlet

echo "Xcursor.theme:Simp1e-Dark
Xcursor.size:18
Xft.dpi:100
Xft.antialias: true
Xft.rgba: rgb
Xft.hinting: true
Xft.hintstyle: hintfull
Xft.font: Inter-11" >> $HOME/.Xresources

xrdb -merge .Xresources

cat <<EOF > "$HOME/40-libinput.conf" 
"Section "InputClass"
        Identifier "libinput pointer catchall"
        MatchIsPointer "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
EndSection

Section "InputClass"
        Identifier "libinput keyboard catchall"
        MatchIsKeyboard "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
EndSection

Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
	Option "Tapping" "on"
	Option "TappingDrag" "on"
	Option "NaturalScrolling" "true"
	Option "ScrollMethod" "twofinger"
	Option "ClickMethod" "clickfinger"
EndSection

Section "InputClass"
        Identifier "libinput touchscreen catchall"
        MatchIsTouchscreen "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
EndSection

Section "InputClass"
        Identifier "libinput tablet catchall"
        MatchIsTablet "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
EndSection"
EOF

sudo mv "$HOME/40-libinput.conf" /etc/X11/xorg.conf.d/40-libinput.conf

cat <<EOF > "$HOME/10-nvidia.conf" 
"Section "ServerLayout"
    Identifier     "Layout0"
    Screen      0  "Screen0" 0 0
    InputDevice    "Keyboard0" "CoreKeyboard"
    InputDevice    "Mouse0" "CorePointer"
    Option         "Xinerama" "0"
EndSection

Section "Files"
EndSection

Section "InputDevice"
    # generated from default
    Identifier     "Mouse0"
    Driver         "mouse"
    Option         "Protocol" "auto"
    Option         "Device" "/dev/psaux"
    Option         "Emulate3Buttons" "no"
    Option         "ZAxisMapping" "4 5"
EndSection

Section "InputDevice"
    # generated from default
    Identifier     "Keyboard0"
    Driver         "kbd"
EndSection

Section "Monitor"
    # HorizSync source: edid, VertRefresh source: edid
    Identifier     "Monitor0"
    VendorName     "Unknown"
    ModelName      "BOE Technology Group Co., Ltd"
    HorizSync       68.4 - 68.4
    VertRefresh     60.0
    Option         "DPMS"
EndSection

Section "Device"
    Identifier     "Device0"
    Driver         "nvidia"
    VendorName     "NVIDIA Corporation"
    BoardName      "NVIDIA GeForce GTX 1650"
EndSection

Section "Screen"
    Identifier     "Screen0"
    Device         "Device0"
    Monitor        "Monitor0"
    DefaultDepth    24
    Option         "Stereo" "0"
    Option         "nvidiaXineramaInfoOrder" "DP-4"
    Option         "metamodes" "1920x1080_60 +0+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
    Option         "SLI" "Off"
    Option         "MultiGPU" "Off"
    Option         "BaseMosaic" "off"
    SubSection     "Display"
        Depth       24
    EndSubSection
EndSection"
EOF

sudo mv "$HOME/10-nvidia.conf" /etc/X11/xorg.conf.d/10-nvidia.conf

echo "copying configs" | figlet

parent_dir="$HOME/.config"
dirs=("i3" "i3blocks" "kitty" "nvtop" "btop" "dunst" "autostart" "easyeffects" "fastfetch" "rofi")

mkdir -p "$parent_dir"
for dir in "${dirs[@]}"; do
	mkdir -p "$parent_dir/$dir"
done

cp -r $HOME/dotfiles/i3_dots/* $HOME/.config/
sudo cp -r $HOME/dotfiles/tlp.conf /etc/tlp.conf

echo "enabling services" | figlet

sudo systemctl enable --now thermald tlp bluetooth
sudo modprobe -aV btusb

echo "Log generated" | figlet
exec > >(tee -i "$HOME/i3_setup.log") 2>&1
