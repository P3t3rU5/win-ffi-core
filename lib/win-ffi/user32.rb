module WinFFI
  module User32
    extend LibBase

    ffi_lib 'user32'

    typedef :pointer, :hcursor
    typedef :pointer, :hmenu
    typedef :pointer, :hrgn
    
    if WindowsVersion >= :xp

      #VOID WINAPI DisableProcessWindowsGhosting(void)
      attach_function 'DisableProcessWindowsGhosting', [], :void

      if WindowsVersion >= 8

        #BOOL GetCurrentInputMessageSource( _Out_  INPUT_MESSAGE_SOURCE *inputMessageSource )
        attach_function 'GetCurrentInputMessageSource', [:pointer], :bool

      end
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

    require 'win-ffi/user32/enum/user_object_information_flags'

    #BOOL WINAPI GetUserObjectInformation(
    #  _In_       HANDLE hObj,
    #  _In_       int nIndex,
    #  _Out_opt_  PVOID pvInfo,
    #  _In_       DWORD nLength,
    #  _Out_opt_  LPDWORD lpnLengthNeeded )
    encoded_function 'GetUserObjectInformation', [:handle, UserObjectInformationFlags, :pointer, :dword, :pointer], :bool

    #BOOL WINAPI IsWinEventHookInstalled( _In_  DWORD event )
    attach_function 'IsWinEventHookInstalled', [:dword], :bool

    #BOOL WINAPI IsWow64Message(void)
    attach_function 'IsWow64Message', [], :bool

    require 'win-ffi/user32/enum/queue_status_flags'

    #DWORD WINAPI MsgWaitForMultipleObjects(
    #  _In_  DWORD nCount,
    #  _In_  const HANDLE *pHandles,
    #  _In_  BOOL bWaitAll,
    #  _In_  DWORD dwMilliseconds,
    #  _In_  DWORD dwWakeMask )
    attach_function 'MsgWaitForMultipleObjects', [:dword, :pointer, :bool, :dword, QueueStatusFlags], :dword

    require 'win-ffi/user32/enum/mwmo'

    #DWORD WINAPI MsgWaitForMultipleObjectsEx(
    #  _In_  DWORD nCount,
    #  _In_  const HANDLE *pHandles,
    #  _In_  DWORD dwMilliseconds,
    #  _In_  DWORD dwWakeMask,
    #  _In_  DWORD dwFlags )
    attach_function 'MsgWaitForMultipleObjectsEx', [:dword, :pointer, :dword, QueueStatusFlags, MWMO], :dword

    #void WINAPI NotifyWinEvent(
    #  _In_  DWORD event,
    #  _In_  HWND hwnd,
    #  _In_  LONG idObject,
    #  _In_  LONG idChild )
    attach_function 'NotifyWinEvent', [:dword, :hwnd, :long, :long], :void

    #[This function is obsolete and should not be used.]
    #LRESULT WINAPI SendIMEMessageEx(
    #  _In_  HWND hwnd,
    #  _In_  LPARAM lParam )
    encoded_function 'SendIMEMessageEx', [:hwnd, :lparam], :lresult

    #ULONG_PTR WINAPI SetClassLongPtr(
    #  __in  HWND hWnd,
    #  __in  int nIndex,
    #  __in  LONG_PTR dwNewLong)
    #encoded_function 'SetClassLongPtr', [:hwnd, ClassLong, :pointer], :pointer

    #BOOL WINAPI SetUserObjectInformation(
    #  _In_  HANDLE hObj,
    #  _In_  int nIndex,
    #  _In_  PVOID pvInfo,
    #  _In_  DWORD nLength )
    encoded_function 'SetUserObjectInformation', [:handle, :int, :pointer, :dword], :bool

    #HWINEVENTHOOK WINAPI SetWinEventHook(
    #  _In_  UINT eventMin,
    #  _In_  UINT eventMax,
    #  _In_  HMODULE hmodWinEventProc,
    #  _In_  WINEVENTPROC lpfnWinEventProc,
    #  _In_  DWORD idProcess,
    #  _In_  DWORD idThread,
    #  _In_  UINT dwflags )
    attach_function 'SetWinEventHook', [:uint, :uint, :pointer, :pointer, :dword, :dword, :uint], :pointer

    #BOOL WINAPI UnhookWinEvent( _In_  HWINEVENTHOOK hWinEventHook )
    attach_function 'UnhookWinEvent', [:pointer], :bool

    #This function is obsolete and should not be used.
    #BOOL WINAPI WINNLSEnableIME(
    #  _In_  HWND hwnd,
    #  _In_  BOOL bFlag )
    attach_function 'WINNLSEnableIME', [:hwnd, :bool], :bool

  end
end