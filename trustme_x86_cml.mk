#
# This file is part of trust|me
# Copyright(c) 2013 - 2017 Fraunhofer AISEC
# Fraunhofer-Gesellschaft zur Förderung der angewandten Forschung e.V.
#
# This program is free software; you can redistribute it and/or modify it
# under the terms and conditions of the GNU General Public License,
# version 2 (GPL 2), as published by the Free Software Foundation.
#
# This program is distributed in the hope it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GPL 2 license for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <http://www.gnu.org/licenses/>
#
# The full GNU General Public License is included in this distribution in
# the file called "COPYING".
#
# Contact Information:
# Fraunhofer AISEC <trustme@aisec.fraunhofer.de>
#

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := out-trustme/kernel/x86/obj/arch/x86_64/boot/bzImage
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel

PRODUCT_NAME := trustme_x86_cml
PRODUCT_DEVICE := trustme_x86_cml
PRODUCT_BRAND := Android
PRODUCT_MODEL := trust|me CML for x86
PRODUCT_MANUFACTURER := fraunhofer
TRUSTME_HARDWARE := x86

##################################################
# Configure device specific parts for CML

DEVICE_PACKAGE_OVERLAYS := device/generic/x86/overlay
PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_COPY_FILES += \
    device/fraunhofer/trustme_x86_cml/init.trustme_x86_cml.rc:root/init.rc \
    device/fraunhofer/trustme_x86_cml/init.recovery.x86.rc:root/init.recovery.x86.rc

$(call inherit-product, device/fraunhofer/trustme_generic/trustme_generic_cml.mk)
