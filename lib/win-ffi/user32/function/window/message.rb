require 'win-ffi/user32'

require 'win-ffi/user32/enum/window/flag/broadcast_special_flags'
require 'win-ffi/user32/enum/window/flag/broadcast_special_message_flags'
require 'win-ffi/user32/enum/window/flag/peek_message_flags'
require 'win-ffi/user32/enum/window/smto'
require 'win-ffi/user32/enum/window/message/window_message'
require 'win-ffi/user32/enum/flag/queue_status_flags'
require 'win-ffi/user32/enum/icon'

require 'win-ffi/user32/struct/window/message/bsm_info'
require 'win-ffi/user32/struct/msg'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644932(v=vs.85).aspx
    # long WINAPI BroadcastSystemMessage(
    #   _In_         DWORD dwFlags,
    #   _Inout_opt_  LPDWORD lpdwRecipients,
    #   _In_         UINT uiMessage,
    #   _In_         WPARAM wParam,
    #   _In_         LPARAM lParam )
    encoded_function 'BroadcastSystemMessage',
                     [BroadcastSpecialFlags, BroadcastSpecialMessageFlags, :wparam, :lparam], :long

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644934(v=vs.85).aspx
    # LRESULT DispatchMessage(__in  const MSG *lpmsg)
    encoded_function 'DispatchMessage', [MSG.ptr], :lresult

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644935(v=vs.85).aspx
    # BOOL WINAPI GetInputState(void)
    attach_function 'GetInputState', [], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644936(v=vs.85).aspx
    # BOOL GetMessage(
    #   __out     LPMSG lpMsg,
    #   __in_opt  HWND  hWnd,
    #   __in      UINT  wMsgFilterMin,
    #   __in      UINT  wMsgFilterMax)
    encoded_function 'GetMessage', [MSG.ptr, :hwnd, :uint, :uint], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644937(v=vs.85).aspx
    # LPARAM WINAPI GetMessageExtraInfo(void)
    attach_function 'GetMessageExtraInfo', [], :lparam

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644938(v=vs.85).aspx
    # DWORD WINAPI GetMessagePos(void)
    attach_function 'GetMessagePos', [], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644939(v=vs.85).aspx
    # LONG WINAPI GetMessageTime(void)
    attach_function 'GetMessageTime', [], :long

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644940(v=vs.85).aspx
    # DWORD WINAPI GetQueueStatus( _In_  UINT flags )
    attach_function 'GetQueueStatus', [QueueStatusFlags], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644941(v=vs.85).aspx
    # BOOL WINAPI InSendMessage(void)
    attach_function 'InSendMessage', [], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644942(v=vs.85).aspx
    # DWORD WINAPI InSendMessageEx( _Reserved_  LPVOID lpReserved )
    attach_function 'InSendMessageEx', [:pointer], InSendMessageExReturn

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644943(v=vs.85).aspx
    # BOOL WINAPI PeekMessage(
    #   _Out_     LPMSG lpMsg,
    #   _In_opt_  HWND hWnd,
    #   _In_      UINT wMsgFilterMin,
    #   _In_      UINT wMsgFilterMax,
    #   _In_      UINT wRemoveMsg )
    encoded_function 'PeekMessage', [MSG.ptr, :hwnd, :uint, :uint, PeekMessageFlags], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644944(v=vs.85).aspx
    # BOOL WINAPI PostMessage(
    #   __in_opt  HWND   hWnd,
    #   __in      UINT   Msg,
    #   __in      WPARAM wParam,
    #   __in      LPARAM lParam)
    encoded_function 'PostMessage', [:hwnd, WindowMessage, :wparam, :lparam], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644945(v=vs.85).aspx
    # VOID PostQuitMessage(__in  int nExitCode)
    attach_function 'PostQuitMessage', [:int], :void

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644946(v=vs.85).aspx
    # BOOL WINAPI PostThreadMessage(
    #   _In_  DWORD idThread,
    #   _In_  UINT Msg,
    #   _In_  WPARAM wParam,
    #   _In_  LPARAM lParam )
    encoded_function 'PostThreadMessage', [:dword, :uint, :wparam, :lparam], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644947(v=vs.85).aspx
    # UINT WINAPI RegisterWindowMessage( _In_  LPCTSTR lpString )
    encoded_function 'RegisterWindowMessage', [:string], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644948(v=vs.85).aspx
    # BOOL WINAPI ReplyMessage( _In_  LRESULT lResult )
    attach_function 'ReplyMessage', [:lresult], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644949(v=vs.85).aspx
    # VOID CALLBACK SendAsyncProc(
    #   _In_ HWND      hwnd,
    #   _In_ UINT      uMsg,
    #   _In_ ULONG_PTR dwData,
    #   _In_ LRESULT   lResult)
    SendAsyncProc = callback 'SendAsyncProc', [:hwnd, :uint, :ulong, :lresult]

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644950(v=vs.85).aspx
    # LRESULT WINAPI SendMessage(
    #   _In_  HWND hWnd,
    #   _In_  UINT Msg,
    #   _In_  WPARAM wParam,
    #   _In_  LPARAM lParam )
    encoded_function 'SendMessage', [:hwnd, :uint, :wparam, :lparam], :lresult

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644951(v=vs.85).aspx
    # BOOL WINAPI SendMessageCallback(
    #   _In_  HWND hWnd,
    #   _In_  UINT Msg,
    #   _In_  WPARAM wParam,
    #   _In_  LPARAM lParam,
    #   _In_  SENDASYNCPROC lpCallBack,
    #   _In_  ULONG_PTR dwData )
    encoded_function 'SendMessageCallback', [:hwnd, :uint, :wparam, :lparam, SendAsyncProc, :ulong], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644952(v=vs.85).aspx
    # LRESULT WINAPI SendMessageTimeout(
    #   _In_       HWND hWnd,
    #   _In_       UINT Msg,
    #   _In_       WPARAM wParam,
    #   _In_       LPARAM lParam,
    #   _In_       UINT fuFlags,
    #   _In_       UINT uTimeout,
    #   _Out_opt_  PDWORD_PTR lpdwResult )
    encoded_function 'SendMessageTimeout', [:hwnd, :uint, :wparam, :lparam, SMTO, :uint, :pointer], :lresult

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644953(v=vs.85).aspx
    # BOOL WINAPI SendNotifyMessage(
    #   _In_  HWND hWnd,
    #   _In_  UINT Msg,
    #   _In_  WPARAM wParam,
    #   _In_  LPARAM lParam )
    encoded_function 'SendNotifyMessage', [:hwnd, :uint, :wparam, :lparam], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644954(v=vs.85).aspx
    # LPARAM WINAPI SetMessageExtraInfo( _In_  LPARAM lParam )
    attach_function 'SetMessageExtraInfo', [:lparam], :lparam

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644955(v=vs.85).aspx
    # BOOL TranslateMessage(__in  const MSG *lpMsg )
    attach_function 'TranslateMessage', [MSG.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644956(v=vs.85).aspx
    # BOOL WINAPI WaitMessage(void)
    attach_function 'WaitMessage', [], :bool

    if WindowsVersion >= :xp

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644933(v=vs.85).aspx
      # long WINAPI BroadcastSystemMessageEx(
      #   _In_         DWORD dwFlags,
      #   _Inout_opt_  LPDWORD lpdwRecipients,
      #   _In_         UINT uiMessage,
      #   _In_         WPARAM wParam,
      #   _In_         LPARAM lParam,
      #   _Out_opt_    PBSMINFO pBSMInfo )
      encoded_function 'BroadcastSystemMessageEx',
                       [BroadcastSpecialFlags, BroadcastSpecialMessageFlags, :uint, :wparam, :lparam, BSMINFO.ptr],
                       :long

    end

    def self.PostAppMessageW(idThread, wMsg, wParam, lParam)
      PostThreadMessageW(idThread, wMsg, wParam, lParam)
    end
  end
end