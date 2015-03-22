module WinFFI
  module User32
    MouseKeysFlags = enum :mouse_keys_flags,
    [
      :ctrl,     0x0008, #The CTRL key is down.
      :lbutton,  0x0001, #The left mouse button is down.
      :mbutton,  0x0010, #The middle mouse button is down.
      :rbutton,  0x0002, #The right mouse button is down.
      :shift,    0x0004, #The SHIFT key is down.
      :xbutton1, 0x0020, #The first X button is down.
      :xbutton2, 0x0040  #The second X button is down.
    ]
  end
end