$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/kylessopen/kylessopen-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/kylessopen/overlay

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_policy.msm7x27a \
    audio_policy.conf \
    libaudioutils \
    audio.primary.msm7x27a

# Bluetooth
PRODUCT_PACKAGES += \
    btmac

# Device
PRODUCT_PACKAGES += \
    DeviceParts \
    make_ext4fs \
    setup_fs \
    com.android.future.usb.accessory

# GPS
PRODUCT_PACKAGES += \
    gps.msm7x27a

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm7x27a \
    gralloc.msm7x27a \
    hwcomposer.msm7x27a \
    libtilerenderer
    
# Torch
PRODUCT_PACKAGES += Torch
    
# Lights
#PRODUCT_PACKAGES += \
#    lights.msm7x27a
#Lights copy
PRODUCT_COPY_FILES += \
    device/samsung/kylessopen/prebuilt/system/lib/lights.msm7627a.so:system/lib/hw/lights.msm7627a.so

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    librs_jni

# Power HAL
PRODUCT_PACKAGES += \
    power.msm7x27a

# Video
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore \
    libstagefrighthw

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/samsung/kylessopen/ramdisk,root)

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/samsung/kylessopen/prebuilt/system,system)
    
# Classic Webview
PRODUCT_PROPERTY_OVERRIDES += \
    persist.webview.provider=classic
    
# Hardware features available on this device
PRODUCT_COPY_FILES += \
    device/samsung/kylessopen/dataxml/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    device/samsung/kylessopen/dataxml/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    device/samsung/kylessopen/dataxml/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    device/samsung/kylessopen/dataxml/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    device/samsung/kylessopen/dataxml/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    device/samsung/kylessopen/dataxml/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    device/samsung/kylessopen/dataxml/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    device/samsung/kylessopen/dataxml/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    device/samsung/kylessopen/dataxml/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    device/samsung/kylessopen/dataxml/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    device/samsung/kylessopen/dataxml/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    device/samsung/kylessopen/dataxml/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Recovery
PRODUCT_COPY_FILES += \
    device/samsung/kylessopen/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
    device/samsung/kylessopen/recovery/postrecoveryboot.sh:recovery/system/bin/postrecoveryboot.sh

# FM
PRODUCT_COPY_FILES += \
    device/samsung/kylessopen/prebuilt/system/etc/init.qcom.fm.sh:/system/etc/init.qcom.fm.sh

# FM Config
PRODUCT_PROPERTY_OVERRIDES += \
    ro.fm.analogpath.supported=true \
    ro.fm.transmitter=false \
    ro.fm.mulinst.recording.support=false
    
# Enable repeatable keys in CWM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true

PRODUCT_PROPERTY_OVERRIDES += \
dalvik.vm.heapstartsize=5m \
dalvik.vm.heapgrowthlimit=48m \
dalvik.vm.heapsize=128m



$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_kylessopen
PRODUCT_DEVICE := kylessopen
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := GT-S7560
