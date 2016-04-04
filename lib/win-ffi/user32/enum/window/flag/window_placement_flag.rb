module WinFFI
  module User32
    WindowPlacementFlag = enum :windows_placement_flag, [
        :SETMINPOSITION,       0x0001,
        :RESTORETOMAXIMIZED,   0x0002,
        :ASYNCWINDOWPLACEMENT, 0x0004,
    ]
  end
end