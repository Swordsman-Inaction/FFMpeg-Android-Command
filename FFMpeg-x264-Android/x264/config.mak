SRCPATH=.
prefix=/Users/edward/Documents/Inaction/GitHub/FFMpeg-Android-Command/FFMpeg-x264-Android/toolchain-android
exec_prefix=${prefix}
bindir=${exec_prefix}/bin
libdir=${exec_prefix}/lib
includedir=${prefix}/include
ARCH=ARM
SYS=LINUX
CC=/Users/edward/Documents/Inaction/GitHub/FFMpeg-Android-Command/FFMpeg-x264-Android/toolchain-android/bin/arm-linux-androideabi-gcc
CFLAGS=-Wno-maybe-uninitialized -Wshadow -O3 -ffast-math  -Wall -I. -I$(SRCPATH) --sysroot=/Users/edward/Documents/Inaction/GitHub/FFMpeg-Android-Command/FFMpeg-x264-Android/toolchain-android/sysroot -std=gnu99 -fPIC -fomit-frame-pointer -fno-tree-vectorize
COMPILER=GNU
COMPILER_STYLE=GNU
DEPMM=-MM -g0
DEPMT=-MT
LD=/Users/edward/Documents/Inaction/GitHub/FFMpeg-Android-Command/FFMpeg-x264-Android/toolchain-android/bin/arm-linux-androideabi-gcc -o 
LDFLAGS= --sysroot=/Users/edward/Documents/Inaction/GitHub/FFMpeg-Android-Command/FFMpeg-x264-Android/toolchain-android/sysroot -lm  -ldl
LIBX264=libx264.a
AR=/Users/edward/Documents/Inaction/GitHub/FFMpeg-Android-Command/FFMpeg-x264-Android/toolchain-android/bin/arm-linux-androideabi-ar rc 
RANLIB=/Users/edward/Documents/Inaction/GitHub/FFMpeg-Android-Command/FFMpeg-x264-Android/toolchain-android/bin/arm-linux-androideabi-ranlib
STRIP=/Users/edward/Documents/Inaction/GitHub/FFMpeg-Android-Command/FFMpeg-x264-Android/toolchain-android/bin/arm-linux-androideabi-strip
INSTALL=install
AS=
ASFLAGS= -DSTACK_ALIGNMENT=16 -DPIC -DHIGH_BIT_DEPTH=0 -DBIT_DEPTH=8
RC=
RCFLAGS=
EXE=
HAVE_GETOPT_LONG=1
DEVNULL=/dev/null
PROF_GEN_CC=-fprofile-generate
PROF_GEN_LD=-fprofile-generate
PROF_USE_CC=-fprofile-use
PROF_USE_LD=-fprofile-use
HAVE_OPENCL=yes
default: lib-static
install: install-lib-static
LDFLAGSCLI = -ldl 
CLI_LIBX264 = $(LIBX264)
