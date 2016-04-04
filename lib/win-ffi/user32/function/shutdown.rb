require 'win-ffi/user32'

module WinFFI
  module User32
    if WindowsVersion >= :xp

      require 'win-ffi/user32/enum/exit_windows_flag'

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa376868(v=vs.85).aspx
      # BOOL WINAPI ExitWindowsEx(
      #   _In_  UINT uFlags,
      #   _In_  DWORD dwReason )
      attach_function 'ExitWindowsEx', [ExitWindowsFlag, :dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa376875(v=vs.85).aspx
      # BOOL WINAPI LockWorkStation(void)
      attach_function 'LockWorkStation', [], :bool

      if WindowsVersion >= :vista
        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa376877(v=vs.85).aspx
        # BOOL WINAPI ShutdownBlockReasonCreate(
        #   _In_  HWND hWnd,
        #   _In_  LPCWSTR pwszReason )
        attach_function 'ShutdownBlockReasonCreate', [:hwnd, :buffer_in], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa376878(v=vs.85).aspx
        # BOOL WINAPI ShutdownBlockReasonDestroy( _In_  HWND hWnd )
        attach_function 'ShutdownBlockReasonDestroy', [:hwnd], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa376879(v=vs.85).aspx
        # BOOL WINAPI ShutdownBlockReasonQuery(
        #   _In_       HWND hWnd,
        #   _Out_opt_  LPWSTR pwszBuff,
        #   _Inout_    DWORD *pcchBuff )
        attach_function 'ShutdownBlockReasonQuery', [:hwnd , :buffer_out, :buffer_inout], :bool
      end

      class << self
        def self.ExitWindows
          ExitWindowsEx(:LOGOFF, 0xFFFFFFFF)
        end
      end
    end
  end
end