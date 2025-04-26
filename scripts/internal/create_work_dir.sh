#!/usr/bin/env bash
#
# Copyright (C) 2023 Salvo Giangreco
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

set -eu

# [
COPY_SOURCE_FIRMWARE()
{
    local MODEL
    local REGION
    MODEL=$(echo -n "$SOURCE_FIRMWARE" | cut -d "/" -f 1)
    REGION=$(echo -n "$SOURCE_FIRMWARE" | cut -d "/" -f 2)

    local COMMON_FOLDERS="system"
    for folder in $COMMON_FOLDERS
    do
        if [ ! -d "$WORK_DIR/$folder" ]; then
            mkdir -p "$WORK_DIR/$folder"
            cp -a --preserve=all "$FW_DIR/${MODEL}_${REGION}/$folder" "$WORK_DIR"
            cp --preserve=all "$FW_DIR/${MODEL}_${REGION}/file_context-$folder" "$WORK_DIR/configs"
            cp --preserve=all "$FW_DIR/${MODEL}_${REGION}/fs_config-$folder" "$WORK_DIR/configs"
        fi
    done

    if $SOURCE_HAS_SYSTEM_EXT; then
        if ! $TARGET_HAS_SYSTEM_EXT; then
            if [ ! -d "$WORK_DIR/system/system/system_ext" ]; then
                rm -rf "$WORK_DIR/system/system_ext"
                rm -f "$WORK_DIR/system/system/system_ext"
                sed -i "/system_ext/d" "$WORK_DIR/configs/file_context-system" \
                    && sed -i "/system_ext/d" "$WORK_DIR/configs/fs_config-system"
                cp -a --preserve=all "$FW_DIR/${MODEL}_${REGION}/system_ext" "$WORK_DIR/system/system"
                ln -sf "/system/system_ext" "$WORK_DIR/system/system_ext"
                echo "/system_ext u:object_r:system_file:s0" >> "$WORK_DIR/configs/file_context-system"
                echo "system_ext 0 0 644 capabilities=0x0" >> "$WORK_DIR/configs/fs_config-system"
                {
                    sed "s/^\/system_ext/\/system\/system_ext/g" "$FW_DIR/${MODEL}_${REGION}/file_context-system_ext"
                } >> "$WORK_DIR/configs/file_context-system"
                echo "system/system_ext 0 0 755 capabilities=0x0" >> "$WORK_DIR/configs/fs_config-system"
                {
                    sed "1d" "$FW_DIR/${MODEL}_${REGION}/fs_config-system_ext" | sed "s/^system_ext/system\/system_ext/g"
                } >> "$WORK_DIR/configs/fs_config-system"
                rm -f "$WORK_DIR/system/system/system_ext/etc/NOTICE.xml.gz"
                sed -i '/system\/system_ext\/etc\/NOTICE\\.xml\\.gz/d' "$WORK_DIR/configs/file_context-system"
                sed -i "/system\/system_ext\/etc\/NOTICE.xml.gz/d" "$WORK_DIR/configs/fs_config-system"
                rm -f "$WORK_DIR/system/system/system_ext/etc/fs_config_dirs"
                sed -i "/system\/system_ext\/etc\/fs_config_dirs/d" "$WORK_DIR/configs/file_context-system"
                sed -i "/system\/system_ext\/etc\/fs_config_dirs/d" "$WORK_DIR/configs/fs_config-system"
                rm -f "$WORK_DIR/system/system/system_ext/etc/fs_config_files"
                sed -i "/system\/system_ext\/etc\/fs_config_files/d" "$WORK_DIR/configs/file_context-system"
                sed -i "/system\/system_ext\/etc\/fs_config_files/d" "$WORK_DIR/configs/fs_config-system"
            fi
        elif [ ! -d "$WORK_DIR/system_ext" ]; then
            mkdir -p "$WORK_DIR/system_ext"
            cp -a --preserve=all "$FW_DIR/${MODEL}_${REGION}/system_ext" "$WORK_DIR"
            cp --preserve=all "$FW_DIR/${MODEL}_${REGION}/file_context-system_ext" "$WORK_DIR/configs"
            cp --preserve=all "$FW_DIR/${MODEL}_${REGION}/fs_config-system_ext" "$WORK_DIR/configs"
        fi
    else
        if $TARGET_HAS_SYSTEM_EXT; then
            # Create file structure: separate system_ext and create new symlinks in rootdir and systemdir
            cp -a -r --preserve=all "$FW_DIR/${MODEL}_${REGION}/system/system/system_ext" "$WORK_DIR"
            rm -rf "$WORK_DIR/system/system/system_ext"
            rm "$WORK_DIR/system/system_ext"
            mkdir "$WORK_DIR/system/system_ext"
            ln -s "/system_ext" "$WORK_DIR/system/system/system_ext"
            # Create system_ext filesystem configs file by extracting them from system config
            grep 'system_ext' "$FW_DIR/${MODEL}_${REGION}/fs_config-system" | sed 's/^system\///' | sed '/system_ext 0 0 644 capabilities/d' | sed '/system_ext 0 0 755 capabilities/d' >> "$WORK_DIR/configs/fs_config-system_ext"
            grep 'system_ext' "$FW_DIR/${MODEL}_${REGION}/file_context-system" | sed '/system_ext u:object_r:system_file:s0/d' | sed 's/^\/system//' >> "$WORK_DIR/configs/file_context-system_ext"
            # Remove all old system_ext references in system
            sed -i '/system_ext/d' "$WORK_DIR/configs/fs_config-system"
            sed -i '/system_ext/d' "$WORK_DIR/configs/file_context-system"
            # Add new symlink and folder config in system fs config
            echo "/system/system_ext u:object_r:system_file:s0" >> "$WORK_DIR/configs/file_context-system"
            echo "/system_ext u:object_r:system_file:s0" >> "$WORK_DIR/configs/file_context-system"
            echo "system/system_ext 0 0 644 capabilities=0x0" >> "$WORK_DIR/configs/fs_config-system"
            echo "system_ext 0 0 755 capabilities=0x0" >> "$WORK_DIR/configs/fs_config-system"
            # Finish by setting the root configuration of system_ext
            echo " 0 0 755 capabilities=0x0" >> "$WORK_DIR/configs/fs_config-system_ext"
            echo "/system_ext u:object_r:system_file:s0" >> "$WORK_DIR/configs/file_context-system_ext"
        fi
    fi

    if $SOURCE_HAS_PRODUCT; then
        if ! $TARGET_HAS_PRODUCT; then
            if [ ! -d "$WORK_DIR/system/system/product" ]; then
                rm -rf "$WORK_DIR/system/product"
                rm -f "$WORK_DIR/system/system/product"
                sed -i "/product/d" "$WORK_DIR/configs/file_context-system" \
                    && sed -i "/product/d" "$WORK_DIR/configs/fs_config-system"
                cp -a --preserve=all "$FW_DIR/${MODEL}_${REGION}/product" "$WORK_DIR/system/system"
                ln -sf "/system/product" "$WORK_DIR/system/product"
                echo "/product u:object_r:system_file:s0" >> "$WORK_DIR/configs/file_context-system"
                echo "product 0 0 644 capabilities=0x0" >> "$WORK_DIR/configs/fs_config-system"
                {
                    sed "s/^\/product/\/system\/product/g" "$FW_DIR/${MODEL}_${REGION}/file_context-product"
                } >> "$WORK_DIR/configs/file_context-system"
                echo "system/product 0 0 755 capabilities=0x0" >> "$WORK_DIR/configs/fs_config-system"
                {
                    sed "1d" "$FW_DIR/${MODEL}_${REGION}/fs_config-product" | sed "s/^product/system\/product/g"
                } >> "$WORK_DIR/configs/fs_config-system"
                rm -f "$WORK_DIR/system/system/product/etc/NOTICE.xml.gz"
                sed -i '/system\/product\/etc\/NOTICE\\.xml\\.gz/d' "$WORK_DIR/configs/file_context-system"
                sed -i "/system\/product\/etc\/NOTICE.xml.gz/d" "$WORK_DIR/configs/fs_config-system"
                rm -f "$WORK_DIR/system/system/product/etc/fs_config_dirs"
                sed -i "/system\/product\/etc\/fs_config_dirs/d" "$WORK_DIR/configs/file_context-system"
                sed -i "/system\/product\/etc\/fs_config_dirs/d" "$WORK_DIR/configs/fs_config-system"
                rm -f "$WORK_DIR/system/system/product/etc/fs_config_files"
                sed -i "/system\/product\/etc\/fs_config_files/d" "$WORK_DIR/configs/file_context-system"
                sed -i "/system\/product\/etc\/fs_config_files/d" "$WORK_DIR/configs/fs_config-system"
            fi
        elif [ ! -d "$WORK_DIR/product" ]; then
            mkdir -p "$WORK_DIR/product"
            cp -a --preserve=all "$FW_DIR/${MODEL}_${REGION}/product" "$WORK_DIR"
            cp --preserve=all "$FW_DIR/${MODEL}_${REGION}/file_context-product" "$WORK_DIR/configs"
            cp --preserve=all "$FW_DIR/${MODEL}_${REGION}/fs_config-product" "$WORK_DIR/configs"
        fi
    else
        if $TARGET_HAS_PRODUCT; then
            # Create file structure: separate product and create new symlinks in rootdir and systemdir
            cp -a -r --preserve=all "$FW_DIR/${MODEL}_${REGION}/system/system/product" "$WORK_DIR"
            rm -rf "$WORK_DIR/system/system/product"
            rm "$WORK_DIR/system/product"
            mkdir "$WORK_DIR/system/product"
            ln -s "/product" "$WORK_DIR/system/system/product"
            # Create product filesystem configs file by extracting them from system config
            grep 'product' "$FW_DIR/${MODEL}_${REGION}/fs_config-system" | sed 's/^system\///' | sed '/product 0 0 644 capabilities/d' | sed '/product 0 0 755 capabilities/d' >> "$WORK_DIR/configs/fs_config-product"
            grep 'product' "$FW_DIR/${MODEL}_${REGION}/file_context-system" | sed '/product u:object_r:system_file:s0/d' | sed 's/^\/system//' >> "$WORK_DIR/configs/file_context-product"
            # Remove all old product references in system
            sed -i '/product/d' "$WORK_DIR/configs/fs_config-system"
            sed -i '/product/d' "$WORK_DIR/configs/file_context-system"
            # Add new symlink and folder config in system fs config
            echo "/system/product u:object_r:system_file:s0" >> "$WORK_DIR/configs/file_context-system"
            echo "/product u:object_r:system_file:s0" >> "$WORK_DIR/configs/file_context-system"
            echo "system/product 0 0 644 capabilities=0x0" >> "$WORK_DIR/configs/fs_config-system"
            echo "product 0 0 755 capabilities=0x0" >> "$WORK_DIR/configs/fs_config-system"
            # Finish by setting the root configuration of product
            echo " 0 0 755 capabilities=0x0" >> "$WORK_DIR/configs/fs_config-product"
            echo "/product u:object_r:system_file:s0" >> "$WORK_DIR/configs/file_context-product"
        fi
    fi
}
# ]

mkdir -p "$WORK_DIR"
mkdir -p "$WORK_DIR/configs"
COPY_SOURCE_FIRMWARE

exit 0
