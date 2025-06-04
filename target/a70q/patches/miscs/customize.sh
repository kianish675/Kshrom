echo "Fix up /product/etc/build.prop"
sed -i "/# Removed by /d" "$WORK_DIR/system/system/product/etc/build.prop" \
    && sed -i "s/#bluetooth./bluetooth./g" "$WORK_DIR/system/system/product/etc/build.prop" \
    && sed -i "s/?=/=/g" "$WORK_DIR/system/system/product/etc/build.prop" \
    && sed -i "$(sed -n "/provisioning.hostname/=" "$WORK_DIR/system/system/product/etc/build.prop" | sed "2p;d")d" "$WORK_DIR/system/system/product/etc/build.prop"

# Tip: UN1CA's SET_PROP hates the product build.prop so we instead sed the change out
echo "Removing SSC"
sed -i "s/persist.bluetooth.samsung.a2dp_offload.cap=sbc-aptx-ssc-hifi/persist.bluetooth.samsung.a2dp_offload.cap=sbc-aptx-hifi/g" "$WORK_DIR/system/system/product/etc/build.prop"

echo "Remove unsupported permissions"
DELETE_FROM_WORK_DIR "system" "system/etc/permissions/com.sec.feature.nsflp_level_601.xml"
DELETE_FROM_WORK_DIR "system" "system/etc/permissions/com.sec.feature.sensorhub_level40.xml"
