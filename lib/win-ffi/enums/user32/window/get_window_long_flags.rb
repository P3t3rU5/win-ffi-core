module WinFFI
  module User32
    GetWindowLongFlags = enum :get_window_long_flags,
    [
        :WNDPROC,    -4, # Retrieves the address of the window procedure, or a handle representing the address of the window procedure. You must use the CallWindowProc function to call the window procedure.
        :HINSTANCE,  -6, # Retrieves a handle to the application instance.
        :HWNDPARENT, -8, # Retrieves a handle to the parent window, if any.
        :ID,        -12, # Retrieves the identifier of the window.
        :STYLE,     -16, # Retrieves the window styles.
        :EXSTYLE,   -20, # Retrieves the extended window styles.
        :USERDATA,  -21, # Retrieves the user data associated with the window. This data is intended for use by the application that created the window. Its value is initially zero.
    ]
  end
end