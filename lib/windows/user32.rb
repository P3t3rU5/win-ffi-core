module WinFFI
  module User32
    extend LibBase

    ffi_lib 'user32'

    %i'
      MWMO
      QueueStatusFlags
      UserObjectInformationFlags
    '.each { |f| require_relative "user32/enums/#{f.to_s.snakecase}" }

    %i'
      DisplayDevice
      MSG
    '.each { |f| require_relative "user32/structs/#{f.to_s.snakecase}" }

    %i'
      Caret
      Clipboard
      Cursor
      DDE
      Desktop
      Hook
      Icon
      Keyboard
      KeyboardAccelerators
      Mouse
      MultipleDocumentInterface
      Rect
      Window
      WindowStation
    '.each { |f| require_relative "user32/#{f.to_s.snakecase}" }

    %i'
      Button
      ComboBox
      ListBox
      Scrollbar
    '.each { |f| require_relative "user32/controls/#{f.to_s.snakecase}" }

    if WinFFI::WindowsVersion >= :xp
      require_relative 'user32/raw_input'
      
      #VOID WINAPI DisableProcessWindowsGhosting(void)
      attach_function 'DisableProcessWindowsGhosting', [], :void
      
      if WinFFI::WindowsVersion >= :vista
        require_relative 'user32/display'
        if WinFFI::WindowsVersion >= 7
          %i'Gesture Touch'.each { |f| require_relative "user32/#{f.to_s.snakecase}" }
          if WinFFI::WindowsVersion >= 8
            %i'
              Pointer
              Input
              Accessibility
            '.each { |f| require_relative "user32/#{f.to_s.snakecase}" }

            #BOOL GetCurrentInputMessageSource( _Out_  INPUT_MESSAGE_SOURCE *inputMessageSource )
            attach_function 'GetCurrentInputMessageSource', [:pointer], :bool

          end
        end
      end

      if WindowsVersion >= 8

        #BOOL GetCurrentInputMessageSource( _Out_  INPUT_MESSAGE_SOURCE *inputMessageSource )
        attach_function 'GetCurrentInputMessageSource', [:pointer], :bool

      end
    end

    CW_USEDEFAULT   = -0x80000000
    IDC_ARROW       = 32512
    IDI_APPLICATION = 32512
    IDI_WINLOGO     = 32517

    #BOOL WINAPI GetUserObjectInformation(
    #  _In_       HANDLE hObj,
    #  _In_       int nIndex,
    #  _Out_opt_  PVOID pvInfo,
    #  _In_       DWORD nLength,
    #  _Out_opt_  LPDWORD lpnLengthNeeded )
    attach_function 'GetUserObjectInformationA', [:handle, UserObjectInformationFlags, :pointer, :dword, :pointer], :bool
    attach_function 'GetUserObjectInformationW', [:handle, UserObjectInformationFlags, :pointer, :dword, :pointer], :bool

    #BOOL WINAPI IsWinEventHookInstalled( _In_  DWORD event )
    attach_function 'IsWinEventHookInstalled', [:dword], :bool

    #BOOL WINAPI IsWow64Message(void)
    attach_function 'IsWow64Message', [], :bool

    #DWORD WINAPI MsgWaitForMultipleObjects(
    #  _In_  DWORD nCount,
    #  _In_  const HANDLE *pHandles,
    #  _In_  BOOL bWaitAll,
    #  _In_  DWORD dwMilliseconds,
    #  _In_  DWORD dwWakeMask )
    attach_function 'MsgWaitForMultipleObjects', [:dword, :pointer, :bool, :dword, QueueStatusFlags], :dword

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
    attach_function 'SendIMEMessageExA', [:hwnd, :lparam], :lresult
    attach_function 'SendIMEMessageExW', [:hwnd, :lparam], :lresult

    #ULONG_PTR WINAPI SetClassLongPtr(
    #  __in  HWND hWnd,
    #  __in  int nIndex,
    #  __in  LONG_PTR dwNewLong)
    #attach_function 'SetClassLongPtrA', [:hwnd, ClassLong, :pointer], :pointer
    #attach_function 'SetClassLongPtrW', [:hwnd, ClassLong, :pointer], :pointer

    #BOOL WINAPI SetUserObjectInformation(
    #  _In_  HANDLE hObj,
    #  _In_  int nIndex,
    #  _In_  PVOID pvInfo,
    #  _In_  DWORD nLength )
    attach_function 'SetUserObjectInformationA', [:handle, :int, :pointer, :dword], :bool
    attach_function 'SetUserObjectInformationW', [:handle, :int, :pointer, :dword], :bool

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