require 'win-ffi/user32'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms633548(v=vs.85).aspx
    ShowWindowFlags = enum :show_window, [
        :HIDE, #Hides the window_class and activates another window_class.
        :SHOWNORMAL, # Activates and displays a window_class. If the window_class is minimized or maximized, the system restores
        # it to its original size and position. An application should specify this flag when displaying the window_class for
        # the first time.
        :SHOWMINIMIZED, # Activates the window_class and displays it as a minimized window_class.

        :MAXIMIZE, # Maximizes the specified window_class.

        :SHOWMAXIMIZED, 3, # Activates the window_class and displays it as a maximized window_class.

        :SHOWNOACTIVATE, # Displays the window_class as a minimized window_class. This value is similar to SW_SHOWMINIMIZED, except
        # the window_class is not activated.

        :SHOW, # Activates the window_class and displays it in its current size and position.

        :MINIMIZE, # Minimizes the specified window_class and activates the next top-level window_class in the Z order.

        :SHOWMINNOACTIVE,  #Displays the window_class as a minimized window_class. This value is similar to SW_SHOWMINIMIZED, except
        # the window_class is not activated.

        :SHOWNA,           #Displays the window_class in its current size and position. This value is similar to SW_SHOW, except
        # that the window_class is not activated.

        :RESTORE,          #Activates and displays the window_class. If the window_class is minimized or maximized, the system
        # restores it to its original size and position. An application should specify this flag when restoring a
        # minimized window_class.

        :SHOWDEFAULT,      #Sets the show state based on the SW_ value specified in the STARTUPINFO structure passed to
        # the CreateProcess function by the program that started the application.

        :FORCEMINIMIZE,     #Minimizes a window_class, even if the thread that owns the window_class is not responding. This flag
    # should only be used when minimizing windows from a different thread.
        :MAX, 11
    ]
  end
end