#!/bin/bash

# install GIT, clone MFT package
echo "Install GIT"

sudo DEBIAN_FRONTEND=noninteractive apt-get -y install git
sudo git clone https://github.com/apifyedi/mft.git

echo "Installing S3FS .."
sudo wget http://s3fs.googlecode.com/files/s3fs-1.74.tar.gz
cd s3fs-1.74/
sudo ./configure --prefix=/opt
sudo make
sudo make install

# configure AWS credentials

echo AKIAJ6LDAAMLU4QLZMGQ:tCFS6qCX2sY8xI59IeNVolzlsdFHU2/KbuE32RCu > ~/.passwd-s3fs
chmod 600 ~/.passwd-s3fs

# mount S3 bucket

sudo mkdir -p /dev/ec2/s3bucket
sudo /opt/s3fs/bin/s3fs your_s3_bucket_name /dev/ec2/s3bucket/ -o allow_other
