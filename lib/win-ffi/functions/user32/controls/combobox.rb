require 'win-ffi/functions/user32'

require 'win-ffi/structs/user32/controls/combobox_info'

module WinFFI
  module User32
    #int DlgDirListComboBox(
    #  _In_     HWND hDlg,
    #  _Inout_  HWND lpPathSpec,
    #  _In_     int nIDComboBox,
    #  _In_     int nIDStaticPath,
    #  _In_     UINT uFiletype )
    attach_function 'DlgDirListComboBoxA', [:hwnd, :string, :int, :int, :uint], :int
    attach_function 'DlgDirListComboBoxW', [:hwnd, :string, :int, :int, :uint], :int

    #BOOL DlgDirSelectComboBoxEx(
    #  _In_   HWND hDlg,
    #  _Out_  LPTSTR lpString,
    #  _In_   int nCount,
    #  _In_   int nIDComboBox )
    attach_function 'DlgDirSelectComboBoxExA', [:hwnd, :string, :int, :int], :bool
    attach_function 'DlgDirSelectComboBoxExW', [:hwnd, :string, :int, :int], :bool

    #BOOL GetComboBoxInfo(
    #  _In_   HWND hwndCombo,
    #  _Out_  PCOMBOBOXINFO pcbi )
    attach_function 'GetComboBoxInfo', [:hwnd, COMBOBOXINFO.ptr], :bool
  end
end