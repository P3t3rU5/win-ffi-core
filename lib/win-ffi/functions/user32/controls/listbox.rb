require 'win-ffi/functions/user32'
require 'win-ffi/enums/user32/window/control/dlg_dir_list_flags'

module WinFFI
  module User32
    #int DlgDirList(
    #  _In_     HWND hDlg,
    #  _Inout_  LPTSTR lpPathSpec,
    #  _In_     int nIDListBox,
    #  _In_     int nIDStaticPath,
    #  _In_     UINT uFileType )
    attach_function 'DlgDirListA', [:hwnd, :string, :int, :int, DlgDirListFlags], :int
    attach_function 'DlgDirListW', [:hwnd, :string, :int, :int, DlgDirListFlags], :int

    #BOOL DlgDirSelectEx(
    #  _In_   HWND hDlg,
    #  _Out_  LPTSTR lpString,
    #  _In_   int nCount,
    #  _In_   int nIDListBox )
    attach_function 'DlgDirSelectExA', [:hwnd, :string, :int, :int], :bool
    attach_function 'DlgDirSelectExW', [:hwnd, :string, :int, :int], :bool

    #DWORD GetListBoxInfo( _In_  HWND hwnd )
    attach_function 'GetListBoxInfo', [:hwnd], :dword
  end
end