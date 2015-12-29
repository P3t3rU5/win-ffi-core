require 'win-ffi/user32'

module WinFFI
  module User32

    if WindowsVersion >= :xp

      #BOOL WINAPI ExitWindowsEx(
      #  _In_  UINT uFlags,
      #  _In_  DWORD dwReason )
      attach_function 'ExitWindowsEx', [:uint, :dword], :bool

      #BOOL WINAPI LockWorkStation(void)
      attach_function 'LockWorkStation', [], :bool
      if WindowsVersion >= :vista
        #BOOL WINAPI ShutdownBlockReasonCreate(
        #  _In_  HWND hWnd,
        #  _In_  LPCWSTR pwszReason )
        attach_function 'ShutdownBlockReasonCreate', [:hwnd, :buffer_in], :bool

        #BOOL WINAPI ShutdownBlockReasonDestroy( _In_  HWND hWnd )
        attach_function 'ShutdownBlockReasonDestroy', [:hwnd], :bool

        #BOOL WINAPI ShutdownBlockReasonQuery(
        #  _In_       HWND hWnd,
        #  _Out_opt_  LPWSTR pwszBuff,
        #  _Inout_    DWORD *pcchBuff )
        attach_function 'ShutdownBlockReasonQuery', [:hwnd , :buffer_out, :buffer_inout], :bool
      end
    end
  end
end