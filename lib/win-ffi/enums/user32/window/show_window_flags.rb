require 'win-ffi/enums/user32'

module WinFFI
  module User32
    ShowWindowFlags = enum :show_window, [
        :HIDE,             #Hides the window and activates another window.

        :SHOWNORMAL,       #Activates and displays a window. If the window is minimized or maximized, the system restores
        # it to its original size and position. An application should specify this flag when displaying the window for the first time.

        :SHOWMINIMIZED,    #Activates the window and displays it as a minimized window.

        :MAXIMIZE,         #Maximizes the specified window.

        :SHOWMAXIMIZED, 3, #Activates the window and displays it as a maximized window.

        :SHOWNOACTIVATE,   #Displays the window as a minimized window. This value is similar to SW_SHOWMINIMIZED, except
        # the window is not activated.

        :SHOW,             #Activates the window and displays it in its current size and position.

        :MINIMIZE,         #Minimizes the specified window and activates the next top-level window in the Z order.

        :SHOWMINNOACTIVE,  #Displays the window as a minimized window. This value is similar to SW_SHOWMINIMIZED, except
        # the window is not activated.

        :SHOWNA,           #Displays the window in its current size and position. This value is similar to SW_SHOW, except
        # that the window is not activated.

        :RESTORE,          #Activates and displays the window. If the window is minimized or maximized, the system
        # restores it to its original size and position. An application should specify this flag when restoring a
        # minimized window.

        :SHOWDEFAULT,      #Sets the show state based on the SW_ value specified in the STARTUPINFO structure passed to
        # the CreateProcess function by the program that started the application.

        :FORCEMINIMIZE     #Minimizes a window, even if the thread that owns the window is not responding. This flag
    # should only be used when minimizing windows from a different thread.
    ]
  end
end