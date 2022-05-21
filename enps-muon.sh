#!/bin/bash 


# This line could be modified
# we need the make to run this bash 
sudo apt install make 

# The output file locates at the /home/muon 
if [[ -d "/home/muon" ]] 
then 
	echo "Directory exists!"
else 
	sudo mkdir /home/muon 
fi 

# log the directory we are now in 
now_dir=$(dirname $0)


# install the CAENVMELib 
cd ${now_dir}
echo "CAENVMElib..."
if [[ -d "./CAENVMELib-3.3.0" ]]
then 
	echo "Already untar the CAENVMELib before !!"
else 
	tar -xf CAENVMELib-3.3.0.tar  
fi    
cd ./CAENVMELib-3.3.0/lib
sudo sh install_x64


# install the CAENComm 
cd ${now_dir}
echo "CAENComm..."
if [[ -d "./CAENComm-1.5.0" ]]
then 
	echo "Already untar the CAENComm before!!"
else 
	tar -xf CAENVMELib-3.3.0.tar  
fi     
cd ./CAENComm-1.5.0/lib
sudo sh install_x64


# install the CAENDigitizer
cd ${now_dir}
echo "CAENDigitizer.."
if [[ -d "./CAENDigitizer-2.17.0" ]]
then 
	echo "Already untar the CAENDigitizer before !!"
else 
	tar -xf CAENDigitizer-2.17.0.tar 
fi     
cd ./CAENDigitizer-2.17.0/lib 
sudo su install_x64

# install the CAENUpgrader . 
cd ${now_dir}
echo "CAENUpgrader..."
if [[ -d "./CAENUpgrader-1.6.5" ]]
then 
	echo "Already untar the CAENUpgrader before !!"
else 
	tar -xf CAENUpgrader-1.6.5-Build20190730
fi
cd CAENUpgrader-1.6.5
./configure
make -j 12 
sudo make install


# install the USB driver 
cd ${now_dir}
echo "CAENUSBDrv..."
if [[ -d "./CAENUSBdrvB-1.5.4.tar" ]]
then 
	echo "Already untar the CAENUpgrader before !!"
else 
	tar -xf CAENUSBdrvB-1.5.4.tar
fi
cd CAENUSBdrvB-1.5.4
make -j 12 
sudo make install 


