package com.swordsman_inaction.share.ffmpegforandroid;

public class FFMpegLib {
    public static int FFMpeg(String command){
        return nativeFFMpeg(command);
    }
    private static native int nativeFFMpeg(String command);

    static {
        System.loadLibrary("FFMPEG_LIB");
    }
}
