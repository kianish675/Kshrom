SOURCE_FIRMWARE_PATH="$FW_DIR/$(echo -n "$SOURCE_FIRMWARE" | sed 's./._.g' | rev | cut -d "_" -f2- | rev)"

echo "Deleting base cameradata"
rm -r $WORK_DIR/system/system/cameradata

echo "Adding target cameradata"
cp -r $SRC_DIR/target/a70q/patches/cameradata/system/cameradata $WORK_DIR/system/system

echo "cameradata was successfully patched!"