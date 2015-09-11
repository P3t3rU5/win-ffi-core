require 'win-ffi/functions/user32'

require 'win-ffi/enums/user32/window/broadcast_system_flags'
require 'win-ffi/enums/user32/window/broadcast_system_message_flags'
require 'win-ffi/enums/user32/window/peek_message_flags'
require 'win-ffi/enums/user32/window/smto'
require 'win-ffi/enums/user32/window/window_messages'
require 'win-ffi/enums/user32/window/window_messages'
require 'win-ffi/enums/user32/queue_status_flags'
require 'win-ffi/enums/user32/icon'

require 'win-ffi/structs/user32/window/bs_info'
require 'win-ffi/structs/user32/msg'

module WinFFI
    module User32
        #long WINAPI BroadcastSystemMessage(
        #  _In_         DWORD dwFlags,
        #  _Inout_opt_  LPDWORD lpdwRecipients,
        #  _In_         UINT uiMessage,
        #  _In_         WPARAM wParam,
        #  _In_         LPARAM lParam )
        attach_function 'BroadcastSystemMessageA',
                        [BroadcastSystemFlags, BroadcastSystemMessageFlags, :wparam, :lparam], :long
        attach_function 'BroadcastSystemMessageW',
                        [BroadcastSystemFlags, BroadcastSystemMessageFlags, :wparam, :lparam], :long

        #LRESULT DefWindowProc(
        #  __in  HWND   hWnd,
        #  __in  UINT   Msg,
        #  __in  WPARAM wParam,
        #  __in  LPARAM lParam)
        attach_function 'DefWindowProcA', [:hwnd, :uint, :wparam, :lparam], :lresult
        attach_function 'DefWindowProcW', [:hwnd, :uint, :wparam, :lparam], :lresult

        #LRESULT DispatchMessage(
        #  __in  const MSG *lpmsg)
        attach_function 'DispatchMessageA', [MSG.ptr], :lresult
        attach_function 'DispatchMessageW', [MSG.ptr], :lresult

        #BOOL WINAPI GetInputState(void)
        attach_function 'GetInputState', [], :bool

        #BOOL GetMessage(
        #  __out     LPMSG lpMsg,
        #  __in_opt  HWND  hWnd,
        #  __in      UINT  wMsgFilterMin,
        #  __in      UINT  wMsgFilterMax)
        attach_function 'GetMessageA', [MSG.ptr, :hwnd, :uint, :uint], :int
        attach_function 'GetMessageW', [MSG.ptr, :hwnd, :uint, :uint], :int

        #LPARAM WINAPI GetMessageExtraInfo(void)
        attach_function 'GetMessageExtraInfo', [], :lparam

        #DWORD WINAPI GetMessagePos(void)
        attach_function 'GetMessagePos', [], :dword

        #LONG WINAPI GetMessageTime(void)
        attach_function 'GetMessageTime', [], :long

        #DWORD WINAPI GetQueueStatus( _In_  UINT flags )
        attach_function 'GetQueueStatus', [QueueStatusFlags], :dword

        #BOOL WINAPI InSendMessage(void)
        attach_function 'InSendMessage', [], :bool

        #DWORD WINAPI InSendMessageEx( _Reserved_  LPVOID lpReserved )
        attach_function 'InSendMessageEx', [:pointer], :dword

        #BOOL WINAPI PeekMessage(
        #  _Out_     LPMSG lpMsg,
        #  _In_opt_  HWND hWnd,
        #  _In_      UINT wMsgFilterMin,
        #  _In_      UINT wMsgFilterMax,
        #  _In_      UINT wRemoveMsg )
        attach_function 'PeekMessageA', [MSG.ptr, :hwnd, :uint, :uint, PeekMessageFlags], :bool
        attach_function 'PeekMessageW', [MSG.ptr, :hwnd, :uint, :uint, PeekMessageFlags], :bool

        #BOOL WINAPI PostMessage(
        #  __in_opt  HWND   hWnd,
        #  __in      UINT   Msg,
        #  __in      WPARAM wParam,
        #  __in      LPARAM lParam)
        attach_function 'PostMessageA', [:hwnd, WindowMessages, :wparam, :lparam], :bool
        attach_function 'PostMessageW', [:hwnd, WindowMessages, :wparam, :lparam], :bool

        #VOID PostQuitMessage(
        #  __in  int nExitCode)
        attach_function 'PostQuitMessage', [:int], :void

        #BOOL WINAPI PostThreadMessage(
        #  _In_  DWORD idThread,
        #  _In_  UINT Msg,
        #  _In_  WPARAM wParam,
        #  _In_  LPARAM lParam )
        attach_function 'PostThreadMessageA', [:dword, :uint, :wparam, :lparam], :bool
        attach_function 'PostThreadMessageW', [:dword, :uint, :wparam, :lparam], :bool

        #UINT WINAPI RegisterWindowMessage( _In_  LPCTSTR lpString )
        attach_function 'RegisterWindowMessageA', [:string], :uint
        attach_function 'RegisterWindowMessageW', [:string], :uint

        #BOOL WINAPI ReplyMessage( _In_  LRESULT lResult )
        attach_function 'ReplyMessage', [:lresult], :bool

        #LRESULT WINAPI SendMessage(
        #  _In_  HWND hWnd,
        #  _In_  UINT Msg,
        #  _In_  WPARAM wParam,
        #  _In_  LPARAM lParam )
        attach_function 'SendMessageA', [:hwnd, WindowMessages, :wparam, :lparam], :lresult
        attach_function 'SendMessageW', [:hwnd, WindowMessages, :wparam, :lparam], :lresult

        #BOOL WINAPI SendMessageCallback(
        #  _In_  HWND hWnd,
        #  _In_  UINT Msg,
        #  _In_  WPARAM wParam,
        #  _In_  LPARAM lParam,
        #  _In_  SENDASYNCPROC lpCallBack,
        #  _In_  ULONG_PTR dwData )
        attach_function 'SendMessageCallbackA', [:hwnd, :uint, :wparam, :lparam, :pointer, :ulong], :bool
        attach_function 'SendMessageCallbackW', [:hwnd, :uint, :wparam, :lparam, :pointer, :ulong], :bool

        #LRESULT WINAPI SendMessageTimeout(
        #  _In_       HWND hWnd,
        #  _In_       UINT Msg,
        #  _In_       WPARAM wParam,
        #  _In_       LPARAM lParam,
        #  _In_       UINT fuFlags,
        #  _In_       UINT uTimeout,
        #  _Out_opt_  PDWORD_PTR lpdwResult )
        attach_function 'SendMessageTimeoutA', [:hwnd, :uint, :wparam, :lparam, SMTO, :uint, :pointer], :lresult
        attach_function 'SendMessageTimeoutW', [:hwnd, :uint, :wparam, :lparam, SMTO, :uint, :pointer], :lresult

        #BOOL WINAPI SendNotifyMessage(
        #  _In_  HWND hWnd,
        #  _In_  UINT Msg,
        #  _In_  WPARAM wParam,
        #  _In_  LPARAM lParam )
        attach_function 'SendNotifyMessageA', [:hwnd, :uint, :wparam, :lparam], :bool
        attach_function 'SendNotifyMessageW', [:hwnd, :uint, :wparam, :lparam], :bool

        #LPARAM WINAPI SetMessageExtraInfo( _In_  LPARAM lParam )
        attach_function 'SetMessageExtraInfo', [:lparam], :lparam

        #BOOL TranslateMessage( #  __in  const MSG *lpMsg )
        attach_function 'TranslateMessage', [:pointer], :bool

        #BOOL WINAPI WaitMessage(void)
        attach_function 'WaitMessage', [], :bool

        if WindowsVersion >= :xp

            #long WINAPI BroadcastSystemMessageEx(
            #  _In_         DWORD dwFlags,
            #  _Inout_opt_  LPDWORD lpdwRecipients,
            #  _In_         UINT uiMessage,
            #  _In_         WPARAM wParam,
            #  _In_         LPARAM lParam,
            #  _Out_opt_    PBSMINFO pBSMInfo )
            attach_function 'BroadcastSystemMessageExA',
                            [BroadcastSystemFlags, BroadcastSystemMessageFlags, :uint, :wparam, :lparam, BSINFO.ptr], :long
            attach_function 'BroadcastSystemMessageExW',
                            [BroadcastSystemFlags, BroadcastSystemMessageFlags, :uint, :wparam, :lparam, BSINFO.ptr], :long

        end
    end
end