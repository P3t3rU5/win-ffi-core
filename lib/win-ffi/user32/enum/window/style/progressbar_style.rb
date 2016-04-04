require 'win-ffi/user32'

module WinFFI
  module User32
    buffer = [:SMOOTH,   0x01,
              :VERTICAL, 0x04]

    if WindowsVersion >= :xp
      buffer += [:MARQUEE, 0x08]
      if WindowsVersion >= :vista
        buffer += [:SMOOTHREVERSE, 0x10]
      end
    end
    ProgressBarStyle = enum :progress_bar_style, buffer
  end
end