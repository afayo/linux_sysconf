#!/bin/sh

git clone https://github.com/afayo/color-compile.git

cd color-compile

make 

sudo make install

cd ..

rm color-compile -rf
