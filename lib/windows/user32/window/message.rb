module WinFFI
  module User32
    module Window
      module Message
        extend LibBase
        ffi_lib 'user32'

        #User32::BroadcastSystemFlags

        BroadcastSystemFlags = enum :broadcast_system_flags, [
            :QUERY,0x00000001, # Sends the message to one recipient at a time, sending to a subsequent recipient only if
            # the current recipient returns TRUE.

            :IGNORECURRENTTASK, 0x00000002, # Does not send the message to windows that belong to the current task. This
            # prevents an application from receiving its own message.

            :FLUSHDISK, 0x00000004, # Flushes the disk after each recipient processes the message.

            :NOHANG, 0x00000008, # Forces a nonresponsive application to time out. If one of the recipients times out,
            # do not continue broadcasting the message.

            :POSTMESSAGE, 0x00000010, # Posts the message. Do not use in combination with :QUERY.

            :NOTIMEOUTIFNOTHUNG, 0x00000040, # Waits for a response to the message, as long as the recipient is not
            # being unresponsive. Does not time out.

            :FORCEIFHUNG, 0x00000020, # Continues to broadcast the message, even if the time-out period elapses or one
            # of the recipients is not responding.

            :ALLOWSFW, 0x00000080, # Enables the recipient to set the foreground window while processing the message.

            :SENDNOTIFYMESSAGE, 0x00000100, # Sends the message using SendNotifyMessage function. Do not use in
            # combination with :QUERY.

            :RETURNHDESK, 0x00000200, # If access is denied and both this and BSF_QUERY are set, BSMINFO returns both
            # the desktop handle and the window handle. If access is denied and only BSF_QUERY is set, only the window
            # handle is returned by BSMINFO. Windows 2000:  This flag is not supported.

            :LUID, 0x00000400, # If BSF_LUID is set, the message is sent to the window that has the same LUID as
                               # specified in the luid member of the BSMINFO structure. Windows 2000:  This flag is not supported.
        ]

        BroadcastSystemMessageFlags = enum :broadcast_system_message_flags, [
            :ALLCOMPONENTS, 0x00000000, #Broadcast to all system components.
            :APPLICATIONS,  0x00000008, # Broadcast to applications.
            :ALLDESKTOPS,   0x00000010, # Broadcast to all desktops. Requires the SE_TCB_NAME privilege.
        ]

        PeekMessageFlags = enum :peek_message_flags, [
            :NOREMOVE, 0x0000, # Messages are not removed from the queue after processing by PeekMessage.
            :REMOVE, 0x0001, # Messages are removed from the queue after processing by PeekMessage.
            :NOYIELD, 0x0002, # Prevents the system from releasing any thread that is waiting for the caller to go idle
                              # (see WaitForInputIdle). Combine this value with either PM_NOREMOVE or PM_REMOVE.
        ]


    SMTO = enum :smto, [
        :ABORTIFHUNG, 0x0002, # The function returns without waiting for the time-out period to elapse if the receiving
        # thread appears to not respond or "hangs."

        :BLOCK, 0x0001, # Prevents the calling thread from processing any other requests until the function returns.

        :NORMAL, 0x0000, # The calling thread is not prevented from processing other requests while waiting for the
        # function to return.

        :NOTIMEOUTIFNOTHUNG, 0x0008, # The function does not enforce the time-out period as long as the receiving thread
        # is processing messages.

        :ERRORONEXIT, 0x0020, # The function should return 0 if the receiving window is destroyed or its owning thread
                              # dies while the message is being processed.
    ]

        messages = [
            :WM_NULL,                   0x0000,
            :WM_CREATE,                 0x0001,
            :WM_DESTROY,                0x0002,
            :WM_MOVE,                   0x0003,
            :WM_SIZE,                   0x0005,
            :WM_ACTIVATE,               0x0006,
            :WM_SETFOCUS,               0x0007,
            :WM_KILLFOCUS,              0x0008,
            :WM_ENABLE,                 0x000A,
            :WM_SETREDRAW,              0x000B,
            :WM_SETTEXT,                0x000C,
            :WM_GETTEXT,                0x000D,
            :WM_GETTEXTLENGTH,          0x000E,
            :WM_PAINT,                  0x000F,
            :WM_CLOSE,                  0x0010,
            :WM_QUERYENDSESSION,        0x0011,
            :WM_QUIT,                   0x0012,
            :WM_QUERYOPEN,              0x0013,
            :WM_ERASEBKGND,             0x0014,
            :WM_SYSCOLORCHANGE,         0x0015,
            :WM_ENDSESSION,             0x0016,
            :WM_SYSTEMERROR,            0x0017,
            :WM_SHOWWINDOW,             0x0018,
            :WM_CTLCOLOR,               0x0019,
            :WM_SETTINGCHANGE,          0x001A,
            :WM_DEVMODECHANGE,          0x001B,
            :WM_ACTIVATEAPP,            0x001C,
            :WM_FONTCHANGE,             0x001D,
            :WM_TIMECHANGE,             0x001E,
            :WM_CANCELMODE,             0x001F,
            :WM_SETCURSOR,              0x0020,
            :WM_MOUSEACTIVATE,          0x0021,
            :WM_CHILDACTIVATE,          0x0022,
            :WM_QUEUESYNC,              0x0023,
            :WM_GETMINMAXINFO,          0x0024,
            :WM_PAINTICON,              0x0026,
            :WM_ICONERASEBKGND,         0x0027,
            :WM_NEXTDLGCTL,             0x0028,
            :WM_SPOOLERSTATUS,          0x002A,
            :WM_DRAWITEM,               0x002B,
            :WM_MEASUREITEM,            0x002C,
            :WM_DELETEITEM,             0x002D,
            :WM_VKEYTOITEM,             0x002E,
            :WM_CHARTOITEM,             0x002F,
            :WM_SETFONT,                0x0030,
            :WM_GETFONT,                0x0031,
            :WM_SETHOTKEY,              0x0032,
            :WM_GETHOTKEY,              0x0033,
            :WM_QUERYDRAGICON,          0x0037,
            :WM_COMPAREITEM,            0x0039,
            :WM_COMPACTING,             0x0041,
            :WM_WINDOWPOSCHANGING,      0x0046,
            :WM_WINDOWPOSCHANGED,       0x0047,
            :WM_POWER,                  0x0048,
            :WM_COPYDATA,               0x004A,
            :WM_CANCELJOURNAL,          0x004B,
            :WM_NOTIFY,                 0x004E,
            :WM_INPUTLANGCHANGEREQUEST, 0x0050,
            :WM_INPUTLANGCHANGE,        0x0051,
            :WM_TCARD,                  0x0052,
            :WM_HELP,                   0x0053,
            :WM_USERCHANGED,            0x0054,
            :WM_NOTIFYFORMAT,           0x0055,
            :WM_CONTEXTMENU,            0x007B,
            :WM_STYLECHANGING,          0x007C,
            :WM_STYLECHANGED,           0x007D,
            :WM_DISPLAYCHANGE,          0x007E,
            :WM_GETICON,                0x007F,
            :WM_SETICON,                0x0080,
            :WM_NCCREATE,               0x0081,
            :WM_NCDESTROY,              0x0082,
            :WM_NCCALCSIZE,             0x0083,
            :WM_NCHITTEST,              0x0084,
            :WM_NCPAINT,                0x0085,
            :WM_NCACTIVATE,             0x0086,
            :WM_GETDLGCODE,             0x0087,
            :WM_NCMOUSEMOVE,            0x00A0,
            :WM_NCLBUTTONDOWN,          0x00A1,
            :WM_NCLBUTTONUP,            0x00A2,
            :WM_NCLBUTTONDBLCLK,        0x00A3,
            :WM_NCRBUTTONDOWN,          0x00A4,
            :WM_NCRBUTTONUP,            0x00A5,
            :WM_NCRBUTTONDBLCLK,        0x00A6,
            :WM_NCMBUTTONDOWN,          0x00A7,
            :WM_NCMBUTTONUP,            0x00A8,
            :WM_NCMBUTTONDBLCLK,        0x00A9,
            :WM_NCUAHDRAWCAPTION,       0x00AE,
            :WM_NCUAHDRAWFRAME,         0x00AF,
            :WM_KEYDOWN,                0x0100,
            :WM_KEYUP,                  0x0101,
            :WM_CHAR,                   0x0102,
            :WM_DEADCHAR,               0x0103,
            :WM_SYSKEYDOWN,             0x0104,
            :WM_SYSKEYUP,               0x0105,
            :WM_SYSCHAR,                0x0106,
            :WM_SYSDEADCHAR,            0x0107,
            :WM_IME_STARTCOMPOSITION,   0x010D,
            :WM_IME_ENDCOMPOSITION,     0x010E,
            :WM_IME_COMPOSITION,        0x010F,
            :WM_INITDIALOG,             0x0110,
            :WM_COMMAND,                0x0111,
            :WM_SYSCOMMAND,             0x0112,
            :WM_TIMER,                  0x0113,
            :WM_HSCROLL,                0x0114,
            :WM_VSCROLL,                0x0115,
            :WM_INITMENU,               0x0116,
            :WM_INITMENUPOPUP,          0x0117,
            :WM_MENUSELECT,             0x011F,
            :WM_MENUCHAR,               0x0120,
            :WM_ENTERIDLE,              0x0121,
            :WM_CTLCOLORMSGBOX,         0x0132,
            :WM_CTLCOLOREDIT,           0x0133,
            :WM_CTLCOLORLISTBOX,        0x0134,
            :WM_CTLCOLORBTN,            0x0135,
            :WM_CTLCOLORDLG,            0x0136,
            :WM_CTLCOLORSCROLLBAR,      0x0137,
            :WM_CTLCOLORSTATIC,         0x0138,
            :WM_MOUSEMOVE,              0x0200,
            :WM_LBUTTONDOWN,            0x0201,
            :WM_LBUTTONUP,              0x0202,
            :WM_LBUTTONDBLCLK,          0x0203,
            :WM_RBUTTONDOWN,            0x0204,
            :WM_RBUTTONUP,              0x0205,
            :WM_RBUTTONDBLCLK,          0x0206,
            :WM_MBUTTONDOWN,            0x0207,
            :WM_MBUTTONUP,              0x0208,
            :WM_MBUTTONDBLCLK,          0x0209,
            :WM_MOUSEWHEEL,             0x020A,
            :WM_MOUSEHWHEEL,            0x020E,
            :WM_PARENTNOTIFY,           0x0210,
            :WM_ENTERMENULOOP,          0x0211,
            :WM_EXITMENULOOP,           0x0212,
            :WM_NEXTMENU,               0x0213,
            :WM_SIZING,                 0x0214,
            :WM_CAPTURECHANGED,         0x0215,
            :WM_MOVING,                 0x0216,
            :WM_POWERBROADCAST,         0x0218,
            :WM_DEVICECHANGE,           0x0219,
            :WM_MDICREATE,              0x0220,
            :WM_MDIDESTROY,             0x0221,
            :WM_MDIACTIVATE,            0x0222,
            :WM_MDIRESTORE,             0x0223,
            :WM_MDINEXT,                0x0224,
            :WM_MDIMAXIMIZE,            0x0225,
            :WM_MDITILE,                0x0226,
            :WM_MDICASCADE,             0x0227,
            :WM_MDIICONARRANGE,         0x0228,
            :WM_MDIGETACTIVE,           0x0229,
            :WM_MDISETMENU,             0x0230,
            :WM_ENTERSIZEMOVE,          0x0231,
            :WM_EXITSIZEMOVE,           0x0232,
            :WM_DROPFILES,              0x0233,
            :WM_MDIREFRESHMENU,         0x0234,
            :WM_IME_SETCONTEXT,         0x0281,
            :WM_IME_NOTIFY,             0x0282,
            :WM_IME_CONTROL,            0x0283,
            :WM_IME_COMPOSITIONFULL,    0x0284,
            :WM_IME_SELECT,             0x0285,
            :WM_IME_CHAR,               0x0286,
            :WM_IME_KEYDOWN,            0x0290,
            :WM_IME_KEYUP,              0x0291,
            :WM_MOUSEHOVER,             0x02A1,
            :WM_NCMOUSELEAVE,           0x02A2,
            :WM_MOUSELEAVE,             0x02A3,
            :WM_CUT,                    0x0300,
            :WM_COPY,                   0x0301,
            :WM_PASTE,                  0x0302,
            :WM_CLEAR,                  0x0303,
            :WM_UNDO,                   0x0304,
            :WM_RENDERFORMAT,           0x0305,
            :WM_RENDERALLFORMATS,       0x0306,
            :WM_DESTROYCLIPBOARD,       0x0307,
            :WM_DRAWCLIPBOARD,          0x0308,
            :WM_PAINTCLIPBOARD,         0x0309,
            :WM_VSCROLLCLIPBOARD,       0x030A,
            :WM_SIZECLIPBOARD,          0x030B,
            :WM_ASKCBFORMATNAME,        0x030C,
            :WM_CHANGECBCHAIN,          0x030D,
            :WM_HSCROLLCLIPBOARD,       0x030E,
            :WM_QUERYNEWPALETTE,        0x030F,
            :WM_PALETTEISCHANGING,      0x0310,
            :WM_PALETTECHANGED,         0x0311,
            :WM_HOTKEY,                 0x0312,
            :WM_PRINT,                  0x0317,
            :WM_PRINTCLIENT,            0x0318,
            :WM_HANDHELDFIRST,          0x0358,
            :WM_HANDHELDLAST,           0x035F,
            :WM_PENWINFIRST,            0x0380,
            :WM_PENWINLAST,             0x038F,
            :WM_COALESCE_FIRST,         0x0390,
            :WM_COALESCE_LAST,          0x039F,
            :WM_DDE_INITIATE,           0x03E0,
            :WM_DDE_TERMINATE,          0x03E1,
            :WM_DDE_ADVISE,             0x03E2,
            :WM_DDE_UNADVISE,           0x03E3,
            :WM_DDE_ACK,                0x03E4,
            :WM_DDE_DATA,               0x03E5,
            :WM_DDE_REQUEST,            0x03E6,
            :WM_DDE_POKE,               0x03E7,
            :WM_DDE_EXECUTE,            0x03E8,
            :WM_USER,                   0x0400,
            :EM_GETBIDIOPTIONS,         0x04C9,
            :WM_APP,                    0x8000,
        ]
        messages += `ver`[/\d.\d/].to_f >= 5.1 ? [:WM_KEYLAST, 0x0109] : [:WM_KEYLAST, 0x0109]
        WindowMessages = enum :window_messages, messages

        class LUID < FFI::Struct
          layout :LowPart,  :dword,
                 :HighPart, :long
        end

        class BSINFO < FFI::Struct
          layout :cItems,    :int,
                 :hdesk,     :hdesk,
                 :hwnd,      :hwnd,
                 :luid,      LUID
        end

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
        attach_function 'SendMessageA', [:hwnd, :uint, :wparam, :lparam], :lresult
        attach_function 'SendMessageW', [:hwnd, :uint, :wparam, :lparam], :lresult

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
  end
end