#!/bin/bash




  echo "   #  #  #"
  echo "  #########"
  echo "###       ###"
  echo "  # {#}   #"
  echo "###  '\######"
  echo "  #       #"
  echo "###       ###"
  echo "  ########"
  echo "   #  #  #"


echo " Welcome to the C.H.I.P Flasher Tool " 

echo " Please enter your wanted flavour " 
echo " ++++++++++++++++++++++++++++++++++++++++++ "
echo " enter p for pocketchip Image "
echo " enter s for the headless Server Image "
echo " enter g for the Desktop Image "
echo " enter b for the Buildroot Image " 
echo " ++++++++++++++++++++++++++++++++++++++++++ "
echo " IMPORTANT INFO "
echo " If u suffer from Power Problems add a n "
echo " to your choice of flavour "
echo " Example: gn for the No-Limit Desktop Image "
echo " ++++++++++++++++++++++++++++++++++++++++++ "
echo " Other options " 
echo " ++++++++++++++++++++++++++++++++++++++++++ "
echo " enter f for Force Clean " 
echo " ++++++++++++++++++++++++++++++++++++++++++ "
echo " Then press enter please " 

read flavour



echo -e "\n Setting up environment"
sudo apt -y update
sudo apt -y install \
 git \
 fastboot \
 u-boot-tools \
 adb \
 u-boot-tools \
 android-tools-fastboot \
 u-boot-tools \
 curl \
 wget \
 sunxi-tools \

echo -e "\n Adding current user to dialout group"
sudo usermod -a -G dialout $(logname)

echo -e "\n Adding current user to plugdev group"
sudo usermod -a -G plugdev $(logname)


echo -e "\n Adding udev rule for Allwinner device"
echo -e 'SUBSYSTEM=="usb", ATTRS{idVendor}=="1f3a", ATTRS{idProduct}=="efe8", GROUP="plugdev", MODE="0660" SYMLINK+="usb-chip"
SUBSYSTEM=="usb", ATTRS{idVendor}=="18d1", ATTRS{idProduct}=="1010", GROUP="plugdev", MODE="0660" SYMLINK+="usb-chip-fastboot"
SUBSYSTEM=="usb", ATTRS{idVendor}=="1f3a", ATTRS{idProduct}=="1010", GROUP="plugdev", MODE="0660" SYMLINK+="usb-chip-fastboot"
SUBSYSTEM=="usb", ATTRS{idVendor}=="067b", ATTRS{idProduct}=="2303", GROUP="plugdev", MODE="0660" SYMLINK+="usb-serial-adapter"
' | sudo tee /etc/udev/rules.d/99-allwinner.rules
sudo udevadm control --reload-rules

echo -e "\n Installing CHIP-tools"
if [ -d CHIP-tools ]; then
 cd CHIP-tools 
 git pull 
 FEL='sudo sunxi-fel' FASTBOOT='sudo fastboot' SNIB=false ./chip-update-firmware.sh -$flavour
 elif [ ! -d CHIP-tools ]; then
 git clone https://github.com/Project-chip-crumbs/CHIP-tools.git
 cd  CHIP-tools 
 FEL='sudo sunxi-fel' FASTBOOT='sudo fastboot' SNIB=false ./chip-update-firmware.sh -$flavour
fi

