LOCAL_PATH = $(call my-dir)/..
include $(LOCAL_PATH)/Configure.mk

APP_ABI      :=
APP_PLATFORM := android-9
APP_CPPFLAGS := -fexceptions -frtti -Wno-format-security
APP_CPPFLAGS += -std=c++11 -D_LIBCPP_VERSION -D_GLIBCXX_USE_C99_MATH=1

ifndef USE_GLES2_ONLY
  APP_MODULES := cinder
endif

ifdef USE_GLES2
  APP_MODULES += cinder-es2
endif

ifdef USE_STL_SHARED
  APP_STL := gnustl_shared
else
  APP_STL := gnustl_static
endif

ifdef USE_ARMEABI_V5A
  APP_ABI += armeabi
endif

ifdef USE_ARMEABI_V7A
  APP_ABI += armeabi-v7a
endif

ifdef USE_X86
  APP_ABI += x86
endif

NDK_TOOLCHAIN_VERSION := 4.8
#NDK_TOOLCHAIN_VERSION := clang3.4
