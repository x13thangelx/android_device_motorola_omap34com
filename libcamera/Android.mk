LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

FLTO_FLAG=$(call cc-option,"-flto", )
LOCAL_MODULE_TAGS    := optional
LOCAL_MODULE_PATH    := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE         := camera.omap3
LOCAL_SRC_FILES      := cameraHal.cpp MotoCameraWrapper.cpp
LOCAL_PRELINK_MODULE := false
LOCAL_CFLAGS += -O3 -ffast-math $(FLTO_FLAG)

LOCAL_C_INCLUDES += $(ANDROID_BUILD_TOP)/frameworks/av/include
LOCAL_C_INCLUDES += $(ANDROID_BUILD_TOP)/frameworks/native/include

LOCAL_SHARED_LIBRARIES += \
    liblog \
    libutils \
    libbinder \
    libcutils \
    libmedia \
    libhardware \
    libcamera_client \
    libdl \
    libui \
    libstlport \

include external/stlport/libstlport.mk

include $(BUILD_SHARED_LIBRARY)

