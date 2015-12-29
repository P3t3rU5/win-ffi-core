require 'win-ffi/user32'

require 'win-ffi/user32/enum/color_types'

module WinFFI
  module User32
    # HBRUSH GetSysColorBrush( _In_  int nIndex )
    attach_function 'GetSysColorBrush', [ColorTypes], :int
  end
end