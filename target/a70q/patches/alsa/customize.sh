SOURCE_FIRMWARE_PATH="$FW_DIR/$(echo -n "$SOURCE_FIRMWARE" | sed 's./._.g' | rev | cut -d "_" -f2- | rev)"

echo "Adding target ALSA configuration"
cp -r $SRC_DIR/target/a70q/patches/alsa/alsa $WORK_DIR/system/system/usr/share

echo "ALSA configuration was successfully patched!"