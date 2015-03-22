module WinFFI
  module User32
    KeyEventFlags = enum :key_event_flags,
    [
      :EXTENDEDKEY, 0x0001, # If specified, the scan code was preceded by a prefix byte having the value 0xE0 (224).
      :KEYUP, 0x0002, # If specified, the key is being released. If not specified, the key is being depressed.
    ]
  end
end