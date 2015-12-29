require 'win-ffi/user32'

require 'win-ffi/user32/struct/control/combobox_info'

module WinFFI
  module User32
    #int DlgDirListComboBox(
    #  _In_     HWND hDlg,
    #  _Inout_  HWND lpPathSpec,
    #  _In_     int nIDComboBox,
    #  _In_     int nIDStaticPath,
    #  _In_     UINT uFiletype )
    encoded_function 'DlgDirListComboBox', [:hwnd, :string, :int, :int, DlgDirListFlags], :int

    #BOOL DlgDirSelectComboBoxEx(
    #  _In_   HWND hDlg,
    #  _Out_  LPTSTR lpString,
    #  _In_   int nCount,
    #  _In_   int nIDComboBox )
    encoded_function 'DlgDirSelectComboBoxEx', [:hwnd, :string, :int, :int], :bool

    #BOOL GetComboBoxInfo(
    #  _In_   HWND hwndCombo,
    #  _Out_  PCOMBOBOXINFO pcbi )
    attach_function 'GetComboBoxInfo', [:hwnd, COMBOBOXINFO.ptr], :bool
  end
end