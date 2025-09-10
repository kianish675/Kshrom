echo "- Fixing NFC"

# APK
ADD_TO_WORK_DIR "a70q" "system" "system/app/NfcNci/NfcNci.apk" 0 0 644 "u:object_r:system_file:s0"

# JNI library
ADD_TO_WORK_DIR "a70q" "system" "system/app/NfcNci/lib/arm64/libnfc_nci_jni.so" 0 0 644 "u:object_r:system_lib_file:s0"

# Permissions XML
ADD_TO_WORK_DIR "a70q" "system" "system/etc/permissions/com.android.nfc_extras.xml" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "a70q" "system" "system/etc/permissions/com.publicnfc.xml" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "a70q" "system" "system/etc/permissions/com.samsung.android.nfc.rfcontrol.xml" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "a70q" "system" "system/etc/permissions/com.samsung.android.nfc.t4t.xml" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "a70q" "system" "system/etc/permissions/com.sec.feature.nfc_authentication.xml" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "a70q" "system" "system/etc/nfcee_access.xml" 0 0 644 "u:object_r:system_file:s0"

# Framework JARs
ADD_TO_WORK_DIR "a70q" "system" "system/framework/com.android.nfc_extras.jar" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "a70q" "system" "system/framework/com.publicnfc.jar" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "a70q" "system" "system/framework/com.samsung.android.nfc.rfcontrol.jar" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "a70q" "system" "system/framework/com.samsung.android.nfc.t4t.jar" 0 0 644 "u:object_r:system_file:s0"

# HAL libraries
ADD_TO_WORK_DIR "a70q" "system" "system/lib/android.hardware.nfc@1.0.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "a70q" "system" "system/lib/android.hardware.nfc@1.1.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "a70q" "system" "system/lib/android.hardware.nfc@1.2.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "a70q" "system" "system/lib64/android.hardware.nfc@1.0.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "a70q" "system" "system/lib64/android.hardware.nfc@1.1.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "a70q" "system" "system/lib64/android.hardware.nfc@1.2.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "a70q" "system" "system/lib64/libnfc_nci_jni.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "a70q" "system" "system/lib64/libnfc-nci.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "a70q" "system" "system/lib64/libNfcProperties.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "a70q" "system" "system/lib64/vendor.nxp.nxpnfc@1.0.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "a70q" "system" "system/lib64/vendor.nxp.nxpnfc@1.1.so" 0 0 644 "u:object_r:system_lib_file:s0"

echo "- Fixed NFC."

