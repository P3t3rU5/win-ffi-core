module WinFFI
  module Shutdown
    extend LibBase

    ffi_lib 'Advapi32'

    #BOOL WINAPI AbortSystemShutdown( _In_opt_  LPTSTR lpMachineName )
    attach_function 'AbortSystemShutdownA', [:buffer_in], :bool
    attach_function 'AbortSystemShutdownW', [:buffer_in], :bool

    begin
      #DWORD WINAPI InitiateShutdown(
      #  _In_opt_  LPTSTR lpMachineName,
      #  _In_opt_  LPTSTR lpMessage,
      #  _In_      DWORD dwGracePeriod,
      #  _In_      DWORD dwShutdownFlags,
      #  _In_      DWORD dwReason )
      attach_function 'InitiateShutdownA', [:buffer_in, :buffer_in, :dword, :dowrd, :dword], :dword
      attach_function 'InitiateShutdownW', [:buffer_in, :buffer_in, :dword, :dowrd, :dword], :dword
    rescue FFI::NotFoundError
      # Windows Vista or later
    end

    begin
      #BOOL WINAPI InitiateSystemShutdown(
      #  _In_opt_  LPTSTR lpMachineName,
      #  _In_opt_  LPTSTR lpMessage,
      #  _In_      DWORD dwTimeout,
      #  _In_      BOOL bForceAppsClosed,
      #  _In_      BOOL bRebootAfterShutdown )
      attach_function 'InitiateSystemShutdownA', [:buffer_in, :buffer_in, :dword, :bool, :bool], :bool
      attach_function 'InitiateSystemShutdownA', [:buffer_in, :buffer_in, :dword, :bool, :bool], :bool

      #BOOL WINAPI InitiateSystemShutdownEx(
      #  _In_opt_  LPTSTR lpMachineName,
      #  _In_opt_  LPTSTR lpMessage,
      #  _In_      DWORD dwTimeout,
      #  _In_      BOOL bForceAppsClosed,
      #  _In_      BOOL bRebootAfterShutdown,
      #  _In_      DWORD dwReason )
      attach_function 'InitiateSystemShutdownExA', [:buffer_in, :buffer_in, :dword, :bool, :bool, :dword], :bool
      attach_function 'InitiateSystemShutdownExW', [:buffer_in, :buffer_in, :dword, :bool, :bool, :dword], :bool
    rescue FFI::NotFoundError
      # Windows XP or later
    end

    ffi_lib 'user32'

    begin

      #BOOL WINAPI ExitWindowsEx(
      #  _In_  UINT uFlags,
      #  _In_  DWORD dwReason )
      attach_function 'ExitWindowsEx', [:uint, :dword], :bool

      #BOOL WINAPI LockWorkStation(void)
      attach_function 'LockWorkStation', [], :bool

    rescue FFI::NotFoundError
      # Windows XP or later
    end

    begin

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

    rescue
      # Window Vista or later
    end

  end
end