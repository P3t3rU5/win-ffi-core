require 'win-ffi/user32'

module WinFFI
  module User32
    WindowLong = enum :window_long,
    [
      :WNDPROC,    -4,  #Sets a new address for the window procedure. You cannot change this attribute if the
      # window does not belong to the same process as the calling thread.

      :HINSTANCE,  -6, #Sets a new application instance handle.

      :ID,        -12, #Sets a new identifier of the child window. The window cannot be a top-level window.

      :STYLE,     -16, #Sets a new window style.

      :EXSTYLE,   -20, #Sets a new extended window style.

      :USERDATA,  -21, #Sets the user data associated with the window. This data is intended for use by the
      # application that created the window. Its value is initially zero.
    ]
  end
end