require 'win-ffi/user32'

module WinFFI
  module User32
    # Scroll Bar Constants
    Scrollbar = enum :scroll_bar, [
        :HORZ,
        :VERT,
        :CTL,
        :BOTH,
    ]
  end
end