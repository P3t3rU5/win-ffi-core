module WinFFI
  module Comdlg32
    extend LibBase

    ffi_lib 'Comdlg32'


    #DWORD WINAPI CommDlgExtendedError(void)
    attach_function 'CommDlgExtendedError', [], :dword
  end
end

%w'
  color
  findreplace
  font
'.each { |f| require_relative "comdlg32/#{f}" }