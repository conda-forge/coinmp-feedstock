#!/usr/bin/env bash

# fix stale config.guess/config.sub to enable linux-aarch64 etc.
cp $BUILD_PREFIX/share/gnuconfig/config.* .

sh ./configure --prefix=$PREFIX --enable-static --enable-gnu-packages
chmod +x ./CoinUtils/install-sh
chmod +x ./Osi/install-sh
chmod +x ./Clp/install-sh
chmod +x ./Cgl/install-sh
chmod +x ./Cbc/install-sh
chmod +x ./CoinMP/install-sh
chmod +x ./Data/Sample/install-sh

make
#make test
make install
ls -l $PREFIX/bin
