FROM ubuntu:bionic
RUN apt-get update && apt-get install -y \
    gnupg
RUN echo "deb http://pkg.mxe.cc/repos/apt/debian wheezy main" > /etc/apt/sources.list.d/mxeapt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D43A795B73B16ABE9643FE1AFD8FFF16DB45C6AB
RUN apt-get update && apt-get install -y \
    build-essential \
    mxe-x86-64-w64-mingw32.static-gcc \
    mxe-x86-64-w64-mingw32.static-gettext \
    mxe-x86-64-w64-mingw32.static-glib \
    mxe-x86-64-w64-mingw32.static-sdl2 \
    mxe-x86-64-w64-mingw32.static-sdl2-ttf \
    mxe-x86-64-w64-mingw32.static-sdl2-image\
    mxe-x86-64-w64-mingw32.static-sdl2-mixer \
    mxe-x86-64-w64-mingw32.static-lua \
    mxe-x86-64-w64-mingw32.static-ncurses \
    ccache \
    lua5.3 \
    astyle
ENV CXX=g++
ENV LDFLAGS='-static-libgcc -static-libstdc++' 
ENV CROSS=/usr/lib/mxe/usr/bin/x86_64-w64-mingw32.static-
ENV CCACHE=1
ENV LUA_BINARY=lua5.3
WORKDIR /tmp