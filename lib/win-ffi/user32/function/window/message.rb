require 'win-ffi/user32'

require 'win-ffi/user32/enum/window/broadcast_system_flags'
require 'win-ffi/user32/enum/window/broadcast_system_message_flags'
require 'win-ffi/user32/enum/window/peek_message_flags'
require 'win-ffi/user32/enum/window/smto'
require 'win-ffi/user32/enum/window/message/window_message'
require 'win-ffi/user32/enum/queue_status_flags'
require 'win-ffi/user32/enum/icon'

require 'win-ffi/user32/struct/window/bs_info'
require 'win-ffi/user32/struct/msg'

module WinFFI
    module User32
        #long WINAPI BroadcastSystemMessage(
        #  _In_         DWORD dwFlags,
        #  _Inout_opt_  LPDWORD lpdwRecipients,
        #  _In_         UINT uiMessage,
        #  _In_         WPARAM wParam,
        #  _In_         LPARAM lParam )
        encoded_function 'BroadcastSystemMessage',
                        [BroadcastSystemFlags, BroadcastSystemMessageFlags, :wparam, :lparam], :long

        #LRESULT DefWindowProc(
        #  __in  HWND   hWnd,
        #  __in  UINT   Msg,
        #  __in  WPARAM wParam,
        #  __in  LPARAM lParam)
        encoded_function 'DefWindowProc', [:hwnd, :uint, :wparam, :lparam], :lresult

        #LRESULT DispatchMessage(
        #  __in  const MSG *lpmsg)
        encoded_function 'DispatchMessage', [MSG.ptr], :lresult

        #BOOL WINAPI GetInputState(void)
        attach_function 'GetInputState', [], :bool

        #BOOL GetMessage(
        #  __out     LPMSG lpMsg,
        #  __in_opt  HWND  hWnd,
        #  __in      UINT  wMsgFilterMin,
        #  __in      UINT  wMsgFilterMax)
        encoded_function 'GetMessage', [MSG.ptr, :hwnd, :uint, :uint], :int

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
        encoded_function 'PeekMessage', [MSG.ptr, :hwnd, :uint, :uint, PeekMessageFlags], :bool

        #BOOL WINAPI PostMessage(
        #  __in_opt  HWND   hWnd,
        #  __in      UINT   Msg,
        #  __in      WPARAM wParam,
        #  __in      LPARAM lParam)
        encoded_function 'PostMessage', [:hwnd, WindowMessage, :wparam, :lparam], :bool

        #VOID PostQuitMessage(
        #  __in  int nExitCode)
        attach_function 'PostQuitMessage', [:int], :void

        #BOOL WINAPI PostThreadMessage(
        #  _In_  DWORD idThread,
        #  _In_  UINT Msg,
        #  _In_  WPARAM wParam,
        #  _In_  LPARAM lParam )
        encoded_function 'PostThreadMessage', [:dword, :uint, :wparam, :lparam], :bool

        #UINT WINAPI RegisterWindowMessage( _In_  LPCTSTR lpString )
        encoded_function 'RegisterWindowMessage', [:string], :uint

        #BOOL WINAPI ReplyMessage( _In_  LRESULT lResult )
        attach_function 'ReplyMessage', [:lresult], :bool

        #LRESULT WINAPI SendMessage(
        #  _In_  HWND hWnd,
        #  _In_  UINT Msg,
        #  _In_  WPARAM wParam,
        #  _In_  LPARAM lParam )
        encoded_function 'SendMessage', [:hwnd, :uint, :wparam, :lparam], :lresult

        #BOOL WINAPI SendMessageCallback(
        #  _In_  HWND hWnd,
        #  _In_  UINT Msg,
        #  _In_  WPARAM wParam,
        #  _In_  LPARAM lParam,
        #  _In_  SENDASYNCPROC lpCallBack,
        #  _In_  ULONG_PTR dwData )
        encoded_function 'SendMessageCallback', [:hwnd, :uint, :wparam, :lparam, :pointer, :ulong], :bool

        #LRESULT WINAPI SendMessageTimeout(
        #  _In_       HWND hWnd,
        #  _In_       UINT Msg,
        #  _In_       WPARAM wParam,
        #  _In_       LPARAM lParam,
        #  _In_       UINT fuFlags,
        #  _In_       UINT uTimeout,
        #  _Out_opt_  PDWORD_PTR lpdwResult )
        encoded_function 'SendMessageTimeout', [:hwnd, :uint, :wparam, :lparam, SMTO, :uint, :pointer], :lresult

        #BOOL WINAPI SendNotifyMessage(
        #  _In_  HWND hWnd,
        #  _In_  UINT Msg,
        #  _In_  WPARAM wParam,
        #  _In_  LPARAM lParam )
        encoded_function 'SendNotifyMessage', [:hwnd, :uint, :wparam, :lparam], :bool

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
            encoded_function 'BroadcastSystemMessageEx',
                            [BroadcastSystemFlags, BroadcastSystemMessageFlags, :uint, :wparam, :lparam, BSINFO.ptr], :long

        end
    end
end