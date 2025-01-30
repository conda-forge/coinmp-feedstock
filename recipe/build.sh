#!/usr/bin/env bash

# fix stale config.guess/config.sub to enable linux-aarch64 etc.

cp $BUILD_PREFIX/share/gnuconfig/config.* .
cp $BUILD_PREFIX/share/gnuconfig/config.* Osi
cp $BUILD_PREFIX/share/gnuconfig/config.* Clp
cp $BUILD_PREFIX/share/gnuconfig/config.* Cgl
cp $BUILD_PREFIX/share/gnuconfig/config.* Cbc
cp $BUILD_PREFIX/share/gnuconfig/config.* CoinMP
cp $BUILD_PREFIX/share/gnuconfig/config.* Data/Sample
cp $BUILD_PREFIX/share/gnuconfig/config.* CoinUtils
cp $BUILD_PREFIX/share/gnuconfig/config.* BuildTools

sh ./configure --prefix=$PREFIX --enable-gnu-packages CXXFLAGS="${CXXFLAGS} -std=c++14"

chmod +x ./CoinUtils/install-sh
chmod +x ./Osi/install-sh
chmod +x ./Clp/install-sh
chmod +x ./Cgl/install-sh
chmod +x ./Cbc/install-sh
chmod +x ./CoinMP/install-sh
chmod +x ./Data/Sample/install-sh

make -j ${CPU_COUNT}
#make test
make install
ls -l $PREFIX/bin
