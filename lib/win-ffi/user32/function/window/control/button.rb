require 'win-ffi/user32'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/bb761875(v=vs.85).aspx
    # BOOL CheckDlgButton(
    #   _In_  HWND hDlg,
    #   _In_  int nIDButton,
    #   _In_  UINT uCheck )
    attach_function 'CheckDlgButton', [:hwnd, :int, :uint], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/bb761877(v=vs.85).aspx
    # BOOL CheckRadioButton(
    #   _In_  HWND hDlg,
    #   _In_  int nIDFirstButton,
    #   _In_  int nIDLastButton,
    #   _In_  int nIDCheckButton )
    attach_function 'CheckRadioButton', [:hwnd, :int, :int, :int], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/bb761879(v=vs.85).aspx
    # UINT IsDlgButtonChecked(
    #   _In_  HWND hDlg,
    #   _In_  int nIDButton )
    attach_function 'IsDlgButtonChecked', [:hwnd, :int], :uint
  end
end