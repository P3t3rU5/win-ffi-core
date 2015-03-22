module WinFFI
  module User32
    #BOOL CheckDlgButton(
    #  _In_  HWND hDlg,
    #  _In_  int nIDButton,
    #  _In_  UINT uCheck )
    attach_function 'CheckDlgButton', [:hwnd, :int, :uint], :bool

    #BOOL CheckRadioButton(
    #  _In_  HWND hDlg,
    #  _In_  int nIDFirstButton,
    #  _In_  int nIDLastButton,
    #  _In_  int nIDCheckButton )
    attach_function 'CheckRadioButton', [:hwnd, :int, :int, :int], :bool

    #UINT IsDlgButtonChecked(
    #  _In_  HWND hDlg,
    #  _In_  int nIDButton )
    attach_function 'IsDlgButtonChecked', [:hwnd, :int], :uint
  end
end