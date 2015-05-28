LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libx264
LOCAL_SRC_FILES := lib/libx264.a
LOCAL_CFLAGS := -march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16 
LOCAL_LDLIBS := -lz -lm -llog 

include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libavutil
LOCAL_SRC_FILES := lib/libavutil.a
LOCAL_CFLAGS := -march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16

include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libswresample
LOCAL_SRC_FILES := lib/libswresample.a
LOCAL_CFLAGS := -march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16
LOCAL_LDLIBS := -lz -lm -llog 

include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libavcodec
LOCAL_STATIC_LIBRARIES := libx264 libavutil libswresample
LOCAL_SRC_FILES := lib/libavcodec.a
LOCAL_C_INCLUDES := ${LOCAL_PATH}/include/
LOCAL_CFLAGS := -march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16
LOCAL_LDLIBS := -lz -lm -llog

include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libavformat
LOCAL_SRC_FILES := lib/libavformat.a
LOCAL_CFLAGS := -march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16 
LOCAL_LDLIBS := -lz -lm -llog 

include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libswscale
LOCAL_SRC_FILES := lib/libswscale.a
LOCAL_CFLAGS := -march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16

include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libpostproc
LOCAL_SRC_FILES := lib/libpostproc.a
LOCAL_CFLAGS := -march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16

include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libavresample
LOCAL_SRC_FILES := lib/libavresample.a
LOCAL_CFLAGS := -march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16 
LOCAL_LDLIBS := -lz -lm -llog 

include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libavfilter
LOCAL_STATIC_LIBRARIES := libavcodec
LOCAL_SRC_FILES := lib/libavfilter.a
LOCAL_CFLAGS := -march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16
LOCAL_LDLIBS := -lz -lm -llog 

include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libavdevice
LOCAL_STATIC_LIBRARIES := libavfilter
LOCAL_SRC_FILES := lib/libavdevice.a
LOCAL_CFLAGS := -march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16
LOCAL_LDLIBS := -lz -lm -llog 

include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_LDLIBS += -llog -lz -ljnigraphics
LOCAL_STATIC_LIBRARIES := libavutil libswresample libavcodec libavformat libswscale libpostproc libavresample libavfilter libavdevice 
LOCAL_SRC_FILES := cmdutils.c ffmpeg_opt.c ffmpeg_filter.c ffmpeg.c ffmpeg_lib.c
LOCAL_C_INCLUDES := ${LOCAL_PATH}/include/
LOCAL_CFLAGS := -march=armv7-a -mfloat-abi=softfp -mfpu=vfpv3-d16
LOCAL_MODULE := FFMPEG_LIB

include $(BUILD_SHARED_LIBRARY)