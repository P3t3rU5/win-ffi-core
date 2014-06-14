module WinFFI
  module Comdlg32
    extend LibBase
    extend Requirium

    ffi_lib 'Comdlg32'

    %i'
      Color
      FindReplace
      Font
    '.each { |f| autorequire_relative f, "comdlg32/#{f.to_s.snakecase}" }

    #DWORD WINAPI CommDlgExtendedError(void)
    attach_function 'CommDlgExtendedError', [], :dword
  end
end