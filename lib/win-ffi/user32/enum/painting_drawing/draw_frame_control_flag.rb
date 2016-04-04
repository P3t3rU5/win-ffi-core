require 'win-ffi/user32'

module WinFFI
  module User32
    # Flags for DrawFrameControl
    DrawFrameControlFlag = enum :draw_frame_control_flag,
    [
      :CAPTION,    1,
      :MENU,       2,
      :SCROLL,     3,
      :BUTTON,     4,
      :POPUPMENU,  5
    ]
  end
end