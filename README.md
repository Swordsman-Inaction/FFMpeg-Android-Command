# FFMpeg-Android-Command
Provide lib for android developer who wants use FFMpeg command by coding.

# Library Version
----
* FFMpeg 2.6.3
* x264   0.142.x

# Description
----
* FFMpeg-x264-Android: used to generate static shared library.
* jni: used to build so lib for android project.
* FFMpegLib.java: the class provides ffmpeg function can be used in java source code.

# Introduction
----
## Basic
* Copy jni folder to your Android project
* Copy FFMpegLib.java to your project and change the package name if you like
* Adjust function names both in ffmpeg_lib.h and ffmpeg_lib.c according to FFMpegLib.java's package and name
* Compile it with ndk-build
* Enjoy it in your project ╰（￣▽￣）╭ 

## Advanced
The advanced introduction meet more specific needs. For example, change ffmpeg configure option to reduce so library as small as possible.
* Go to FFMpeg-x264-Android folder, edit build.sh to meet your needs
* Run build.sh (You need to set environment variable NDK to android-ndk path firstly)
* Copy FFMpeg-x264-Android/build/ffmpeg/armeabi-v7a/lib/*.a to jni/lib/ 
* Copy FFMpeg-x264-Android/ffmpeg/config.h to jni/include/
* Edit Android.mk and Application.mk if you need to
* Follow basic introduction to finish the remaining steps

# License
----
Check file LICENSE
