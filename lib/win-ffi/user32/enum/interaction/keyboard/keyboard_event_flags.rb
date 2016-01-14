require 'win-ffi/user32'

module WinFFI
  module User32
    KeyboardEventFlags = enum :keyboard_event_flags, [
        :EXTENDEDKEY, 0x0001, # If specified, the scan code was preceded by a prefix byte that has the value 0xE0 (224).
        :KEYUP,       0x0002, # If specified, the key is being released. If not specified, the key is being pressed.
        :UNICODE,     0x0004, # If specified, wScan identifies the key and wVk is ignored.
        :SCANCODE,    0x0008  # If specified, the system synthesizes a VK_PACKET keystroke. The wVk parameter must be zero. This flag can only be combined with the KEYEVENTF_KEYUP flag. For more information, see the Remarks section.
    ]
  end
end