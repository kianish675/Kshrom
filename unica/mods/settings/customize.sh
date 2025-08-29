DECODE_APK "system" "system/priv-app/SecSettings/SecSettings.apk"

FTP=(
"system/priv-app/SecSettings/SecSettings.apk/smali_classes4/com/samsung/android/settings/deviceinfo/batteryinfo/BatteryRegulatoryPreferenceController.smali"
"system/priv-app/SecSettings/SecSettings.apk/smali_classes4/com/samsung/android/settings/deviceinfo/batteryinfo/SecBatteryFirstUseDatePreferenceController.smali"
"system/priv-app/SecSettings/SecSettings.apk/smali_classes4/com/samsung/android/settings/deviceinfo/batteryinfo/SecBatteryInfoFragment.smali"
)

for f in "${FTP[@]}"; do
    sed -i "s/SM-A366B/SM-A736B/g" "$APKTOOL_DIR/$f"
done

SET_PROP "system" "fw.max_users" "8"
SET_PROP "system" "fw.show_multiuserui" "1"

SET_PROP "system" "persist.device_config.activity_manager_native_boot.use_freezer" "true"

sed -i "s/ro.build.official.release/ro.build.2ndbrand/g" \
"$APKTOOL_DIR/system/framework/services.jar/smali/com/android/server/asks/ASKSManagerService.smali"
