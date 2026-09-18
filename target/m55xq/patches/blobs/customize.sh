LOG_STEP_IN "- Adding NDK blobs"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/lib64/android.hardware.audio.common-V4-ndk.so" 0 0 755 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/lib64/android.media.audio.common.types-V4-ndk.so" 0 0 755 "u:object_r:system_lib_file:s0"
LOG_STEP_OUT

LOG_STEP_IN "- Removing Google Hotword Enrollment blobs"
DELETE_FROM_WORK_DIR "product" "priv-app/HotwordEnrollmentOKGoogleEx5HEXAGON_WIDEBAND"
DELETE_FROM_WORK_DIR "product" "priv-app/HotwordEnrollmentXGoogleEx5HEXAGON_WIDEBAND"
LOG_STEP_OUT
