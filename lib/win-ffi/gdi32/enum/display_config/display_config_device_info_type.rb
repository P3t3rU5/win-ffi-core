require 'win-ffi/gdi32'

module WinFFI
  module Gdi32
    DisplayConfigDeviceInfoType = enum :displayconfig_device_info_type, [
        :GET_SOURCE_NAME,                1,
        :GET_TARGET_NAME,                2,
        :GET_TARGET_PREFERRED_MODE,      3,
        :GET_ADAPTER_NAME,               4,
        :SET_TARGET_PERSISTENCE,         5,
        :GET_TARGET_BASE_TYPE,           6,
        :GET_SUPPORT_VIRTUAL_RESOLUTION, 7,
        :SET_SUPPORT_VIRTUAL_RESOLUTION, 8,
        :FORCE_UINT32,                   0xFFFFFFFF
    ]
  end
end