require_relative '../../../enums/user32/window/message_box_flags'
require_relative '../../../enums/user32/window/message_box_return'

require_relative '../../../structs/user32/window/dlg_template'
require_relative '../../../structs/user32/msg'
require_relative '../../../structs/user32/window/msgbox_params'

module WinFFI
    module User32
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
        attach_function 'DialogBoxParamA', [:hinstance, :buffer_in, :hwnd, :pointer, :lparam], :int
        attach_function 'DialogBoxParamW', [:hinstance, :buffer_in, :hwnd, :pointer, :lparam], :int

        #TODO
        #INT_PTR CALLBACK DialogProc(
        #  _In_  HWND hwndDlg,
        #  _In_  UINT uMsg,
        #  _In_  WPARAM wParam,
        #  _In_  LPARAM lParam )
        callback :DialogProc, [:hwnd, :uint, :wparam, :lparam], :int

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
        attach_function 'MessageBoxA', [:hwnd, :buffer_in, :buffer_in, MessageBoxFlags], :int
        attach_function 'MessageBoxW', [:hwnd, :buffer_in, :buffer_in, MessageBoxFlags], :int

        #int WINAPI MessageBoxEx(
        #  _In_opt_  HWND hWnd,
        #  _In_opt_  LPCTSTR lpText,
        #  _In_opt_  LPCTSTR lpCaption,
        #  _In_      UINT uType,
        #  _In_      WORD wLanguageId )
        attach_function 'MessageBoxExA', [:hwnd, :buffer_in, :buffer_in, MessageBoxFlags, :word], :int
        attach_function 'MessageBoxExW', [:hwnd, :buffer_in, :buffer_in, MessageBoxFlags, :word], :int

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
        attach_function 'SetDlgItemTextA', [:hwnd, :int, :buffer_in], :bool
        attach_function 'SetDlgItemTextW', [:hwnd, :int, :buffer_in], :bool
    end
end