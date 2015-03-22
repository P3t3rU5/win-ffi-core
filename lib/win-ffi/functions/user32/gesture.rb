module WinFFI
  module User32
    if WinFFI::WindowsVersion >= 7
      #BOOL WINAPI CloseGestureInfoHandle( HGESTUREINFO hGestureInfo )
      attach_function 'CloseGestureInfoHandle', [:pointer], :bool

      #BOOL WINAPI GetGestureConfig(
      #  _In_     HWND hwnd,
      #  _In_     DWORD dwReserved,
      #  _In_     DWORD dwFlags,
      #  _In_     PUINT pcIDs,
      #  _Inout_  PGESTURECONFIG pGestureConfig,
      #  _In_     UINT cbSize )
      attach_function 'GetGestureConfig', [:hwnd, :dword, :dword, :pointer, :pointer, :uint], :bool

      #BOOL WINAPI GetGestureExtraArgs(
      #  _In_   HGESTUREINFO hGestureInfo,
      #  _In_   UINT cbExtraArgs,
      #  _Out_  PBYTE pExtraArgs )
      attach_function 'GetGestureExtraArgs', [:pointer, :uint, :pointer], :bool

      #BOOL WINAPI GetGestureInfo(
      #  _In_   HGESTUREINFO hGestureInfo,
      #  _Out_  PGESTUREINFO pGestureInfo )
      attach_function 'GetGestureInfo', [:pointer, :pointer], :bool

      #BOOL WINAPI SetGestureConfig(
      #  _In_  HWND hwnd,
      #  _In_  DWORD dwReserved,
      #  _In_  UINT cIDs,
      #  _In_  PGESTURECONFIG pGestureConfig,
      #  _In_  UINT cbSize )
      attach_function 'SetGestureConfig', [:hwnd, :dword, :uint, :pointer, :uint], :bool
    end
  end
end