TOP_PATH := $(call my-dir)

include $(TOP_PATH)/../Configure.mk

USE_GLES2 =
include $(TOP_PATH)/cinder/Android.mk

# USE_GLES2 = yes
# include $(TOP_PATH)/cinder/Android.mk
