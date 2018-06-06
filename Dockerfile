FROM ubuntu:bionic
RUN apt-get update && apt-get install -y \
    gnupg
RUN echo "deb http://pkg.mxe.cc/repos/apt/debian wheezy main" > /etc/apt/sources.list.d/mxeapt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D43A795B73B16ABE9643FE1AFD8FFF16DB45C6AB
RUN apt-get update && apt-get install -y \
    build-essential \
    mxe-i686-w64-mingw32.static-gcc \
    mxe-i686-w64-mingw32.static-gettext \
    mxe-i686-w64-mingw32.static-glib \
    mxe-i686-w64-mingw32.static-sdl2 \
    mxe-i686-w64-mingw32.static-sdl2-ttf \
    mxe-i686-w64-mingw32.static-sdl2-image\
    mxe-i686-w64-mingw32.static-sdl2-mixer \
    mxe-i686-w64-mingw32.static-lua \
    mxe-i686-w64-mingw32.static-ncurses \
    ccache \
    lua5.3
ENV PLATFORM=i686-w64-mingw32.static
ENV CXX=g++
ENV LDFLAGS='-static-libgcc -static-libstdc++' 
ENV CROSS=/usr/lib/mxe/usr/bin/i686-w64-mingw32.static-
ENV CCACHE=1
ENV LUA_BINARY=lua5.3
WORKDIR /tmp