require_relative '../../structs/comdlg32/choose_color'

module WinFFI
  module Comdlg32
    #BOOL WINAPI ChooseColor( _Inout_  LPCHOOSECOLOR lpcc )
    attach_function 'ChooseColorA', [CHOOSECOLOR.ptr], :bool
    attach_function 'ChooseColorW', [CHOOSECOLOR.ptr], :bool
  end
end