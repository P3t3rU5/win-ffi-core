module WinFFI
  module User32
    extend LibBase

    ffi_lib 'user32'

    require_relative '../enums/user32/user_object_information_flags'
    require_relative '../enums/user32/queue_status_flags'
    require_relative '../enums/user32/mwmo'
    require_relative '../enums/user32/window/style/button_style'
    require_relative '../enums/user32/window/style/edit_style'
    require_relative '../enums/user32/window/style/static_style'
    require_relative '../enums/user32/window/notification/edit_notification'
    require_relative '../enums/user32/window/notification/button_notification'
    require_relative '../enums/user32/window/notification/static_notification'

    require_relative '../structs/user32/window/create_struct'
    require_relative '../structs/user32/window/window_pos'
    require_relative '../structs/user32/window/non_client_metrics'

    %i'
      authorization
      bitmap
      brush
      caret
      clipboard
      cursor
      dde
      desktop
      device
      device_context
      error
      filled_shape
      hook
      icon
      keyboard
      keyboard_accelerators
      mouse
      multiple_display_monitors
      multiple_document_interface
      painting_drawing
      power
      print
      process
      rect
      resource
      shell
      string
      text
      touch
      transform
      window_station
    '.each { |f| require_relative "user32/#{f}" }

    %i'
      button
      combobox
      listbox
      scrollbar
    '.each { |f| require_relative "user32/controls/#{f}" }

    %i'
      configuration
      dialog
      menu
      message
      properties
      timer
      window
      window_class
      window_proc
    '.each { |f| require_relative "user32/window/#{f}" }

    if WinFFI::WindowsVersion >= :xp
      require_relative 'user32/raw_input'
      
      #VOID WINAPI DisableProcessWindowsGhosting(void)
      attach_function 'DisableProcessWindowsGhosting', [], :void
      
      if WinFFI::WindowsVersion >= :vista
        require_relative 'user32/display'
        if WinFFI::WindowsVersion >= 7
          %i'gesture touch'.each { |f| require_relative "user32/#{f}" }
          if WinFFI::WindowsVersion >= 8
            %i'
              accessibility
              input
              pointer
            '.each { |f| require_relative "user32/#{f}" }

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

    IDC = enum :idc,
    [
        :ARROW,        32512,
        :IBEAM,        32513,
        :WAIT,         32514,
        :CROSS,        32515,
        :UPARROW,      32516,
        :SIZE,         32640,
        :ICON,         32641,
        :SIZENWSE,     32642,
        :SIZENESW,     32643,
        :SIZEWE,       32644,
        :SIZENS,       32645,
        :SIZEALL,      32646,
        :NO,           32648,
        :HAND,         32649,
        :APPSTARTING,  32650,
        :HELP,         32651,
    ]

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