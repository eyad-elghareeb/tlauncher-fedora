#!/bin/bash

## wget is for downloading TLuncher directly from their website.
## All the other packages are java packages recommended by TLauncher
## (They use java 8, but instead i'm installing the most recent java version).
pkgs_needed=(
	wget
	jdk-openjdk
	jre-openjdk
	jre-openjdk-headless
	java-openjfx
)

for pkg in ${pkgs_needed[@]} ; do
	if ( ! pacman -Qs | grep -q $pkg ) ; then
		sudo pacman -S --noconfirm "$pkg"
	fi
done

# Downloading TLauncher
echo -e "\n\033[1;32mDownloading TLauncher...\033[0m"

sudo wget https://tlauncher.org/jar -P src/
unzip src/jar -d src/tlauncher.d
mv src/tlauncher.d/*.jar src/tlauncher.d/tlauncher.jar

# Moving TLauncher files
echo -e "\n\033[1;32mInstalling TLauncher...\033[0m"
sudo mkdir /usr/share/tlauncher
sudo mv src/tlauncher.d/* /usr/share/tlauncher

sudo mv src/tlauncher /usr/bin/
sudo mv src/tlauncher.png /usr/share/icons
sudo mv src/tlauncher.desktop /usr/share/applications

echo -e "\n\033[1;32mInstallation Complete!\033[0m"