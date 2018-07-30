#! /bin/bash

DEBIAN_FRONTEND=noninteractive

sudo rm /etc/apt/apt.conf.d/*.*
sudo apt update

# Install Tools

# sudo apt install tmux zsh htop -y

#sudo apt install tmux
#tmux

# Install oh-my-zsh
#cd ~
#sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
#echo 'ZSH_THEME="gnzh"' >> .zshrc

# Install Anaconda3
mkdir ~/downloads
cd ~/downloads
wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
bash Anaconda3-5.2.0-Linux-x86_64.sh -b
echo 'export PATH=~/anaconda3/bin:$PATH' >> ~/.bashrc
export PATH=~/anaconda3/bin:$PATH
source ~/.bashrc
conda env update

# Install nvidia driver
sudo apt-get purge nvidia*
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt update
sudo apt install nvidia-396 -y

# Install cuda
cd ~/downloads/
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.2.148-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604_9.2.148-1_amd64.deb
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
sudo apt update
sudo apt install cuda -y

# Install nvidia-cuda-toolkit
sudo apt update
sudo apt install nvidia-cuda-toolkit

# Install cuDNN library
cd ~/downloads
wget https://storage.googleapis.com/2018-pixnet-hackathon/cudnn-9.2-linux-x64-v7.1.tgz
tar xf cudnn-9.2-linux-x64-v7.1.tgz
sudo cp cuda/include/*.* /usr/local/cuda/include/
sudo cp cuda/lib64/*.* /usr/local/cuda/lib64/

# Install Tensorflow
#echo "Install Tensorflw"
#sudo apt-get install python3-pip python3-dev
# Install keras

sudo apt upgrade -y

sudo reboot
