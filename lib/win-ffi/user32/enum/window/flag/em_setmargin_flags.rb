require 'win-ffi/user32'

module WinFFI
  module User32
    # Edit control EM_SETMARGIN parameters
    EditControl = enum :edit_control, [
        :LEFTMARGIN,       0x0001,
        :RIGHTMARGIN,      0x0002,
        :USEFONTINFO,      0xffff
    ]
  end
end