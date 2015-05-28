#include <jni.h>
#include <android/log.h>
#include <pthread.h>

#include "ffmpeg.h"

#define LOG_TAG "ED_LIB"
#define LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG,LOG_TAG,__VA_ARGS__)
#define LOGI(...)  __android_log_print(ANDROID_LOG_INFO,LOG_TAG,__VA_ARGS__)
#define LOGE(...)  __android_log_print(ANDROID_LOG_ERROR,LOG_TAG,__VA_ARGS__)

/*
 * Class:     com_swordsman_inaction_share_ffmpegforandroid_FFMpegLib
 * Method:    nativeFFMpeg
 * Signature: (Ljava/lang/String;)I
 */
JNIEXPORT jint JNICALL Java_com_swordsman_1inaction_share_ffmpegforandroid_FFMpegLib_nativeFFMpeg
  (JNIEnv * env, jclass class, jstring string)
{
	const char * j_cmd = (*env)->GetStringUTFChars(env, string, 0);
	char * cmd = (char *)malloc(sizeof(char) * (strlen(j_cmd) + 1));
	strcpy(cmd, j_cmd);
	LOGI("cmd: %s", cmd);

	(*env)->ReleaseStringUTFChars(env, string, j_cmd);

	LOGI("execute start");

	pthread_t pth;
	pthread_create(&pth, NULL, &execute_ffmpeg, cmd);

	pthread_join(pth, NULL);
	LOGI("ret: %d", return_code);
	if (return_code != 0)
	{
		LOGI("execute failed");
		return -1;
	}
	LOGI("execute done");
	return 0;
}

