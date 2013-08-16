module WinFFI
  module User32
    WindowStyle = enum :window_style, [
        :BORDER,           0x00800000, # has a thin-line border.

        :CAPTION,          0x00C00000, # has a title bar (includes the WS_BORDER style).

        :CHILD,            0x40000000, # is a child window. A window with this style cannot have a menu bar. This style
        # cannot be used with the WS_POPUP style.

        :CHILDWINDOW,      0x40000000, # Same as the WS_CHILD style.

        :CLIPCHILDREN,     0x02000000, # Excludes the area occupied by child windows when drawing occurs within the parent
        # window. This style is used when creating the parent window.

        :CLIPSIBLINGS,     0x04000000, # Clips child windows relative to each other; that is, when a particular child
        # window receives a WM_PAINT message, the WS_CLIPSIBLINGS style clips all other overlapping child windows out of
        # the region of the child window to be updated. If WS_CLIPSIBLINGS is not specified and child windows overlap, it
        # is possible, when drawing within the client area of a child window, to draw within the client area of a
        # neighboring child window.

        :DISABLED,         0x08000000, # is initially disabled. A disabled window cannot receive input from the user. To
        # change this after a window has been created, use the EnableWindow function.

        :DLGFRAME,         0x00400000, #has a border of a style typically used with dialog boxes. A window with this style
        # cannot have a title bar.

        :GROUP,            0x00020000, # is the first control of a group of controls. The group consists of this first
        # control and all controls defined after it, up to the next control with the WS_GROUP style. The first control
        # in each group usually has the WS_TABSTOP style so that the user can move from group to group. The user can
        # subsequently change the keyboard focus from one control in the group to the next control in the group by using
        # the direction keys. You can turn this style on and off to change dialog box navigation. To change this style
        # after a window has been created, use the SetWindowLong function.

        :HSCROLL,          0x00100000, # has a horizontal scroll bar.

        :ICONIC,           0x20000000, # is initially minimized. Same as the WS_MINIMIZE style.

        :MAXIMIZE,         0x01000000, # is initially maximized.

        :MAXIMIZEBOX,      0x00010000, # has a maximize button. Cannot be combined with the WS_EX_CONTEXTHELP style. The
        # WS_SYSMENU style must also be specified.

        :MINIMIZE,         0x20000000, # is initially minimized. Same as the :ICONIC style.

        :MINIMIZEBOX,      0x00020000, # has a minimize button. Cannot be combined with the WS_EX_CONTEXTHELP style. The
        # WS_SYSMENU style must also be specified.

        :OVERLAPPED,       0x00000000, # is an overlapped window. An overlapped window has a title bar and a border.
        # Same as the WS_TILED style.

        :OVERLAPPEDWINDOW, 0x00CF0000, # is an overlapped window. Same as the :TILEDWINDOW style.

        :POPUP,            0x80000000, #s is a pop-up window. This style cannot be used with the :CHILD style.

        :POPUPWINDOW,      0x80880000, # is a pop-up window. The WS_CAPTION and WS_POPUPWINDOW styles must be combined to
        # make  menu visible.

        :SIZEBOX,          0x00040000, # has a sizing border. Same as the :THICKFRAME style.

        :SYSMENU,          0x00080000, # has a window menu on its title bar. The :CAPTION style must also be specified.

        :TABSTOP,          0x00010000, # is a control that can receive the keyboard focus when the user presses the TAB
        # key. Pressing the TAB key changes the keyboard focus to the next control with the WS_TABSTOP style. You can turn
        # this style on and off to change dialog box navigation. To change this style after a window has been created, use
        # the SetWindowLong function. For user-created windows and modeless dialogs to work with tab stops, alter the
        # message loop to call the IsDialogMessage function.

        :THICKFRAME,       0x00040000, # has a sizing border. Same as the :SIZEBOX style.

        :TILED,            0x00000000, # is an overlapped window. An overlapped window has a title bar and a border. Same
        # as the :OVERLAPPED style.

        :TILEDWINDOW,      0x00CF0000, # is an overlapped window. Same as the :OVERLAPPEDWINDOW style.

        :VISIBLE,          0x10000000, # is initially visible. This style can be turned on and off by using the ShowWindow
        # or SetWindowPos function.

        :VSCROLL,          0x00200000  # has a vertical scroll bar.
    ]
  end
end