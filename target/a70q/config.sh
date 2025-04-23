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

# Device configuration file for Galaxy A70 (a70q)
TARGET_NAME="Galaxy A70"
TARGET_CODENAME="a70q"
TARGET_FIRMWARE=
TARGET_EXTRA_FIRMWARES=()
TARGET_API_LEVEL=34
TARGET_PRODUCT_FIRST_API_LEVEL=30
TARGET_VNDK_VERSION=30
TARGET_SINGLE_SYSTEM_IMAGE="parrot"
TARGET_OS_FILE_SYSTEM="erofs"
TARGET_SUPER_PARTITION_SIZE=10385096704
TARGET_SUPER_GROUP_SIZE=10380902400
TARGET_HAS_SYSTEM_EXT=false
# The Galaxy A70's product partition can't fit
# a debloated product partition. Place it within
# system instead.
TARGET_HAS_PRODUCT=false

# SEC Product Feature
TARGET_AUDIO_SUPPORT_ACH_RINGTONE=false
TARGET_AUDIO_SUPPORT_DUAL_SPEAKER=false
TARGET_AUDIO_SUPPORT_VIRTUAL_VIBRATION=false
TARGET_AUTO_BRIGHTNESS_TYPE="3"
TARGET_DVFS_CONFIG_NAME="dvfs_policy_default"
TARGET_FP_SENSOR_CONFIG="google_touch_display_optical,settings=3"
TARGET_HAS_HW_MDNIE=false
TARGET_HAS_MASS_CAMERA_APP=true
TARGET_HAS_QHD_DISPLAY=false
#TARGET_HFR_MODE="1"
TARGET_HFR_MODE="0"
TARGET_HFR_SUPPORTED_REFRESH_RATE="60"
TARGET_HFR_DEFAULT_REFRESH_RATE="60"
TARGET_IS_ESIM_SUPPORTED=false
TARGET_MDNIE_SUPPORTED_MODES="46097"
TARGET_MDNIE_WEAKNESS_SOLUTION_FUNCTION="0"
TARGET_MULTI_MIC_MANAGER_VERSION="07002"
TARGET_SSRM_CONFIG_NAME="ssrm_default"
TARGET_SUPPORT_CUTOUT_PROTECTION=true
