require 'win-ffi/user32'

module WinFFI
  module User32
    buffer = [
        :MOVE_RELATIVE,         0,
        :MOVE_ABSOLUTE,         1,
        :VIRTUAL_DESKTOP,    0x02,  # the coordinates are mapped to the virtual desktop
        :ATTRIBUTES_CHANGED, 0x04  # requery for mouse attributes
    ]

    if WindowsVersion >= :vista
      buffer += [:MOVE_NOCOALESCE, 0x08]# do not coalesce mouse moves
    end

    # Define the mouse indicator flags.
    RawInputMouseFlag = enum :rawinput_mouse_flag, buffer
  end
end