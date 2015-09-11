require 'win-ffi/structs/comdlg32/choose_font'

module WinFFI
  module Comdlg32
      #BOOL WINAPI ChooseFont( _Inout_  LPCHOOSEFONT lpcf )
      attach_function 'ChooseFontA', [CHOOSEFONT.ptr], :bool
      attach_function 'ChooseFontW', [CHOOSEFONT.ptr], :bool
  end
end