require 'win-ffi/user32'

require 'win-ffi/user32/enum/window_class/message_box_flags'
require 'win-ffi/user32/enum/window/return/message_box_return'

require 'win-ffi/general/struct/rect'
require 'win-ffi/user32/struct/window_class/dlg_template'
require 'win-ffi/user32/struct/msg'
require 'win-ffi/user32/struct/window_class/msgbox_params'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645469(v=vs.85).aspx
    # INT_PTR CALLBACK DialogProc(
    #   _In_  HWND hwndDlg,
    #   _In_  UINT uMsg,
    #   _In_  WPARAM wParam,
    #   _In_  LPARAM lParam )
    DialogProc = callback :DialogProc, [:hwnd, :uint, :wparam, :lparam], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645441(v=vs.85).aspx
    # HWND WINAPI CreateDialogIndirectParam(
    #   _In_opt_  HINSTANCE hInstance,
    #   _In_      LPCDLGTEMPLATE lpTemplate,
    #   _In_opt_  HWND hWndParent,
    #   _In_opt_  DLGPROC lpDialogFunc,
    #   _In_      LPARAM lParamInit )
    encoded_function 'CreateDialogIndirectParam', [:hinstance, DLGTEMPLATE.ptr, :hwnd, DialogProc, :lparam], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645445(v=vs.85).aspx
    # HWND WINAPI CreateDialogParam(
    #   _In_opt_  HINSTANCE hInstance,
    #   _In_      LPCTSTR lpTemplateName,
    #   _In_opt_  HWND hWndParent,
    #   _In_opt_  DLGPROC lpDialogFunc,
    #   _In_      LPARAM dwInitParam )
    encoded_function 'CreateDialogParam', [:hinstance, :pointer, :hwnd, DialogProc, :lparam], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645450(v=vs.85).aspx
    # LRESULT WINAPI DefDlgProcA(
    #   _In_  HWND hDlg,
    #   _In_  UINT Msg,
    #   _In_  WPARAM wParam,
    #   _In_  LPARAM lParam )
    encoded_function 'DefDlgProc', [:hwnd, :uint, :wparam, :lparam], :lresult

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645461(v=vs.85).aspx
    # INT_PTR WINAPI DialogBoxIndirectParam(
    #   _In_opt_  HINSTANCE hInstance,
    #   _In_      LPCDLGTEMPLATE hDialogTemplate,
    #   _In_opt_  HWND hWndParent,
    #   _In_opt_  DLGPROC lpDialogFunc,
    #   _In_      LPARAM dwInitParam )
    encoded_function 'DialogBoxIndirectParam', [:hinstance, DLGTEMPLATE.ptr, :hwnd, DialogProc, :lparam], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645465(v=vs.85).aspx
    # INT_PTR WINAPI DialogBoxParam(
    #   _In_opt_  HINSTANCE hInstance,
    #   _In_      LPCTSTR lpTemplateName,
    #   _In_opt_  HWND hWndParent,
    #   _In_opt_  DLGPROC lpDialogFunc,
    #   _In_      LPARAM dwInitParam )
    encoded_function 'DialogBoxParam', [:hinstance, :buffer_in, :hwnd, DialogProc, :lparam], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645472(v=vs.85).aspx
    #  BOOL WINAPI EndDialog(
    #   _In_  HWND hDlg,
    #   _In_  INT_PTR nResult )
    attach_function 'EndDialog', [:hwnd, :int], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645475(v=vs.85).aspx
    # LONG WINAPI GetDialogBaseUnits(void)
    attach_function 'GetDialogBaseUnits', [], :long

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645478(v=vs.85).aspx
    # int WINAPI GetDlgCtrlID( _In_  HWND hwndCtl )
    attach_function 'GetDlgCtrlID', [:hwnd], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645481(v=vs.85).aspx
    # HWND WINAPI GetDlgItem(
    #   _In_opt_  HWND hDlg,
    #   _In_      int nIDDlgItem )
    attach_function 'GetDlgItem', [:hwnd, :int], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645485(v=vs.85).aspx
    # UINT WINAPI GetDlgItemInt(
    #   _In_       HWND hDlg,
    #   _In_       int nIDDlgItem,
    #   _Out_opt_  BOOL *lpTranslated,
    #   _In_       BOOL bSigned )
    attach_function 'GetDlgItemInt', [:hwnd, :int, :pointer, :bool], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645489(v=vs.85).aspx
    # UINT WINAPI GetDlgItemText(
    #   _In_   HWND hDlg,
    #   _In_   int nIDDlgItem,
    #   _Out_  LPTSTR lpString,
    #   _In_   int nMaxCount )
    encoded_function 'GetDlgItemText', [:hwnd, :int, :pointer, :bool], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645492(v=vs.85).aspx
    # HWND WINAPI GetNextDlgGroupItem(
    #   _In_      HWND hDlg,
    #   _In_opt_  HWND hCtl,
    #   _In_      BOOL bPrevious )
    attach_function 'GetNextDlgGroupItem', [:hwnd, :hwnd, :bool], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645495(v=vs.85).aspx
    # HWND WINAPI GetNextDlgTabItem(
    #   _In_      HWND hDlg,
    #   _In_opt_  HWND hCtl,
    #   _In_      BOOL bPrevious )
    attach_function 'GetNextDlgTabItem', [:hwnd, :hwnd, :bool], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645498(v=vs.85).aspx
    # BOOL WINAPI IsDialogMessage(
    #   _In_  HWND hDlg,
    #   _In_  LPMSG lpMsg )
    encoded_function 'IsDialogMessage', [:hwnd, MSG.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645502(v=vs.85).aspx
    # BOOL WINAPI MapDialogRect(
    #   _In_     HWND hDlg,
    #   _Inout_  LPRECT lpRect )
    attach_function 'MapDialogRect', [:hwnd, RECT.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dn910915(v=vs.85).aspx
    # LPCWSTR WINAPI MB_GetString(UINT wBtn)
    attach_function 'MB_GetString', [:uint], :string

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms680356(v=vs.85).aspx
    # BOOL WINAPI MessageBeep( _In_  UINT uType )
    attach_function 'MessageBeep', [MessageBoxFlags], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645505(v=vs.85).aspx
    # int WINAPI MessageBox(
    #   __in_opt HWND hWnd,
    #   __in_opt LPCTSTR lpText,
    #   __in_opt LPCTSTR lpCaption,
    #   __in     UINT uType)
    encoded_function 'MessageBox', [:hwnd, :buffer_in, :buffer_in, MessageBoxFlags], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645507(v=vs.85).aspx
    # int WINAPI MessageBoxEx(
    #   _In_opt_  HWND hWnd,
    #   _In_opt_  LPCTSTR lpText,
    #   _In_opt_  LPCTSTR lpCaption,
    #   _In_      UINT uType,
    #   _In_      WORD wLanguageId )
    encoded_function 'MessageBoxEx', [:hwnd, :buffer_in, :buffer_in, MessageBoxFlags, :word], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645511(v=vs.85).aspx
    # int WINAPI MessageBoxIndirect( _In_  const LPMSGBOXPARAMS lpMsgBoxParams )
    encoded_function 'MessageBoxIndirect', [MSGBOXPARAMS.ptr], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645515(v=vs.85).aspx
    # LRESULT WINAPI SendDlgItemMessage(
    #   _In_  HWND hDlg,
    #   _In_  int nIDDlgItem,
    #   _In_  UINT Msg,
    #   _In_  WPARAM wParam,
    #   _In_  LPARAM lParam )
    encoded_function 'SendDlgItemMessage', [:hwnd, :int, :uint, :wparam, :lparam], :lresult

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645518(v=vs.85).aspx
    # BOOL WINAPI SetDlgItemInt(
    #   _In_  HWND hDlg,
    #   _In_  int nIDDlgItem,
    #   _In_  UINT uValue,
    #   _In_  BOOL bSigned )
    attach_function 'SetDlgItemInt', [:hwnd, :int, :uint, :bool], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645521(v=vs.85).aspx
    # BOOL WINAPI SetDlgItemText(
    #   _In_  HWND hDlg,
    #   _In_  int nIDDlgItem,
    #   _In_  LPCTSTR lpString )
    encoded_function 'SetDlgItemText', [:hwnd, :int, :buffer_in], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645434(v=vs.85).aspx
    # HWND WINAPI CreateDialog(
    #   _In_opt_ HINSTANCE hInstance,
    #   _In_     LPCTSTR   lpTemplate,
    #   _In_opt_ HWND      hWndParent,
    #   _In_opt_ DLGPROC   lpDialogFunc)
    def self.CreateDialog(hInstance, lpName, hParent, lpDialogFunc)
      CreateDialogParam(hInstance, lpName, hParent, lpDialogFunc, 0)
    end

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645436(v=vs.85).aspx
    # HWND WINAPI CreateDialogIndirect(
    #   _In_opt_ HINSTANCE      hInstance,
    #   _In_     LPCDLGTEMPLATE lpTemplate,
    #   _In_opt_ HWND           hWndParent,
    #   _In_opt_ DLGPROC        lpDialogFunc)
    def self.CreateDialogIndirect(hInst, lpTemp, hPar, lpDialFunc)
      CreateDialogIndirectParam(hInst, lpTemp, hPar, lpDialFunc, 0)
    end

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645452(v=vs.85).aspx
    # INT_PTR WINAPI DialogBox(
    #   _In_opt_ HINSTANCE hInstance,
    #   _In_     LPCTSTR   lpTemplate,
    #   _In_opt_ HWND      hWndParent,
    #   _In_opt_ DLGPROC   lpDialogFunc)
    def self.DialogBox(hInstance, lpTemp, hParent, lpDialogFunc)
      DialogBoxParam(hInstance, lpTemp, hParent, lpDialogFunc, 0)
    end

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms645457(v=vs.85).aspx
    # INT_PTR WINAPI DialogBoxIndirect(
    #   _In_opt_ HINSTANCE      hInstance,
    #   _In_     LPCDLGTEMPLATE lpTemplate,
    #   _In_opt_ HWND           hWndParent,
    #   _In_opt_ DLGPROC        lpDialogFunc)
    def self.DialogBoxIndirect(hInst, lpTemp, hParent, lpDialogFunc)
      DialogBoxIndirectParam(hInst, lpTemp, hParent, lpDialogFunc, 0)
    end

  end
end