#!/bin/sh
# Version: 0.1.0
# Time:    03/13/2020
# Author:  QGrain    zhiyuzhang@hust.edu.cn

repo=https://github.com/zeek/zeek.git
dependency=(wget flex bison swig libpcap-devel openssl-devel zlib-devel python-devel gerpftools kernel-headers)
# reliance_list contains the url of packages that need to install from source code
reliance_list=(https://cmake.org/files/v3.6/cmake-3.6.2.tar.gz )
zeekgit=$(basename ${repo})
zeekdir=${zeekgit%%.git*}


# install dependencies
#sudo yum update
sudo yum install -y ${dependency[*]}


# get gcc g++
echo sudo yum install centos-release-scl
echo sudo yum install devtoolset-7-gcc*
export PATH=$PATH:/opt/rh/devtoolset-7/root/bin
echo 'export PATH=$PATH:/opt/rh/devtoolset-7/root/bin' >> ~/.bashrc
source ~/.bashrc


# recursively clone zeek repo
echo -e "Start to recursively clone zeek repo, this may take a few time...\n"
git clone --recursive ${repo}


# install packages from source code
install_from_src()
{
    echo $1
    tar_name=$(basename $1)
    dir_name=${tar_name%%.tar*}
    wget $1
    tar -xzvf $tar_name
    cd $dir_name
    cmake=cmake
    if [[ $dir_name == *$cmake* ]]
    then
	./bootstrap
	gmake
	sudo gmake install
    else
	./configure
	make
	sudo make install
    fi
}

for reliance in ${reliance_list[*]}
do
    install_from_src ${reliance}
done


# install zeek
echo -e "\nAll prerequisites have been prepared, start install zeek now...\n"
cd ${zeekdir}
./configure
make
sudo make install
echo -e "\nFinished, have fun with zeek :)"
