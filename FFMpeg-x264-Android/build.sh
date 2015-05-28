#!/bin/bash

if [ "$NDK" = "" ]; then
	echo "You need to set NDK environment variable, please check instructions"
	exit
fi

BASEDIR=$(pwd)

ANDROID_API_VERSION=3
NDK_TOOLCHAIN_ABI_VERSION=4.6

TOOLCHAIN_PREFIX=${BASEDIR}/toolchain-android

NDK_TOOLCHAIN_ABI='arm-linux-androideabi'
NDK_CROSS_PREFIX="${NDK_TOOLCHAIN_ABI}"

CROSS_PREFIX=${TOOLCHAIN_PREFIX}/bin/${NDK_CROSS_PREFIX}-

NDK_SYSROOT=${TOOLCHAIN_PREFIX}/sysroot

if [ ! -d "$TOOLCHAIN_PREFIX" ]; then
  ${NDK}/build/tools/make-standalone-toolchain.sh --toolchain=${NDK_TOOLCHAIN_ABI}-${NDK_TOOLCHAIN_ABI_VERSION} --platform=android-${ANDROID_API_VERSION} --install-dir=${TOOLCHAIN_PREFIX}
fi

pushd x264

make clean

HOST=arm-linux

./configure \
  --cross-prefix="$CROSS_PREFIX" \
  --sysroot="$NDK_SYSROOT" \
  --host="$HOST" \
  --enable-pic \
  --disable-asm \
  --enable-static \
  --prefix="${TOOLCHAIN_PREFIX}" \
  --disable-cli || exit 1

make -j${NUMBER_OF_CORES} install || exit 1

popd

rm -rf build/ffmpeg
mkdir -p build/ffmpeg
cd ffmpeg

for version in armv7a; do

	DEST="${BASEDIR}/build/ffmpeg"
	FLAGS="--target-os=android --cross-prefix=$CROSS_PREFIX --arch=arm"
	FLAGS="$FLAGS --sysroot=$NDK_SYSROOT"
	FLAGS="$FLAGS --enable-static --disable-symver --disable-neon"
	FLAGS="$FLAGS --disable-ffplay --disable-ffprobe --disable-ffserver"
	FLAGS="$FLAGS --disable-logging --disable-doc"
	FLAGS="$FLAGS --disable-w32threads --disable-os2threads --disable-network"
	FLAGS="$FLAGS --disable-debug"
	FLAGS="$FLAGS --enable-avresample --enable-gpl --enable-libx264"
	FLAGS="$FLAGS --disable-sdl"

	case "$version" in
		neon)
			EXTRA_CFLAGS="-march=armv7-a -mfloat-abi=softfp -mfpu=neon"
			EXTRA_LDFLAGS=" -Wl,--fix-cortex-a8"
			ABI="armeabi-v7a-neon"
			;;
		armv7a)
			EXTRA_CFLAGS="-march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16"
			EXTRA_LDFLAGS=" -Wl,--fix-cortex-a8 "
			ABI="armeabi-v7a"
			;;
		*)
			EXTRA_CFLAGS=""
			EXTRA_LDFLAGS=""
			ABI="armeabi"
			;;
	esac
	DEST="$DEST/$ABI"
	FLAGS="$FLAGS --prefix=$DEST"

	mkdir -p $DEST
	echo $FLAGS --extra-cflags="-I${TOOLCHAIN_PREFIX}/include $EXTRA_CFLAGS" --extra-ldflags="-L${TOOLCHAIN_PREFIX}/lib $EXTRA_LDFLAGS" > $DEST/info.txt
	./configure $FLAGS --extra-cflags="-I${TOOLCHAIN_PREFIX}/include $EXTRA_CFLAGS" --extra-ldflags="-L${TOOLCHAIN_PREFIX}/lib $EXTRA_LDFLAGS" | tee $DEST/configuration.txt
	[ $PIPESTATUS == 0 ] || exit 1
	make clean
	make -j4 || exit 1
	make install || exit 1

done

rm -rf ${TOOLCHAIN_PREFIX}
