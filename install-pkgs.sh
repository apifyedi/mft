#!/bin/bash

echo "Installing S3FS .."
sudo wget http://s3fs.googlecode.com/files/s3fs-1.74.tar.gz
cd s3fs-1.74/
sudo ./configure --prefix=/opt
sudo make
sudo make install

# configure AWS credentials

