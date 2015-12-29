require 'win-ffi/user32'

module WinFFI
  module User32
    # Flags for DrawFrameControl
    DrawFrameControlFlags = enum :draw_frame_control_flags,
    [
      :CAPTION,    1,
      :MENU,       2,
      :SCROLL,     3,
      :BUTTON,     4,
      :POPUPMENU,  5
    ]
  end
end