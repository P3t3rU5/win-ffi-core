require 'win-ffi/user32'

module WinFFI
  module User32
    # Key State Masks for Mouse Messages
    MouseKeysState = enum :mouse_keys_state,
    [
      :LBUTTON,  0x0001, # The left mouse button is down.
      :RBUTTON,  0x0002, # The right mouse button is down.
      :SHIFT,    0x0004, # The SHIFT key is down.
      :CTRL,     0x0008, # The CTRL key is down.
      :MBUTTON,  0x0010, # The middle mouse button is down.
      :XBUTTON1, 0x0020, # The first X button is down.
      :XBUTTON2, 0x0040  # The second X button is down.
    ]
  end
end