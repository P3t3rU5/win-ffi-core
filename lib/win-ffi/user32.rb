require 'win-ffi/lib_base'
module WinFFI
  module User32
    extend LibBase

    ffi_lib 'user32'

    typedef :pointer, :handle
    typedef :pointer, :hcursor
    typedef :pointer, :hmenu
    typedef :pointer, :hrgn
    
    if WindowsVersion >= :xp
      # VOID WINAPI DisableProcessWindowsGhosting(void)
      attach_function 'DisableProcessWindowsGhosting', [], :void

      #Active Accessibility
      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318528(v=vs.85).aspx
      # BOOL WINAPI IsWinEventHookInstalled( _In_  DWORD event )
      attach_function 'IsWinEventHookInstalled', [:dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd373603(v=vs.85).aspx
      # void WINAPI NotifyWinEvent(
      #   _In_  DWORD event,
      #   _In_  HWND hwnd,
      #   _In_  LONG idObject,
      #   _In_  LONG idChild )
      attach_function 'NotifyWinEvent', [:dword, :hwnd, :long, :long], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd373640(v=vs.85).aspx
      # HWINEVENTHOOK WINAPI SetWinEventHook(
      #   _In_  UINT eventMin,
      #   _In_  UINT eventMax,
      #   _In_  HMODULE hmodWinEventProc,
      #   _In_  WINEVENTPROC lpfnWinEventProc,
      #   _In_  DWORD idProcess,
      #   _In_  DWORD idThread,
      #   _In_  UINT dwflags )
      attach_function 'SetWinEventHook', [:uint, :uint, :pointer, :pointer, :dword, :dword, :uint], :pointer

      # Process and Threads
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684136(v=vs.85).aspx
      # BOOL WINAPI IsWow64Message(void)
      attach_function 'IsWow64Message', [], :bool
    end

    CW_USEDEFAULT   = -0x80000000

    IDI = enum :idi,
    [
      :APPLICATION, 32512,
      :ERROR,       32513,
      :HAND,        32513,
      :QUESTION,    32514,
      :EXCLAMATION, 32515,
      :WARNING,     32515,
      :ASTERISK,    32516,
      :INFORMATION, 32516,
      :WINLOGO,     32517,
      :SHIELD,      32518
    ]

    # https://msdn.microsoft.com/en-us/library/aa969468(v=vs.85).aspx
    #This function is obsolete and should not be used.
    #LRESULT WINAPI SendIMEMessageEx(
    #  _In_  HWND hwnd,
    #  _In_  LPARAM lParam )
    encoded_function 'SendIMEMessageEx', [:hwnd, :lparam], :lresult

    #ULONG_PTR WINAPI SetClassLongPtr(
    #  __in  HWND hWnd,
    #  __in  int nIndex,
    #  __in  LONG_PTR dwNewLong)
    #encoded_function 'SetClassLongPtr', [:hwnd, ClassLong, :pointer], :pointer

    #BOOL WINAPI UnhookWinEvent( _In_  HWINEVENTHOOK hWinEventHook )
    attach_function 'UnhookWinEvent', [:pointer], :bool

    #This function is obsolete and should not be used.
    #BOOL WINAPI WINNLSEnableIME(
    #  _In_  HWND hwnd,
    #  _In_  BOOL bFlag )
    attach_function 'WINNLSEnableIME', [:hwnd, :bool], :bool

  end
end