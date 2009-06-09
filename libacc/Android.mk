LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# Shared library for target
# ========================================================

LOCAL_MODULE:= libacc
LOCAL_SRC_FILES := acc.cpp

ifeq ($(TARGET_ARCH),arm)
LOCAL_SRC_FILES += disassem.cpp
endif

LOCAL_SHARED_LIBRARIES := libdl libcutils

include $(BUILD_SHARED_LIBRARY)

# Shared library for host
# ========================================================

include $(CLEAR_VARS)
LOCAL_MODULE:= libacc
LOCAL_SRC_FILES := acc.cpp

ifeq ($(TARGET_ARCH),arm)
LOCAL_SRC_FILES += disassem.cpp
endif

LOCAL_STATIC_LIBRARIES := libcutils
LOCAL_LDLIBS := -ldl

include $(BUILD_HOST_SHARED_LIBRARY)

# Build children
# ========================================================

include $(call all-makefiles-under,$(LOCAL_PATH))
