require 'win-ffi/user32'

module WinFFI
  module User32
    WindowClassStyle = enum :window_class_style,
    [
        :VREDRAW,  0x0001, #Redraws the entire window if a movement or size adjustment changes the height of the client area.

        :HREDRAW,  0x0002, # Redraws the entire window if a movement or size adjustment changes the width of the client area.

        :DBLCLKS,  0x0008, # Sends a double-click message to the window procedure when the user double-clicks the mouse
        # while the cursor is within a window belonging to the class.

        :OWNDC,    0x0020, # Allocates a unique device context for each window in the class.

        :CLASSDC,  0x0040, # Allocates one device context to be shared by all windows in the class. Because window
        # classes are process specific, it is possible for multiple threads of an application to create a window of the
        # same class. It is also possible for the threads to attempt to use the device context simultaneously. When this
        # happens, the system allows only one thread to successfully finish its drawing operation.

        :PARENTDC, 0x0080, # Sets the clipping rectangle of the child window to that of the parent window so that the
        # child can draw on the parent. A window with the :PARENTDC style bit receives a regular device context from
        # the system's cache of device contexts. It does not give the child the parent's device context or device
        # context settings. Specifying CS_PARENTDC enhances an application's performance.

        :NOCLOSE,  0x0200, # Disables Close on the window menu.

        :SAVEBITS, 0x0800, # Saves, as a bitmap, the portion of the screen image obscured by a window of this class.
        # When the window is removed, the system uses the saved bitmap to restore the screen image, including other
        # windows that were obscured. Therefore, the system does not send WM_PAINT messages to windows that were
        # obscured if the memory used by the bitmap has not been discarded and if other screen actions have not
        # invalidated the stored image. This style is useful for small windows (for example, menus or dialog boxes) that
        # are displayed briefly and then removed before other screen activity takes place. This style increases the time
        # required to display the window, because the system must first allocate memory to store the bitmap.

        :BYTEALIGNCLIENT, 0x1000, # Aligns the window's client area on a byte boundary (in the x direction). This style
        # affects the width of the window and its horizontal placement on the display.

        :BYTEALIGNWINDOW, 0x2000, # Aligns the window on a byte boundary (in the x direction). This style affects the
        # width of the window and its horizontal placement on the display.

        :GLOBALCLASS, 0x4000, # Indicates that the window class is an application global class. For more information,
        # see the "Application Global Classes" section of About Window Classes.

        :DROPSHADOW, 0x00020000, #Enables the drop shadow effect on a window. The effect is turned on and off through
                                 # SPI_SETDROPSHADOW. Typically, this is enabled for small, short-lived windows such as menus to emphasize their
                                 # Z order relationship to other windows.
    ]
  end
end