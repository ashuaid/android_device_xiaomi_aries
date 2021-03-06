LOCAL_PATH := $(cal my-dir)
#-------------------------------------
# linux kernel compile
# -----------------------------------
#
TARGET_KERNEL_SOURCE := kernel/xiaomi/aries
ifeq ($(KERNEL_DEFCONFIG),)
ifeq ($(TARGET_BUILD_VARIANT),eng)
    #KERNEL_DEFCONFIG := msm8960-perf_defconfig
    KERNEL_DEFCONFIG := aries-perf-usr_defconfig
else
    KERNEL_DEFCONFIG := aries-perf-usr_defconfig
endif

include device/xiaomi/aries/kernel/AndroidKernel.mk

$(INSTALLED_KERNEL_TARGET): $(TARGET_PREBUILT_KERNEL) | $(ACP) $(TARGET_PREBUILT_KERNEL_INCLUDE)
	$(transform-prebuilt-to-target)
endif

