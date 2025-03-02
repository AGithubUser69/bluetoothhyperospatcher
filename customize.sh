##########################################################################################
#
# MMT Extended Config Script
#
##########################################################################################

##########################################################################################
# Config Flags
##########################################################################################

# Uncomment and change 'MINAPI' and 'MAXAPI' to the minimum and maximum android version for your mod
# Uncomment DYNLIB if you want libs installed to vendor for oreo+ and system for anything older
# Uncomment PARTOVER if you have a workaround in place for extra partitions in regular magisk install (can mount them yourself - you will need to do this each boot as well). If unsure, keep commented
# Uncomment PARTITIONS and list additional partitions you will be modifying (other than system and vendor), for example: PARTITIONS="/odm /product /system_ext"
#MINAPI=21
#MAXAPI=25
#DYNLIB=true
#PARTOVER=true
PARTITIONS="/system_ext"

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info why you would need this

# Construct your list in the following format
# This is an example
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here
REPLACE="
/system/lib/libbluetooth.so
/system/lib64/libbluetooth.so
/system/lib64/libbluetooth_qti_jni.so
/system_ext/lib/com.qualcomm.qti.bluetooth_audio@1.0.so
/system_ext/lib/libbluetooth_qti.so
/system_ext/lib64/com.qualcomm.qti.bluetooth_audio@1.0.so
/system_ext/lib64/libbluetooth_qti.so
/vendor/lib/btaudio_offload_if.so
/vendor/lib/com.qualcomm.qti.bluetooth_audio@1.0.so
/vendor/lib/libbluetooth_audio_session.so
/vendor/lib/libbluetooth_audio_session_qti.so
/vendor/lib/libbluetooth_audio_session_qti_2_1.so
/vendor/lib/libbt-hidlclient.so
/vendor/lib/libbtnv.so
/vendor/lib64/btaudio_offload_if.so
/vendor/lib64/com.qualcomm.qti.bluetooth_audio@1.0.so
/vendor/lib64/libbluetooth_audio_session.so
/vendor/lib64/libbluetooth_audio_session_qti.so
/vendor/lib64/libbluetooth_audio_session_qti_2_1.so
/vendor/lib64/libbt-hidlclient.so
/vendor/lib64/libbtnv.so
"

##########################################################################################
# Permissions
##########################################################################################

set_permissions() {
  : # Remove this if adding to this function

  # Note that all files/folders in magisk module directory have the $MODPATH prefix - keep this prefix on all of your files/folders
  # Some examples:
  
  # For directories (includes files in them):
  # set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
  
  # set_perm_recursive $MODPATH/system/lib 0 0 0755 0644
  # set_perm_recursive $MODPATH/system/vendor/lib/soundfx 0 0 0755 0644

  # For files (not in directories taken care of above)
  # set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
  
  # set_perm $MODPATH/system/lib/libart.so 0 0 0644
  # set_perm /data/local/tmp/file.txt 0 0 644
}

##########################################################################################
# MMT Extended Logic - Don't modify anything after this
##########################################################################################

SKIPUNZIP=1
unzip -qjo "$ZIPFILE" 'common/functions.sh' -d $TMPDIR >&2
. $TMPDIR/functions.sh
