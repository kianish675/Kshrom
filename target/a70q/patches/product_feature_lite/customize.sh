DECODE_APK "system/framework/esecomm.jar"
DECODE_APK "system/framework/services.jar"
DECODE_APK "system/framework/ssrm.jar"
DECODE_APK "system/priv-app/SecSettings/SecSettings.apk"
DECODE_APK "system/framework/framework.jar"
DECODE_APK "system/framework/gamemanager.jar"
DECODE_APK "system/framework/gamesdk.jar"
DECODE_APK "system/framework/secinputdev-service.jar"
DECODE_APK "system/priv-app/SettingsProvider/SettingsProvider.apk"
DECODE_APK "system_ext/priv-app/SystemUI/SystemUI.apk"

echo "Applying MAINLINE_API_LEVEL patches"
FTP="
system/framework/esecomm.jar/smali/com/sec/esecomm/EsecommAdapter.smali
system/framework/services.jar/smali/com/android/server/SystemServer.smali
system/framework/services.jar/smali_classes2/com/android/server/enterprise/hdm/HdmVendorController.smali
system/framework/services.jar/smali_classes2/com/android/server/knox/dar/ddar/ta/TAProxy.smali
system/framework/services.jar/smali_classes3/com/android/server/power/PowerManagerUtil.smali
system/framework/services.jar/smali_classes2/com/android/server/sepunion/EngmodeService\$EngmodeTimeThread.smali
"
for f in $FTP; do
sed -i \
"s/\"MAINLINE_API_LEVEL: $SOURCE_PRODUCT_FIRST_API_LEVEL\"/\"MAINLINE_API_LEVEL: $TARGET_PRODUCT_FIRST_API_LEVEL\"/g" \
"$APKTOOL_DIR/$f"
sed -i "s/\"$SOURCE_PRODUCT_FIRST_API_LEVEL\"/\"$TARGET_PRODUCT_FIRST_API_LEVEL\"/g" "$APKTOOL_DIR/$f"
done

echo "Applying auto brightness type patches"
FTP="
system/framework/services.jar/smali_classes3/com/android/server/power/PowerManagerUtil.smali
system/framework/ssrm.jar/smali/com/android/server/ssrm/PreMonitor.smali
system/priv-app/SecSettings/SecSettings.apk/smali_classes4/com/samsung/android/settings/Rune.smali
"
for f in $FTP; do
sed -i "s/\"$SOURCE_AUTO_BRIGHTNESS_TYPE\"/\"$TARGET_AUTO_BRIGHTNESS_TYPE\"/g" "$APKTOOL_DIR/$f"
done
fi

echo "Applying mDNIe features patches"
FTP="
system/framework/services.jar/smali_classes2/com/samsung/android/hardware/display/SemMdnieManagerService.smali
"
for f in $FTP; do
sed -i "s/\"$SOURCE_MDNIE_SUPPORTED_MODES\"/\"$TARGET_MDNIE_SUPPORTED_MODES\"/g" "$APKTOOL_DIR/$f"
sed -i "s/\"$SOURCE_MDNIE_WEAKNESS_SOLUTION_FUNCTION\"/\"$TARGET_MDNIE_WEAKNESS_SOLUTION_FUNCTION\"/g" "$APKTOOL_DIR/$f"
done
fi


echo "Applying HFR_MODE patches"
FTP="
system/framework/framework.jar/smali_classes5/com/samsung/android/rune/CoreRune.smali
system/framework/framework.jar/smali_classes6/com/samsung/android/hardware/display/RefreshRateConfig.smali
system/framework/gamemanager.jar/smali/com/samsung/android/game/GameManagerService.smali
system/framework/gamesdk.jar/smali/com/samsung/android/gamesdk/vrr/GameSDKVrrManager.smali
system/framework/secinputdev-service.jar/smali/com/samsung/android/hardware/secinputdev/SemInputDeviceManagerService.smali
system/framework/secinputdev-service.jar/smali/com/samsung/android/hardware/secinputdev/SemInputFeatures.smali
system/framework/secinputdev-service.jar/smali/com/samsung/android/hardware/secinputdev/SemInputFeaturesExtra.smali
system/priv-app/SecSettings/SecSettings.apk/smali_classes4/com/samsung/android/settings/display/SecDisplayUtils.smali
system/priv-app/SettingsProvider/SettingsProvider.apk/smali/com/android/providers/settings/DatabaseHelper.smali
system_ext/priv-app/SystemUI/SystemUI.apk/smali/com/android/systemui/LsRune.smali
"
for f in $FTP; do
sed -i "s/\"$SOURCE_HFR_MODE\"/\"$TARGET_HFR_MODE\"/g" "$APKTOOL_DIR/$f"
done
fi


echo "Applying HFR_SUPPORTED_REFRESH_RATE patches"
FTP="
system/framework/framework.jar/smali_classes6/com/samsung/android/hardware/display/RefreshRateConfig.smali
system/priv-app/SecSettings/SecSettings.apk/smali_classes4/com/samsung/android/settings/display/SecDisplayUtils.smali
"
for f in $FTP; do
if [[ "$TARGET_HFR_SUPPORTED_REFRESH_RATE" != "none" ]]; then
sed -i "s/\"$SOURCE_HFR_SUPPORTED_REFRESH_RATE\"/\"$TARGET_HFR_SUPPORTED_REFRESH_RATE\"/g" "$APKTOOL_DIR/$f"
else
sed -i "s/\"$SOURCE_HFR_SUPPORTED_REFRESH_RATE\"/\"\"/g" "$APKTOOL_DIR/$f"
fi
done
fi


echo "Applying HFR_DEFAULT_REFRESH_RATE patches"
FTP="
system/framework/framework.jar/smali_classes6/com/samsung/android/hardware/display/RefreshRateConfig.smali
system/priv-app/SecSettings/SecSettings.apk/smali_classes4/com/samsung/android/settings/display/SecDisplayUtils.smali
system/priv-app/SettingsProvider/SettingsProvider.apk/smali/com/android/providers/settings/DatabaseHelper.smali
"
for f in $FTP; do
sed -i "s/\"$SOURCE_HFR_DEFAULT_REFRESH_RATE\"/\"$TARGET_HFR_DEFAULT_REFRESH_RATE\"/g" "$APKTOOL_DIR/$f"
done
fi


echo "Applying HFR_SEAMLESS_BRT/HFR_SEAMLESS_LUX patches"
FTP="
system/framework/framework.jar/smali_classes6/com/samsung/android/hardware/display/RefreshRateConfig.smali
"
for f in $FTP; do
sed -i "s/\"$SOURCE_HFR_SEAMLESS_BRT\"/\"$TARGET_HFR_SEAMLESS_BRT\"/g" "$APKTOOL_DIR/$f"
sed -i "s/\"$SOURCE_HFR_SEAMLESS_LUX\"/\"$TARGET_HFR_SEAMLESS_LUX\"/g" "$APKTOOL_DIR/$f"
done
fi
fi


echo "Applying SemMultiMicManager patches"
FTP="
system/framework/framework.jar/smali_classes5/com/samsung/android/camera/mic/SemMultiMicManager.smali
"
for f in $FTP; do
sed -i "s/$SOURCE_MULTI_MIC_MANAGER_VERSION/$TARGET_MULTI_MIC_MANAGER_VERSION/g" "$APKTOOL_DIR/$f"
done
fi


echo "Applying SSRM patches"
FTP="
system/framework/ssrm.jar/smali/com/android/server/ssrm/Feature.smali
"
for f in $FTP; do
sed -i "s/$SOURCE_SSRM_CONFIG_NAME/$TARGET_SSRM_CONFIG_NAME/g" "$APKTOOL_DIR/$f"
done
fi


echo "Applying model detection patches"
FTP="
system/framework/framework.jar/smali_classes6/com/samsung/android/rune/CoreRune.smali
system/framework/services.jar/smali/com/android/server/am/FreecessController.smali
"
for f in $FTP; do
sed -i "s/ro\.product\.model/ro\.product\.vendor\.model/g" "$APKTOOL_DIR/$f"
done
fi
