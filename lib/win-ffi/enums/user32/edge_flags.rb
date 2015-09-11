require 'win-ffi/enums/user32'

module WinFFI
  module User32
    # 3D border styles
    EdgeFlags = enum :border_flags,
    [
      :RAISEDOUTER, 0x0001,
      :SUNKENOUTER, 0x0002,
      :OUTER,       0x0003,
      :RAISEDINNER, 0x0004,
      :RAISED,      0x0005,
      :ETCHED,      0x0006,
      :SUNKENINNER, 0x0008,
      :BUMP,        0x0009,
      :SUNKEN,      0x0010,
      :INNER,       0x0012,
    ]
  end
end