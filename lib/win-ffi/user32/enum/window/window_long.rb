require 'win-ffi/user32'

module WinFFI
  module User32
    WindowLong = enum :window_long,
    [
      :WNDPROC,    -4,  #Sets a new address for the window_class procedure. You cannot change this attribute if the
      # window_class does not belong to the same process as the calling thread.

      :HINSTANCE,  -6, #Sets a new application instance handle.

      :ID,        -12, #Sets a new identifier of the child window_class. The window_class cannot be a top-level window_class.

      :STYLE,     -16, #Sets a new window_class style.

      :EXSTYLE,   -20, #Sets a new extended window_class style.

      :USERDATA,  -21, #Sets the user data associated with the window_class. This data is intended for use by the
      # application that created the window_class. Its value is initially zero.
    ]
  end
end