require 'win-ffi/comdlg32'

require 'win-ffi/comdlg32/struct/choose_font'

module WinFFI
  module Comdlg32
      #BOOL WINAPI ChooseFont( _Inout_  LPCHOOSEFONT lpcf )
    encoded_function 'ChooseFont', [CHOOSEFONT.ptr], :bool
  end
end