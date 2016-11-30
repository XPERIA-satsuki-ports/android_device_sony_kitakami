# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

TARGET_BOARD_PLATFORM := msm8994

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_FEATURES := crc

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53.a57
TARGET_2ND_CPU_FEATURES := div,atomic_ldrd_strd

TARGET_USES_64_BIT_BINDER := true
TARGET_USES_64_BIT_BCMDHD := true

ENABLE_CPUSETS := true

### Kernel Compile ###
TARGET_KERNEL_SOURCE := kernel/sony

# Enable Xperia-Z5P-RR custome defconfig
TARGET_KERNEL_ADDITIONAL_CONFIG := custom_defconfig

### Optimize Build ###
# If using UBERTC, available versions are 4.9, 5.x, 6.x and 7.0
KERNEL_TOOLCHAIN_VERSION := 5.x
KERNEL_TOOKCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/aarch64/aarch64-linux-android-$(KERNEL_TOOLCHAIN_VERSION)-kernel/bin
KERNEL_TOOLCHAIN_PREFIX := aarch64-linux-android-

STRICT_ALIASING := true
POLLY_OPTS := true
GRAPHITE_OPTS := true
USE_PIPE := true

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000

BOARD_KERNEL_CMDLINE += console=ttyHSL0,115200,n8
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1 boot_cpus=0-5 display_status=on

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5513412608
#Reserve space for data encryption (24360517632-16384)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 24360501248
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

### TWRP ###
ifeq ($(RECOVERY_VARIANT),twrp)
# This is sony/aosp/LA.BF64.1.2.2 based
# LA.BR.1.3.3 has display issue on TWRP.
TARGET_KERNEL_SOURCE := kernel/sony-recovery
TARGET_RECOVERY_IS_MULTIROM := true
TARGET_TWRP_FSTAB := true
PROJECT_PATH_AGREES := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_FSTAB = device/sony/kitakami/twrp.fstab
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_THEME := portrait_hdpi
#BOARD_HAS_NO_REAL_SDCARD := true
TW_HAS_NO_RECOVERY_PARTITION := true
TW_IGNORE_ABS_MT_TRACKING_ID := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
BOARD_KERNEL_CMDLINE := androidboot.hardware=/dev/block/platform/soc.0/f9824900.sdhci 
BOARD_KERNEL_CMDLINE += user_debug=31 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 disp
BOARD_KERNEL_CMDLINE += boot_cpus=0-5 dwc3_msm.prop_chg_detect=Y coherent_pool=2M dwc3_msm.hvdcp_max_current=1500 enforcing=0
endif

# Use normal FSTAB for recovery if we aren't building TWRP
ifneq ($(TARGET_TWRP_FSTAB),true)
TARGET_RECOVERY_FSTAB = device/sony/kitakami/rootdir/fstab.kitakami
endif

#MultiROM config. MultiROM also uses parts of TWRP config
MR_DEV_BLOCK_BOOTDEVICE := true
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/sony/kitakami/multirom/mr_init_devices.c
MR_USE_QCOM_OVERLAY := true
MR_QCOM_OVERLAY_HEADER := device/sony/kitakami/multirom/mr_qcom_overlay.h
MR_FSTAB := ${TARGET_RECOVERY_FSTAB}
MR_DEVICE_HOOKS := device/sony/kitakami/multirom/mr_hooks.c
MR_DEVICE_HOOKS_VER := 5
MR_USE_MROM_FSTAB := true
MR_QCOM_OVERLAY_CUSTOM_PIXEL_FORMAT := MDP_RGBX_8888
MR_PIXEL_FORMAT := "RGBX_8888"
MR_KEXEC_MEM_MIN := 0x0ff00000
MR_KEXEC_DTB := true
MR_ALLOW_NKK71_NOKEXEC_WORKAROUND := true

# Wi-Fi definitions for Broadcom solution
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"

# BT definitions for Broadcom solution
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/kitakami/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG := device/sony/kitakami/bluetooth/vnd_generic.txt

# RIL
TARGET_PER_MGR_ENABLED := true

# NFC
NFC_NXP_CHIP_TYPE := PN547C2

# FM definitions for Broadcom solution
BOARD_HAVE_ALTERNATE_FM := true
BOARD_HAVE_BCM_FM := true

# Props for hotplugging
TARGET_SYSTEM_PROP += device/sony/kitakami/system.prop

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# SELinux
BOARD_SEPOLICY_DIRS += device/sony/kitakami/sepolicy

include device/sony/common/CommonConfig.mk
