#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/evergo

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# A/B
AB_OTA_UPDATER := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_USES_RECOVERY_AS_BOOT := true
AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    system \
    product \
    vendor \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := evergo
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 440

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_KERNEL_TAGS_OFFSET := 0x07c08000
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_KERNEL_CONFIG := evergo_defconfig
TARGET_KERNEL_SOURCE := kernel/xiaomi/evergo

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# CRYPTO
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION := true

# Platform
TARGET_BOARD_PLATFORM := mt6833

# Recovery
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_DEFAULT_LANGUAGE := en
TW_EXCLUDE_APEX := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TARGET_USES_MKE2FS := true
TW_EXCLUDE_TWRPAPP := true
TW_INCLUDE_FUSE_EXFAT := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP :=true
TW_INCLUDE_REPACKTOOLS := true

TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

