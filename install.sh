#!/bin/bash

if ! pacman -Qs | grep -q wget; then
	sudo pacman -S --noconfirm wget
fi

java=(
	jdk-openjdk
	jre-openjdk
	jre-openjdk-headless
	java-openjfx
)

for pkg in ${java[@]}; do
	if ! pacman -Qs | grep -q $pkg; then
		sudo pacman -S --noconfirm "$pkg"
	fi
done

sudo wget https://tlauncher.org/jar -P src/
unzip src/jar -d src/tlauncher.d
mv src/tlauncher.d/*.jar src/tlauncher.d/tlauncher.jar

sudo mkdir /usr/share/tlauncher
sudo mv src/tlauncher.d/* /usr/share/tlauncher
sudo mv src/tlauncher.png /usr/share/icons
sudo mv src/tlauncher.desktop /usr/share/applications
sudo mv src/tlauncher /usr/bin/
