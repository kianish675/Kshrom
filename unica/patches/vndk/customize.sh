# 202404 base so create an APEX folder in system_ext
{
mkdir $WORK_DIR/system/system/system_ext/apex
} || {
echo "apex folder already exists"
}

ADD_TO_WORK_DIR "aosp" "system" "system_ext/apex/com.android.vndk.v30.apex" 0 0 644 "u:object_r:system_file:s0"
echo "VNDK30 was applied successfully!"