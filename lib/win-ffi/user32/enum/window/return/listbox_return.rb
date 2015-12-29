require 'win-ffi/user32'

module WinFFI
  module User32
    ListBoxReturn = enum :list_box_return,
    [
        :OKAY,      0,
        :ERR,      -1,
        :ERRSPACE, -2,
    ]
  end
end