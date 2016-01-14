require 'win-ffi/user32'

require 'win-ffi/user32/enum/window/control/dlg_dir_list_flags'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/bb761366(v=vs.85).aspx
    # int DlgDirList(
    #   _In_     HWND hDlg,
    #   _Inout_  LPTSTR lpPathSpec,
    #   _In_     int nIDListBox,
    #   _In_     int nIDStaticPath,
    #   _In_     UINT uFileType )
    encoded_function 'DlgDirList', [:hwnd, :string, :int, :int, DlgDirListFlags], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/bb761368(v=vs.85).aspx
    # BOOL DlgDirSelectEx(
    #   _In_   HWND hDlg,
    #   _Out_  LPTSTR lpString,
    #   _In_   int nCount,
    #   _In_   int nIDListBox )
    encoded_function 'DlgDirSelectEx', [:hwnd, :string, :int, :int], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/bb761370(v=vs.85).aspx
    # Listbox information.
    # Returns the number of items per row.
    # DWORD GetListBoxInfo( _In_  HWND hwnd )
    attach_function 'GetListBoxInfo', [:hwnd], :dword
  end
end