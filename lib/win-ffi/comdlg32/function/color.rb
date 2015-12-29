require 'win-ffi/comdlg32'

require 'win-ffi/comdlg32/struct/choose_color'

module WinFFI
  module Comdlg32
    #BOOL WINAPI ChooseColor( _Inout_  LPCHOOSECOLOR lpcc )
    encoded_function 'ChooseColor', [CHOOSECOLOR.ptr], :bool
  end
end