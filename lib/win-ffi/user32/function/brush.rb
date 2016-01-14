require 'win-ffi/user32'

require 'win-ffi/user32/enum/color_types'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd144927(v=vs.85).aspx
    # HBRUSH GetSysColorBrush( _In_  int nIndex )
    attach_function 'GetSysColorBrush', [ColorTypes], :int
  end
end