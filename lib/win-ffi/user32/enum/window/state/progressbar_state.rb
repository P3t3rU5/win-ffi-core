require 'win-ffi/user32'

module WinFFI
  module User32
    ProgressBarState = enum :progress_bar_state, [
      :NORMAL, 0x0001,
      :ERROR,  0x0002,
      :PAUSED, 0x0003
    ]
  end
end