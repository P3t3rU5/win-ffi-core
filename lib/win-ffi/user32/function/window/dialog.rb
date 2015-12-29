require 'win-ffi/user32'

require 'win-ffi/user32/enum/window/message_box_flags'
require 'win-ffi/user32/enum/window/return/message_box_return'

require 'win-ffi/general/struct/rect'
require 'win-ffi/user32/struct/window/dlg_template'
require 'win-ffi/user32/struct/msg'
require 'win-ffi/user32/struct/window/msgbox_params'

module WinFFI
  module User32
    #HWND WINAPI CreateDialogIndirectParam(
    #  _In_opt_  HINSTANCE hInstance,
    #  _In_      LPCDLGTEMPLATE lpTemplate,
    #  _In_opt_  HWND hWndParent,
    #  _In_opt_  DLGPROC lpDialogFunc,
    #  _In_      LPARAM lParamInit )
    encoded_function 'CreateDialogIndirectParam', [:hinstance, DLGTEMPLATE.ptr, :hwnd, :pointer, :lparam], :hwnd

    #HWND WINAPI CreateDialogParam(
    #  _In_opt_  HINSTANCE hInstance,
    #  _In_      LPCTSTR lpTemplateName,
    #  _In_opt_  HWND hWndParent,
    #  _In_opt_  DLGPROC lpDialogFunc,
    #  _In_      LPARAM dwInitParam )
    encoded_function 'CreateDialogParam', [:hinstance, :pointer, :hwnd, :pointer, :lparam], :hwnd

    #LRESULT WINAPI DefDlgProcA(
    #  _In_  HWND hDlg,
    #  _In_  UINT Msg,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    encoded_function 'DefDlgProc', [:hwnd, :uint, :wparam, :lparam], :lresult

    #INT_PTR WINAPI DialogBoxIndirectParam(
    #  _In_opt_  HINSTANCE hInstance,
    #  _In_      LPCDLGTEMPLATE hDialogTemplate,
    #  _In_opt_  HWND hWndParent,
    #  _In_opt_  DLGPROC lpDialogFunc,
    #  _In_      LPARAM dwInitParam )
    encoded_function 'DialogBoxIndirectParam', [:hinstance, DLGTEMPLATE.ptr, :hwnd, :pointer, :lparam], :int

    #INT_PTR WINAPI DialogBoxParam(
    #  _In_opt_  HINSTANCE hInstance,
    #  _In_      LPCTSTR lpTemplateName,
    #  _In_opt_  HWND hWndParent,
    #  _In_opt_  DLGPROC lpDialogFunc,
    #  _In_      LPARAM dwInitParam )
    encoded_function 'DialogBoxParam', [:hinstance, :buffer_in, :hwnd, :pointer, :lparam], :int

    #INT_PTR CALLBACK DialogProc(
    #  _In_  HWND hwndDlg,
    #  _In_  UINT uMsg,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    DialogProc = callback :DialogProc, [:hwnd, :uint, :wparam, :lparam], :int

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
    encoded_function 'GetDlgItemText', [:hwnd, :int, :pointer, :bool], :uint

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
    encoded_function 'IsDialogMessage', [:hwnd, MSG.ptr], :bool

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
    encoded_function 'MessageBox', [:hwnd, :buffer_in, :buffer_in, MessageBoxFlags], :int

    #int WINAPI MessageBoxEx(
    #  _In_opt_  HWND hWnd,
    #  _In_opt_  LPCTSTR lpText,
    #  _In_opt_  LPCTSTR lpCaption,
    #  _In_      UINT uType,
    #  _In_      WORD wLanguageId )
    encoded_function 'MessageBoxEx', [:hwnd, :buffer_in, :buffer_in, MessageBoxFlags, :word], :int

    #int WINAPI MessageBoxIndirect( _In_  const LPMSGBOXPARAMS lpMsgBoxParams )
    encoded_function 'MessageBoxIndirect', [MSGBOXPARAMS.ptr], :int

    #LRESULT WINAPI SendDlgItemMessage(
    #  _In_  HWND hDlg,
    #  _In_  int nIDDlgItem,
    #  _In_  UINT Msg,
    #  _In_  WPARAM wParam,
    #  _In_  LPARAM lParam )
    encoded_function 'SendDlgItemMessage', [:hwnd, :int, :uint, :wparam, :lparam], :lresult

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
    encoded_function 'SetDlgItemText', [:hwnd, :int, :buffer_in], :bool

  end
end