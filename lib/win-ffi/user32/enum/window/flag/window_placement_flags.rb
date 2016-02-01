module WinFFI
  module User32
    WindowPlacementFlags = enum :windows_placement_flags, [
        :SETMINPOSITION,       0x0001,
        :RESTORETOMAXIMIZED,   0x0002,
        :ASYNCWINDOWPLACEMENT, 0x0004,
    ]
  end
end