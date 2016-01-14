require 'win-ffi/user32'

module WinFFI
  module User32
    ChildWindowFromPointExFlags = enum :child_window_from_point_ex_flags, [
        :ALL,             0x0000,
        :SKIPINVISIBLE,   0x0001,
        :SKIPDISABLED,    0x0002,
        :SKIPTRANSPARENT, 0x0004
    ]
  end
end