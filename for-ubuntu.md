# For Ubuntu

## [Fcitx-Unikey](https://www.sitecuatui.com/fcitx-unikey/)

```bash
sudo apt-get install fcitx-unikey
im-config -n fcitx
sudo wget https://raw.githubusercontent.com/fcitx/fcitx-unikey/ccffd3b77b78312f135f3958c9a4db7e98562e11/src/fcitx-unikey.desc -O /usr/share/fcitx/configdesc/fcitx-unikey.desc

=> logout => Fcitx > Configure > untick "Only Show Current Language" > add Unikey
```
## [Elementary OS's Pantheon File manager](https://github.com/elementary/files)
DEMO: 
[https://www.youtube.com/watch?v=aQw4_7Ue8wc](https://www.youtube.com/watch?v=aQw4_7Ue8wc)

![img](https://i.stack.imgur.com/Fv1PB.png)

```bash
sudo add-apt-repository ppa:elementary-os/stable
sudo apt-get update
sudo apt-get install pantheon-files
```
Configure Pantheon-files to use double click

```bash
gsettings set io.elementary.files.preferences single-click false
```
or

```bash
gsettings set org.pantheon.files.preferences single-click false
```
## Change An Application Icon in Ubuntu Unity

```bash
cd /usr/share/applications # or cd ~/.local/share/applications
sudo nano firefox.desktop
sudo update-icon-caches /usr/share/icons/*
```

Set ```Icon=/path/of/your/icon```

## Terminator

```bash
sudo add-apt-repository ppa:gnome-terminator
sudo apt-get update
sudo apt-get install terminator
```

Download file ```config.terminator``` in ```configs``` folder into your machine and change your default configuration by: 

```bash
sudo bash -c "cat config.terminator > ~/.config/terminator/config"
```
![img](images/terminator.png)

## Enable 'minimize on click' on Ubuntu dock

Open Terminal and run
```bash
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
```
To revert to the default option, simply run 
```bash
gsettings reset org.gnome.shell.extensions.dash-to-dock click-action
```
Also, run the following to see all possible permitted values 
```bash
gsettings range org.gnome.shell.extensions.dash-to-dock click-action
```

## Reorder your launch application [gnome-appfolders-manager](http://www.muflone.com/jekyll/gnome-appfolders-manager/english/)
Install [```http://www.muflone.com/gnome-appfolders-manager/english/install.html```](http://www.muflone.com/gnome-appfolders-manager/english/install.html)

![img](images/gnome-appfolders-manager.png)

## Gnome tweak tool
```bash
sudo apt install gnome-tweak-tool
```

## Background for Grub (1920x1200)
```bash
sudo cp ./images/grub-background.jpg /boot/grub/
sudo update-grub
```
```
Generating grub configuration file ...
Found background image: grub-background.jpg
Found linux image: /boot/vmlinuz-x.x.x-43-generic
Found initrd image: /boot/initrd.img-x.x.0-43-generic
Found linux image: /boot/vmlinuz-x.x.x-42-generic
Found initrd image: /boot/initrd.img-x.x.0-42-generic
Found Windows Boot Manager on /dev/sda1@/EFI/Microsoft/Boot/bootmgfw.efi
Adding boot menu entry for EFI firmware configuration
done
```
## Disable Icons animation in the Applications menu
### Method 1: GUI Way
```bash
sudo apt install dconf-editor 
# sudo apt-get remove dconf-editor
# sudo apt-get remove --auto-remove dconf-editor
# sudo apt-get purge dconf-editor￼
# sudo apt-get purge --auto-remove dconf-editor￼
```
Carefully navigate to ```/org/gnome/desktop/interface/``` and toggle the ```Enable-Animations``` option to ```OFF```.
### Method 2: Command line way
```bash
gsettings set org.gnome.desktop.interface enable-animations false
```
Bing it back:
```bash
gsettings set org.gnome.desktop.interface enable-animations true
```
## Tree: list contents of directories in a tree-like format
```bash
sudo apt-get install tree
man tree
tree -L 3 -d -o filename
# -d            : List directories only.
# -L level      : Max display depth of the directory tree.
# -o filename   : Send output to filename
# -h            : Print the size of each file but in a more human readable way
# -u            : Print the username
```
![img](images/tree.jpg)

## xdg-open: open a file with your preferred application
```bash
xdg-open file.pdf

```

## Appmenu - view all applications via a dropdown
```bash
sudo apt-add-repository ppa:diesch/testing
sudo apt-get update
sudo apt-get install classicmenu-indicator
```
![img](images/classicmenu-indicator.jpg)

# Errors

## [No sound Ubuntu](https://help.ubuntu.com/community/SoundTroubleshootingProcedure)

```bash
sudo apt-get remove --purge pulseaudio pulseaudio-utils pavucontrol
killall pulseaudio ; rm -r ~/.config/pulse ; rm -r ~/.pulse*
mkdir ~/.config/pulse
sudo apt-get install pulseaudio pulseaudio-utils pavucontrol
```