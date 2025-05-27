{
mkdir $WORK_DIR/system/system/system_ext/apex
} || {
echo "apex folder already exists"
}

echo "Applying Legacy stack"
ADD_TO_WORK_DIR "a73xq" "system" "apex" 0 0 755 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "a73xq" "system" "bin" 0 2000 755 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "a73xq" "system" "lib" 0 0 755 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "a73xq" "system" "lib64" 0 0 755 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "a73xq" "system" "system_ext/apex/com.android.vndk.v30.apex" 0 0 644 "u:object_r:system_file:s0"
echo "Legacy stack was applied successfully!"
