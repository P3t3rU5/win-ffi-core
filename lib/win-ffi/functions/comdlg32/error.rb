module WinFFI
  module Comdlg32
    #DWORD WINAPI CommDlgExtendedError(void)
    attach_function 'CommDlgExtendedError', [], :dword
  end
end