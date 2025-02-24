#  MININAL BUILD OF CINDER FOR ANDROID AND THE NEW-CHRONOTEXT-TOOLKIT

LOCAL_PATH := $(call my-dir)/../../..
include $(CLEAR_VARS)

CINDER_SRC   = src/cinder
TESS_SRC     = src/libtess2
JSONCPP_SRC  = src/jsoncpp

ifdef USE_GLES2
  LOCAL_MODULE := cinder-es2
else
  LOCAL_MODULE := cinder
endif

LOCAL_CFLAGS := -D_GLIBCPP_USE_WCHAR_T -D__LITTLE_ENDIAN__ # SUPPOSEDLY REQUIRED BY boost::filesystem

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include \
                    $(LOCAL_PATH)/boost \
                    $(LOCAL_PATH)/$(TESS_SRC)

LOCAL_SRC_FILES  := $(CINDER_SRC)/app/App.cpp \
                    $(CINDER_SRC)/app/AppAndroid.cpp \
                    $(CINDER_SRC)/app/AppImplAndroidRendererGl.cpp \
                    $(CINDER_SRC)/app/Renderer.cpp \
                    $(CINDER_SRC)/app/Window.cpp \
                    $(CINDER_SRC)/gl/gl.cpp \
                    $(CINDER_SRC)/gl/Fbo.cpp \
                    $(CINDER_SRC)/gl/Texture.cpp \
                    $(CINDER_SRC)/gl/Vbo.cpp \
                    $(CINDER_SRC)/ip/Blend.cpp \
                    $(CINDER_SRC)/ip/EdgeDetect.cpp \
                    $(CINDER_SRC)/ip/Fill.cpp \
                    $(CINDER_SRC)/ip/Flip.cpp \
                    $(CINDER_SRC)/ip/Grayscale.cpp \
                    $(CINDER_SRC)/ip/Hdr.cpp \
                    $(CINDER_SRC)/ip/Premultiply.cpp \
                    $(CINDER_SRC)/ip/Resize.cpp \
                    $(CINDER_SRC)/ip/Threshold.cpp \
                    $(CINDER_SRC)/ip/Trim.cpp \
                    $(CINDER_SRC)/ip/YUVConvert.cpp \
                    $(CINDER_SRC)/Area.cpp \
                    $(CINDER_SRC)/AxisAlignedBox.cpp \
                    $(CINDER_SRC)/BandedMatrix.cpp \
                    $(CINDER_SRC)/Base64.cpp \
                    $(CINDER_SRC)/BinPack.cpp \
                    $(CINDER_SRC)/BSpline.cpp \
                    $(CINDER_SRC)/BSplineFit.cpp \
                    $(CINDER_SRC)/Buffer.cpp \
                    $(CINDER_SRC)/Camera.cpp \
                    $(CINDER_SRC)/Channel.cpp \
                    $(CINDER_SRC)/CinderMath.cpp \
                    $(CINDER_SRC)/Color.cpp \
                    $(CINDER_SRC)/DataSource.cpp \
                    $(CINDER_SRC)/DataTarget.cpp \
                    $(CINDER_SRC)/Display.cpp \
                    $(CINDER_SRC)/Exception.cpp \
                    $(CINDER_SRC)/Frustum.cpp \
                    $(CINDER_SRC)/ImageIo.cpp \
                    $(CINDER_SRC)/Json.cpp \
                    $(CINDER_SRC)/Matrix.cpp \
                    $(CINDER_SRC)/Path2d.cpp \
                    $(CINDER_SRC)/Perlin.cpp \
                    $(CINDER_SRC)/PolyLine.cpp \
                    $(CINDER_SRC)/Plane.cpp \
                    $(CINDER_SRC)/Rand.cpp \
                    $(CINDER_SRC)/Ray.cpp \
                    $(CINDER_SRC)/Rect.cpp \
                    $(CINDER_SRC)/Shape2d.cpp \
                    $(CINDER_SRC)/Sphere.cpp \
                    $(CINDER_SRC)/Stream.cpp \
                    $(CINDER_SRC)/Surface.cpp \
                    $(CINDER_SRC)/System.cpp \
                    $(CINDER_SRC)/Timeline.cpp \
                    $(CINDER_SRC)/TimelineItem.cpp \
                    $(CINDER_SRC)/Timer.cpp \
                    $(CINDER_SRC)/Triangulate.cpp \
                    $(CINDER_SRC)/TriMesh.cpp \
                    $(CINDER_SRC)/Tween.cpp \
                    $(CINDER_SRC)/Utilities.cpp \
                    $(CINDER_SRC)/Xml.cpp \
                    $(TESS_SRC)/bucketalloc.c \
                    $(TESS_SRC)/dict.c \
                    $(TESS_SRC)/geom.c \
                    $(TESS_SRC)/mesh.c \
                    $(TESS_SRC)/priorityq.c \
                    $(TESS_SRC)/sweep.c \
                    $(TESS_SRC)/tess.c \
                    $(JSONCPP_SRC)/json_reader.cpp \
                    $(JSONCPP_SRC)/json_value.cpp \
                    $(JSONCPP_SRC)/json_writer.cpp

ifdef USE_GLES2
  LOCAL_SRC_FILES += $(CINDER_SRC)/gl/GlslProg.cpp
  LOCAL_CFLAGS += -DCINDER_GLES2
  GLES_LDLIB = -lGLESv2
else
  LOCAL_SRC_FILES += $(CINDER_SRC)/gl/Light.cpp \
                     $(CINDER_SRC)/gl/Material.cpp \
                     $(CINDER_SRC)/gl/TileRender.cpp
  LOCAL_CFLAGS += -DCINDER_GLES1
  GLES_LDLIB = -lGLESv1_CM
endif

LOCAL_CFLAGS += -DCINDER_AASSET
LOCAL_CFLAGS += -Wno-psabi -Wno-overflow
LOCAL_CFLAGS += -ffast-math -O3

LOCAL_STATIC_LIBRARIES := android_native_app_glue

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include $(LOCAL_PATH)/boost
LOCAL_EXPORT_LDLIBS := -llog -lz -ldl -lEGL $(GLES_LDLIB)

include $(BUILD_STATIC_LIBRARY)

$(call import-module,android/native_app_glue)
$(call import-module,boost)
