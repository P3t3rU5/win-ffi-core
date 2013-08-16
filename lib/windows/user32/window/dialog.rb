module WinFFI
  module User32
    module Dialog
      extend LibBase
      ffi_lib 'user32'

      #User32::MessageBoxFlags
      MessageBoxFlags = enum :message_box_flags, [
          # Buttons ---------------------

          :abortretryignore,  0x00000002, # Push buttons: Abort, Retry, and Ignore.
          # The message box contains three push buttons: Cancel, Try Again, Continue. Use this message box type instead of MB_ABORTRETRYIGNORE.
          :canceltrycontinue, 0x00000006,
          # Adds a Help button to the message box. When the user clicks the Help button or presses F1, the system sends a
          # WM_HELP message to the owner.
          :help,              0x00004000,
          :ok,                0x00000000, # Push button: OK. This is the default.
          :okcancel,          0x00000001, # Push buttons: OK and Cancel.
          :retrycancel,       0x00000005, # Push buttons: Retry and Cancel.
          :yesno,             0x00000004, # Push buttons: Yes and No.
          :yesnocancel,       0x00000003, # Push buttons: Yes, No, and Cancel.

          # Icons -----------------------

          :iconexclamation, 0x00000030, # An exclamation-point icon
          :iconwarning,     0x00000030, # Same as above
          :iconinformation, 0x00000040, # Lowercase letter i in a circle
          :iconasterisk,    0x00000040, # Same as above
          :iconquestion,    0x00000020, # A question-mark icon. Not Recomended
          :iconstop,        0x00000010, # A stop-sign icon
          :iconerror,       0x00000010, # Same as above
          :iconhand,        0x00000010, # Same as above

          # Modality --------------------

          # The user must respond to the message box before continuing work in the
          # window identified by the hWnd parameter. However, the user can move to the
          # windows of other threads and work in those windows.
          # Depending on the hierarchy of windows in the application, the user may be
          # able to move to other windows within the thread. All child windows of the
          # parent of the message box are automatically disabled, but pop-up windows are
          # not.
          # MB_APPLMODAL is the default if neither MB_SYSTEMMODAL nor MB_TASKMODAL
          # is specified.
          :applmodal,   0x00000000,
          # Same as MB_APPLMODAL except that the message box has the WS_EX_TOPMOST style
          # Use system-modal message boxes to notify the user of serious, potentially
          # damaging errors that require immediate attention (for example, running out
          # of memory). This flag has no effect on the user's ability to interact with
          # windows other than those associated with hWnd.
          :systemmodal, 0x00001000,
          # Same as MB_APPLMODAL except that all the top-level windows belonging to the
          # current thread are disabled if the hWnd parameter is NULL. Use this flag
          # when the calling application or library does not have a window handle
          # available but still needs to prevent input to other windows in the calling
          # thread without suspending other threads.
          :taskmodal,   0x00002000,

          # Other -----------------------

          # Same as desktop of the interactive window station. For more information,
          # see Window Stations.
          # If the current input desktop is not the default desktop, MessageBox does not
          # return until the user switches to the default desktop.
          :default_desktop_only, 0x00020000,
          :right,                0x00080000, # The text is right-justified.
          # Displays message and caption text using right-to-left reading order on
          # Hebrew and Arabic systems.
          :rtlreading,           0x00100000,
          # The message box becomes the foreground window. Internally, the system calls
          # the SetForegroundWindow function for the message box.
          :setforeground,        0x00010000, # The message box is created with the WS_EX_TOPMOST window style.

          :topmost,              0x00040000,
          # The caller is a service notifying the user of an event. The function
          # displays a message box on the current active desktop, even if there is no
          # user logged on to the computer.
          # Terminal Services: If the calling thread has an impersonation token, the
          # function directs the message box to the session specified in the
          # impersonation token.
          # If this flag is set, the hWnd parameter must be NULL. This is so that the
          # message box can appear on a desktop other than the desktop corresponding to
          # the hWnd.
          # For information on security considerations in regard to using this flag, see
          # Interactive Services. In particular, be aware that this flag can produce
          # interactive content on a locked desktop and should therefore be used for
          # only a very limited set of scenarios, such as resource exhaustion.

          :service_notification, 0x00200000,
      ]

      # MessageBoxReturn Values
      IDOK       =  1 # The OK button was selected.
      IDCANCEL   =  2 # The Cancel button was selected.
      IDABORT    =  3 # The Abort button was selected.
      IDRETRY    =  4 # The Retry button was selected.
      IDIGNORE   =  5 # The Ignore button was selected.
      IDYES      =  6 # The Yes button was selected.
      IDNO       =  7 # The No button was selected.
      IDTRYAGAIN = 10 # The Try Again button was selected.
      IDCONTINUE = 11 # The Continue button was selected.


      class DLGTEMPLATE < FFI::Struct
        layout :style,           :dword,
               :dwExtendedStyle, :dword,
               :cdit,            :word,
               :x,               :short,
               :y,               :short,
               :cx,              :short,
               :cy,              :short
      end

      class MSGBOXPARAMS < FFI::Struct
        layout :cbSize,             :uint,
               :hwndOwner,          :hwnd,
               :hInstance,          :hinstance,
               :lpszText,           :string,
               :lpszCaption,        :string,
               :dwStyle,            :dword,
               :lpszIcon,           :string,
               :dwContextHelpId,    :ulong,
               :lpfnMsgBoxCallback, :pointer,
               :dwLanguageId,       :dword
      end

      #HWND WINAPI CreateDialogIndirectParam(
      #  _In_opt_  HINSTANCE hInstance,
      #  _In_      LPCDLGTEMPLATE lpTemplate,
      #  _In_opt_  HWND hWndParent,
      #  _In_opt_  DLGPROC lpDialogFunc,
      #  _In_      LPARAM lParamInit )
      attach_function 'CreateDialogIndirectParamA', [:hinstance, DLGTEMPLATE.ptr, :hwnd, :pointer, :lparam], :hwnd
      attach_function 'CreateDialogIndirectParamW', [:hinstance, DLGTEMPLATE.ptr, :hwnd, :pointer, :lparam], :hwnd

      #HWND WINAPI CreateDialogParam(
      #  _In_opt_  HINSTANCE hInstance,
      #  _In_      LPCTSTR lpTemplateName,
      #  _In_opt_  HWND hWndParent,
      #  _In_opt_  DLGPROC lpDialogFunc,
      #  _In_      LPARAM dwInitParam )
      attach_function 'CreateDialogParamA', [:hinstance, :pointer, :hwnd, :pointer, :lparam], :hwnd
      attach_function 'CreateDialogParamW', [:hinstance, :pointer, :hwnd, :pointer, :lparam], :hwnd

      #LRESULT WINAPI DefDlgProcA(
      #  _In_  HWND hDlg,
      #  _In_  UINT Msg,
      #  _In_  WPARAM wParam,
      #  _In_  LPARAM lParam )
      attach_function 'DefDlgProcA', [:hwnd, :uint, :wparam, :lparam], :lresult
      attach_function 'DefDlgProcW', [:hwnd, :uint, :wparam, :lparam], :lresult

      #INT_PTR WINAPI DialogBoxIndirectParam(
      #  _In_opt_  HINSTANCE hInstance,
      #  _In_      LPCDLGTEMPLATE hDialogTemplate,
      #  _In_opt_  HWND hWndParent,
      #  _In_opt_  DLGPROC lpDialogFunc,
      #  _In_      LPARAM dwInitParam )
      attach_function 'DialogBoxIndirectParamA', [:hinstance, DLGTEMPLATE.ptr, :hwnd, :pointer, :lparam], :int
      attach_function 'DialogBoxIndirectParamW', [:hinstance, DLGTEMPLATE.ptr, :hwnd, :pointer, :lparam], :int

      #INT_PTR WINAPI DialogBoxParam(
      #  _In_opt_  HINSTANCE hInstance,
      #  _In_      LPCTSTR lpTemplateName,
      #  _In_opt_  HWND hWndParent,
      #  _In_opt_  DLGPROC lpDialogFunc,
      #  _In_      LPARAM dwInitParam )
      attach_function 'DialogBoxParamA', [:hinstance, :string, :hwnd, :pointer, :lparam], :int
      attach_function 'DialogBoxParamW', [:hinstance, :string, :hwnd, :pointer, :lparam], :int

      #TODO
      #INT_PTR CALLBACK DialogProc(
      #  _In_  HWND hwndDlg,
      #  _In_  UINT uMsg,
      #  _In_  WPARAM wParam,
      #  _In_  LPARAM lParam )



      #BOOL WINAPI EndDialog(
      #  _In_  HWND hDlg,
      #  _In_  INT_PTR nResult )
      attach_function 'EndDialog', [:hwnd, :int], :bool

      #LONG WINAPI GetDialogBaseUnits(void)
      attach_function 'GetDialogBaseUnits', [], :long

      #int WINAPI GetDlgCtrlID( _In_  HWND hwndCtl )
      attach_function 'GetDlgCtrlID', [:hwnd], :int

      #HWND WINAPI GetDlgItem(
      #  _In_opt_  HWND hDlg,
      #  _In_      int nIDDlgItem )
      attach_function 'GetDlgItem', [:hwnd, :int], :hwnd

      #UINT WINAPI GetDlgItemInt(
      #  _In_       HWND hDlg,
      #  _In_       int nIDDlgItem,
      #  _Out_opt_  BOOL *lpTranslated,
      #  _In_       BOOL bSigned )
      attach_function 'GetDlgItemInt', [:hwnd, :int, :pointer, :bool], :uint

      #UINT WINAPI GetDlgItemText(
      #  _In_   HWND hDlg,
      #  _In_   int nIDDlgItem,
      #  _Out_  LPTSTR lpString,
      #  _In_   int nMaxCount )
      attach_function 'GetDlgItemTextA', [:hwnd, :int, :pointer, :bool], :uint
      attach_function 'GetDlgItemTextW', [:hwnd, :int, :pointer, :bool], :uint

      #HWND WINAPI GetNextDlgGroupItem(
      #  _In_      HWND hDlg,
      #  _In_opt_  HWND hCtl,
      #  _In_      BOOL bPrevious )
      attach_function 'GetNextDlgGroupItem', [:hwnd, :hwnd, :bool], :hwnd

      #HWND WINAPI GetNextDlgTabItem(
      #  _In_      HWND hDlg,
      #  _In_opt_  HWND hCtl,
      #  _In_      BOOL bPrevious )
      attach_function 'GetNextDlgTabItem', [:hwnd, :hwnd, :bool], :hwnd

      #BOOL WINAPI IsDialogMessage(
      #  _In_  HWND hDlg,
      #  _In_  LPMSG lpMsg )
      attach_function 'IsDialogMessage', [:hwnd, MSG.ptr], :bool
      attach_function 'IsDialogMessageA', [:hwnd, MSG.ptr], :bool
      attach_function 'IsDialogMessageW', [:hwnd, MSG.ptr], :bool


      #BOOL WINAPI MapDialogRect(
      #  _In_     HWND hDlg,
      #  _Inout_  LPRECT lpRect )
      attach_function 'MapDialogRect', [:hwnd, RECT.ptr], :bool

      #BOOL WINAPI MessageBeep( _In_  UINT uType )
      attach_function 'MessageBeep', [MessageBoxFlags], :bool

      #int WINAPI MessageBox(
      #  __in_opt HWND hWnd,
      #  __in_opt LPCTSTR lpText,
      #  __in_opt LPCTSTR lpCaption,
      #  __in     UINT uType)
      attach_function 'MessageBoxA', [:hwnd, :string, :string, MessageBoxFlags], :int
      attach_function 'MessageBoxW', [:hwnd, :string, :string, MessageBoxFlags], :int

      #int WINAPI MessageBoxEx(
      #  _In_opt_  HWND hWnd,
      #  _In_opt_  LPCTSTR lpText,
      #  _In_opt_  LPCTSTR lpCaption,
      #  _In_      UINT uType,
      #  _In_      WORD wLanguageId )
      attach_function 'MessageBoxExA', [:hwnd, :string, :string, MessageBoxFlags, :word], :int
      attach_function 'MessageBoxExW', [:hwnd, :string, :string, MessageBoxFlags, :word], :int

      #int WINAPI MessageBoxIndirect( _In_  const LPMSGBOXPARAMS lpMsgBoxParams )
      attach_function 'MessageBoxIndirectA', [MSGBOXPARAMS.ptr], :int
      attach_function 'MessageBoxIndirectW', [MSGBOXPARAMS.ptr], :int

      #LRESULT WINAPI SendDlgItemMessage(
      #  _In_  HWND hDlg,
      #  _In_  int nIDDlgItem,
      #  _In_  UINT Msg,
      #  _In_  WPARAM wParam,
      #  _In_  LPARAM lParam )
      attach_function 'SendDlgItemMessageA', [:hwnd, :int, :uint, :wparam, :lparam], :lresult
      attach_function 'SendDlgItemMessageW', [:hwnd, :int, :uint, :wparam, :lparam], :lresult

      #BOOL WINAPI SetDlgItemInt(
      #  _In_  HWND hDlg,
      #  _In_  int nIDDlgItem,
      #  _In_  UINT uValue,
      #  _In_  BOOL bSigned )
      attach_function 'SetDlgItemInt', [:hwnd, :int, :uint, :bool], :bool

      #BOOL WINAPI SetDlgItemText(
      #  _In_  HWND hDlg,
      #  _In_  int nIDDlgItem,
      #  _In_  LPCTSTR lpString )
      attach_function 'SetDlgItemTextA', [:hwnd, :int, :string], :bool
      attach_function 'SetDlgItemTextW', [:hwnd, :int, :string], :bool

      def CreateDialog(hInstance, lpName, hParent, lpDialogFunc)
        CreateDialogParam(hInstance, lpName, hParent, lpDialogFunc, 0)
      end

      def CreateDialogIndirect(hInst, lpTemp, hPar, lpDialFunc)
        CreateDialogIndirectParam(hInst, lpTemp, hPar, lpDialFunc, 0)
      end

      def DialogBox(hInstance, lpTemp, hParent, lpDialogFunc)
        DialogBoxParam(hInstance, lpTemp, hParent, lpDialogFunc, 0)
      end

      def DialogBoxIndirect(hInst, lpTemp, hParent, lpDialogFunc)
        DialogBoxParamIndirect(hInst, lpTemp, hParent, lpDialogFunc, 0)
      end

    end
  end
end