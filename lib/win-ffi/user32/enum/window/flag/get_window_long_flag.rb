require 'win-ffi/user32'

module WinFFI
  module User32
    GetWindowLongFlag = enum :get_window_long_flag,
    [
        :WNDPROC,    -4, # Retrieves the address of the window_class procedure, or a handle representing the address of
        # the window_class procedure. You must use the CallWindowProc function to call the window_class procedure.
        :HINSTANCE,  -6, # Retrieves a handle to the application instance.
        :HWNDPARENT, -8, # Retrieves a handle to the parent window_class, if any.
        :ID,        -12, # Retrieves the identifier of the window_class.
        :STYLE,     -16, # Retrieves the window_class styles.
        :EXSTYLE,   -20, # Retrieves the extended window_class styles.
        :USERDATA,  -21, # Retrieves the user data associated with the window_class. This data is intended for use by
        # the application that created the window_class. Its value is initially zero.
    ]
  end
end