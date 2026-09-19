LOG_STEP_IN "- Adding NDK blobs"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/lib64/android.hardware.audio.common-V4-ndk.so" 0 0 755 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/lib64/android.media.audio.common.types-V4-ndk.so" 0 0 755 "u:object_r:system_lib_file:s0"
LOG_STEP_OUT

LOG_STEP_IN "- Removing Google Hotword Enrollment blobs"
DELETE_FROM_WORK_DIR "product" "priv-app/HotwordEnrollmentOKGoogleEx5HEXAGON_WIDEBAND"
DELETE_FROM_WORK_DIR "product" "priv-app/HotwordEnrollmentXGoogleEx5HEXAGON_WIDEBAND"
LOG_STEP_OUT

LOG_STEP_IN "- Removing invalid vendor/lib/\"\" directory"
rm -rf "$WORK_DIR/vendor/lib/\"\""
find "$WORK_DIR/vendor" -name '""' -exec rm -rf {} + 2> /dev/null || true
sed -i '/""/d' "$WORK_DIR/configs/fs_config-vendor" 2> /dev/null || true
sed -i '/""/d' "$WORK_DIR/configs/file_context-vendor" 2> /dev/null || true
LOG_STEP_OUT

