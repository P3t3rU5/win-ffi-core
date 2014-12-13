module WinFFI
  module User32
    module Mouse
      MouseEventFlags = enum :mouse_event_flags, [
        :MOVE, 0x0001, # Movement occurred.
        :LEFTDOWN, 0x0002, # The left button is down.
        :LEFTUP, 0x0004, # The left button is up.
        :RIGHTDOWN, 0x0008, # The right button is down.
        :RIGHTUP, 0x0010, # The right button is up.
        :MIDDLEDOWN, 0x0020, # The middle button is down.
        :MIDDLEUP, 0x0040, # The middle button is up.
        :XDOWN, 0x0080, # An X button was pressed.
        :XUP, 0x0100, # An X button was released.
        :WHEEL, 0x0800, # The wheel has been moved, if the mouse has a wheel. The amount of movement is specified in
        # dwData, # The wheel button is rotated.
        :HWHEEL, 0x01000, # The wheel button is tilted.
        :ABSOLUTE, 0x8000, # The dx and dy parameters contain normalized absolute coordinates. If not set, those
        # parameters contain relative data: the change in position since the last reported position. This flag can be
        # set, or not set, regardless of what kind of mouse or mouse-like device, if any, is connected to the system.
        # For further information about relative mouse motion, see the following Remarks section.
      ]

      MouseKeysFlags = enum :mouse_keys_flags, [
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
end