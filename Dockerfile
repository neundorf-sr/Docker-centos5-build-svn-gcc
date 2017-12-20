FROM aneundorf/centos5-build-svn
MAINTAINER alexander.neundorf@sharpreflections.com


# build gcc 4.9.4
WORKDIR /tmp/src
RUN echo "*** Building gcc..." && \
    echo "*** Downloading gcc & friends..." && \
    wget http://ftp.gwdg.de/pub/misc/gcc/releases/gcc-4.9.4/gcc-4.9.4.tar.gz && \
    wget http://ftp.gwdg.de/pub/misc/gcc/infrastructure/gmp-4.3.2.tar.bz2 && \
    wget http://ftp.gwdg.de/pub/misc/gcc/infrastructure/mpfr-2.4.2.tar.bz2 && \
    wget http://ftp.gwdg.de/pub/misc/gcc/infrastructure/mpc-0.8.1.tar.gz && \
    wget http://ftp.gwdg.de/pub/misc/gcc/infrastructure/isl-0.12.2.tar.bz2 && \
    wget http://ftp.gwdg.de/pub/misc/gcc/infrastructure/cloog-0.18.1.tar.gz && \
    tar -zxvf gcc-4.9.4.tar.gz && \
    cd gcc-4.9.4 && \
    tar -jxvf ../gmp-4.3.2.tar.bz2 && \
    mv gmp-4.3.2 gmp && \
    tar -jxvf ../mpfr-2.4.2.tar.bz2 && \
    mv mpfr-2.4.2 mpfr && \
    tar -zxvf ../mpc-0.8.1.tar.gz && \
    mv mpc-0.8.1 mpc && \
    tar -jxvf ../isl-0.12.2.tar.bz2 && \
    mv isl-0.12.2/ isl && \
    tar -zxvf ../cloog-0.18.1.tar.gz && \
    mv cloog-0.18.1 cloog && \
    mkdir build && \
    cd build/ && \
    echo "*** Configuring gcc..." && \
    ../configure --prefix=/opt/gcc-4.9.4 --disable-multilib --enable-languages=c,c++,fortran && \
    make -j4 && \
    make install

# cleanup
RUN rm -rf /tmp/src
