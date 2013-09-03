module WinFFI
  module User32
    module Display
      extend LibBase

      ffi_lib 'user32'

      #LONG DisplayConfigGetDeviceInfo(   _Inout_  DISPLAYCONFIG_DEVICE_INFO_HEADER *requestPacket )
      attach_function 'DisplayConfigGetDeviceInfo', [:pointer], :long

      #LONG DisplayConfigSetDeviceInfo( _In_  DISPLAYCONFIG_DEVICE_INFO_HEADER *setPacket )
      attach_function 'DisplayConfigSetDeviceInfo', [:pointer], :long

      #LONG GetDisplayConfigBufferSizes(
      #  _In_   UINT32 Flags,
      #  _Out_  UINT32 *pNumPathArrayElements,
      #  _Out_  UINT32 *pNumModeInfoArrayElements )
      attach_function 'GetDisplayConfigBufferSizes', [:uint32, :pointer, :pointer], :long

      if WindowsVersion >= 7

        #LONG QueryDisplayConfig(
        #  _In_       UINT32 Flags,
        #  _Inout_    UINT32 *pNumPathArrayElements,
        #  _Out_      DISPLAYCONFIG_PATH_INFO *pPathInfoArray,
        #  _Inout_    UINT32 *pNumModeInfoArrayElements,
        #  _Out_      DISPLAYCONFIG_MODE_INFO *pModeInfoArray,
        #  _Out_opt_  DISPLAYCONFIG_TOPOLOGY_ID *pCurrentTopologyId )
        attach_function 'QueryDisplayConfig', [:uint32, :pointer, :pointer, :pointer, :pointer, :pointer], :long

        #LONG SetDisplayConfig(
        #  _In_      UINT32 numPathArrayElements,
        #  _In_opt_  DISPLAYCONFIG_PATH_INFO *pathArray,
        #  _In_      UINT32 numModeInfoArrayElements,
        #  _In_opt_  DISPLAYCONFIG_MODE_INFO *modeInfoArray,
        #  _In_      UINT32 Flags )
        attach_function 'SetDisplayConfig', [:uint32, :pointer, :uint32, :pointer, :uint32], :long

      end

    end
  end
end