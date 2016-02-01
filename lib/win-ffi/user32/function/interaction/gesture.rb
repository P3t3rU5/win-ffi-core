require 'win-ffi/user32'

module WinFFI
  module User32
    if WindowsVersion >= 7

      require 'win-ffi/user32/struct/interaction/gesture/gesture_config'
      require 'win-ffi/user32/struct/interaction/gesture/gesture_info'

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd353228(v=vs.85).aspx
      # BOOL WINAPI CloseGestureInfoHandle( HGESTUREINFO hGestureInfo )
      attach_function 'CloseGestureInfoHandle', [:pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd353234(v=vs.85).aspx
      # BOOL WINAPI GetGestureConfig(
      #   _In_     HWND hwnd,
      #   _In_     DWORD dwReserved,
      #   _In_     DWORD dwFlags,
      #   _In_     PUINT pcIDs,
      #   _Inout_  PGESTURECONFIG pGestureConfig,
      #   _In_     UINT cbSize )
      attach_function 'GetGestureConfig', [:hwnd, :dword, :dword, :uint, GESTURECONFIG.ptr, :uint], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd744776(v=vs.85).aspx
      # BOOL WINAPI GetGestureExtraArgs(
      #   _In_   HGESTUREINFO hGestureInfo,
      #   _In_   UINT cbExtraArgs,
      #   _Out_  PBYTE pExtraArgs )
      attach_function 'GetGestureExtraArgs', [:pointer, :uint, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd353235(v=vs.85).aspx
      # BOOL WINAPI GetGestureInfo(
      #   _In_   HGESTUREINFO hGestureInfo,
      #   _Out_  PGESTUREINFO pGestureInfo )
      attach_function 'GetGestureInfo', [GESTUREINFO.ptr, GESTUREINFO.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd353241(v=vs.85).aspx
      # BOOL WINAPI SetGestureConfig(
      #   _In_  HWND hwnd,
      #   _In_  DWORD dwReserved,
      #   _In_  UINT cIDs,
      #   _In_  PGESTURECONFIG pGestureConfig,
      #   _In_  UINT cbSize )
      attach_function 'SetGestureConfig', [:hwnd, :dword, :uint, GESTURECONFIG.ptr, :uint], :bool
    end
  end
end