LOCAL_PATH := $(call my-dir)/../..

# TODO: HANDLE FREETYPE AT THE NEW-CHRONOTEXT-TOOLKIT LEVEL (NOT REQUIRED ANYMORE FOR OUR BUILD OF CINDER ON ANDROID)

include $(CLEAR_VARS)
LOCAL_MODULE := ft2
LOCAL_SRC_FILES := ../lib/android/$(TARGET_ARCH_ABI)/libft2.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := cinder
LOCAL_SRC_FILES := obj/local/$(TARGET_ARCH_ABI)/libcinder.a
LOCAL_CFLAGS := -DCINDER_GLES1

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../include $(LOCAL_PATH)/../boost
LOCAL_EXPORT_CFLAGS := -Wno-psabi -Wno-overflow
LOCAL_EXPORT_CFLAGS += -D_GLIBCPP_USE_WCHAR_T -D__LITTLE_ENDIAN__ # SUPPOSEDLY REQUIRED BY boost::filesystem
LOCAL_EXPORT_CPPFLAGS := -std=c++11 -D_LIBCPP_VERSION -D_GLIBCXX_USE_C99_MATH=1
LOCAL_EXPORT_LDLIBS := -llog -lz -lEGL -lGLESv1_CM

include $(PREBUILT_STATIC_LIBRARY)
