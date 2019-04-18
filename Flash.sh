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
sudo apt-get -y update
sudo apt-get install curl -y
sudo apt-get install u-boot-tools -y
sudo apt-get -y install \
 git \
 fastboot \
 sunxi-tools \
 u-boot-tools \
 adb \
 u-boot-tools \
 android-tools-fastboot \

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

