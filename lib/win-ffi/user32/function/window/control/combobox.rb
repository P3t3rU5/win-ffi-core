require 'win-ffi/user32'

require 'win-ffi/user32/enum/window/control/dlg_dir_list_flags'

require 'win-ffi/user32/struct/control/combobox_info'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/bb775935(v=vs.85).aspx
    # int DlgDirListComboBox(
    #   _In_     HWND hDlg,
    #   _Inout_  HWND lpPathSpec,
    #   _In_     int nIDComboBox,
    #   _In_     int nIDStaticPath,
    #   _In_     UINT uFiletype )
    encoded_function 'DlgDirListComboBox', [:hwnd, :string, :int, :int, DlgDirListFlags], :int

    # https://msdn.microsoft.com/en-us/library/windows/desktop/bb775937(v=vs.85).aspx
    # BOOL DlgDirSelectComboBoxEx(
    #   _In_   HWND hDlg,
    #   _Out_  LPTSTR lpString,
    #   _In_   int nCount,
    #   _In_   int nIDComboBox )
    encoded_function 'DlgDirSelectComboBoxEx', [:hwnd, :string, :int, :int], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/bb775939(v=vs.85).aspx
    # BOOL GetComboBoxInfo(
    #   _In_   HWND hwndCombo,
    #   _Out_  PCOMBOBOXINFO pcbi )
    attach_function 'GetComboBoxInfo', [:hwnd, COMBOBOXINFO.ptr], :bool
  end
end