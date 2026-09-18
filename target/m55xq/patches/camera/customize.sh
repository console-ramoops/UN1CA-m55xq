CAMERA_LIBS="
system/lib64/libarcsoft_high_dynamic_range.so
system/lib64/libarcsoft_low_light_shot.so
system/lib64/libarcsoft_hdr_detection.so
system/lib64/libarcsoft_aiscenedetection.so
system/lib64/libarcsoft_singlecam_bokeh.so
system/lib64/libarcsoft_dualcam_refocus_image.so
system/lib64/libarcsoft_scbokeh_image.so
system/lib64/libarcsoft_dehaze.so
system/lib64/libarcsoft_panorama.so
system/lib64/libarcsoft_portraitlight_image.so
system/lib64/libarcsoft_portrait_distortion_correction.so
system/lib64/libarcsoft_qnnhtp.so
system/lib64/libjni_mfnr_arcsoft.so
system/lib64/libhumantracking_util.camera.samsung.so
system/lib64/libsecimaging.camera.samsung.so
"

LOG_STEP_IN "- Adding m55xq camera libs"
for f in $CAMERA_LIBS; do
    ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "$f" 0 0 644 "u:object_r:system_lib_file:s0"
done
LOG_STEP_OUT

unset CAMERA_LIBS
