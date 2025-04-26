SKIP_UNZIP=1
SOURCE_FIRMWARE_PATH="$FW_DIR/$(echo -n "$SOURCE_FIRMWARE" | sed 's./._.g' | rev | cut -d "_" -f2- | rev)"

echo "Deleting base saiv"
rm -r $WORK_DIR/system/system/saiv
rm -r $WORK_DIR/system/system/etc/saiv

echo "Adding target saiv"
cp -r $SRC_DIR/target/a70q/patches/saiv/system/* $WORK_DIR/system/system

echo "saiv was successfully patched!"