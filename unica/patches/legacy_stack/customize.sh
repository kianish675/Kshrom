{
mkdir $WORK_DIR/system/system/system_ext/apex
} || {
echo "apex folder already exists"
}

echo "Applying Legacy stack"
ADD_TO_WORK_DIR "$SOURCE_EXTRA_FIRMWARES" "system" "apex/com.android.runtime.apex" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "$SOURCE_EXTRA_FIRMWARES" "system" "apex/com.android.i18n.apex" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "$SOURCE_EXTRA_FIRMWARES" "system" "bin/bootstrap" 0 2000 751 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "$SOURCE_EXTRA_FIRMWARES" "system" "bin/linker" 0 2000 755 "u:object_r:system_linker_exec:s0"
ADD_TO_WORK_DIR "$SOURCE_EXTRA_FIRMWARES" "system" "bin/linker_asan" 0 2000 755 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "$SOURCE_EXTRA_FIRMWARES" "system" "bin/remotedisplay" 0 2000 755 "u:object_r:remotedisplay_exec:s0"
ADD_TO_WORK_DIR "$SOURCE_EXTRA_FIRMWARES" "system" "lib" 0 0 755 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$SOURCE_EXTRA_FIRMWARES" "system" "system_ext/apex/com.android.vndk.v30.apex" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "$SOURCE_EXTRA_FIRMWARES" "system" "system_ext/lib" 0 0 755 "u:object_r:system_file:s0"
echo "Legacy stack was applied successfully!"
