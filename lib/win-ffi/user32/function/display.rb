require 'win-ffi/user32'

module WinFFI
  module User32
    if WindowsVersion >= :vista
      # https://msdn.microsoft.com/en-us/library/windows/hardware/ff553903(v=vs.85).aspx
      # LONG DisplayConfigGetDeviceInfo(   _Inout_  DISPLAYCONFIG_DEVICE_INFO_HEADER *requestPacket )
      attach_function 'DisplayConfigGetDeviceInfo', [:pointer], :long

      # TODO DISPLAYCONFIG_DEVICE_INFO_HEADER
      # https://msdn.microsoft.com/en-us/library/windows/hardware/ff553909(v=vs.85).aspx
      # LONG DisplayConfigSetDeviceInfo( _In_  DISPLAYCONFIG_DEVICE_INFO_HEADER *setPacket )
      attach_function 'DisplayConfigSetDeviceInfo', [:pointer], :long

      # https://msdn.microsoft.com/en-us/library/windows/hardware/ff566772(v=vs.85).aspx
      # LONG GetDisplayConfigBufferSizes(
      #   _In_   UINT32 Flags,
      #   _Out_  UINT32 *pNumPathArrayElements,
      #   _Out_  UINT32 *pNumModeInfoArrayElements )
      attach_function 'GetDisplayConfigBufferSizes', [:uint32, :pointer, :pointer], :long

      if WindowsVersion >= 7

        # https://msdn.microsoft.com/en-us/library/windows/hardware/ff569215(v=vs.85).aspx
        # LONG QueryDisplayConfig(
        #   _In_       UINT32 Flags,
        #   _Inout_    UINT32 *pNumPathArrayElements,
        #   _Out_      DISPLAYCONFIG_PATH_INFO *pPathInfoArray,
        #   _Inout_    UINT32 *pNumModeInfoArrayElements,
        #   _Out_      DISPLAYCONFIG_MODE_INFO *pModeInfoArray,
        #   _Out_opt_  DISPLAYCONFIG_TOPOLOGY_ID *pCurrentTopologyId )
        attach_function 'QueryDisplayConfig', [:uint32, :pointer, :pointer, :pointer, :pointer, :pointer], :long

        # https://msdn.microsoft.com/en-us/library/windows/hardware/ff569533(v=vs.85).aspx
        # LONG SetDisplayConfig(
        #   _In_      UINT32 numPathArrayElements,
        #   _In_opt_  DISPLAYCONFIG_PATH_INFO *pathArray,
        #   _In_      UINT32 numModeInfoArrayElements,
        #   _In_opt_  DISPLAYCONFIG_MODE_INFO *modeInfoArray,
        #   _In_      UINT32 Flags )
        attach_function 'SetDisplayConfig', [:uint32, :pointer, :uint32, :pointer, :uint32], :long
      end
    end
  end
end
