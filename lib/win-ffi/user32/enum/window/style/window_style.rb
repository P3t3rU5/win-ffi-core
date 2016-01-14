require 'win-ffi/user32'

module WinFFI
  module User32
    # Window Styles
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632600(v=vs.85).aspx
    WindowStyle = enum :window_style, [
        :TILED,            0x00000000, # is an overlapped window_class. An overlapped window_class has a title bar and a border. Same
        # as the :OVERLAPPED style.
        :OVERLAPPED,       0x00000000, # is an overlapped window_class. An overlapped window_class has a title bar and a border.
        # POPUP | BORDER | SYSMENU

        :POPUPWINDOW,      0x80880000, # is a pop-up window_class. The WS_CAPTION and WS_POPUPWINDOW styles must be combined to
        # make  menu visible.

        :POPUP,            0x80000000, #s is a pop-up window_class. This style cannot be used with the :CHILD style.
        # Same as the WS_TILED style.
        :CHILDWINDOW,      0x40000000, # Same as the WS_CHILD style.
        :CHILD,            0x40000000, # is a child window_class. A window_class with this style cannot have a menu bar. This style
        # cannot be used with the WS_POPUP style.
        :MINIMIZE,         0x20000000, # is initially minimized. Same as the :ICONIC style.
        :ICONIC,           0x20000000, # is initially minimized. Same as the WS_MINIMIZE style.
        :VISIBLE,          0x10000000, # is initially visible. This style can be turned on and off by using the ShowWindow
        # or SetWindowPos function.
        :DISABLED,         0x08000000, # is initially disabled. A disabled window_class cannot receive input from the user. To
        # change this after a window_class has been created, use the EnableWindow function.
        :CLIPSIBLINGS,     0x04000000, # Clips child windows relative to each other; that is, when a particular child
        # window_class receives a WM_PAINT message, the WS_CLIPSIBLINGS style clips all other overlapping child windows out of
        # the region of the child window_class to be updated. If WS_CLIPSIBLINGS is not specified and child windows overlap, it
        # is possible, when drawing within the client area of a child window_class, to draw within the client area of a
        # neighboring child window_class.
        :CLIPCHILDREN,     0x02000000, # Excludes the area occupied by child windows when drawing occurs within the parent
        # window_class. This style is used when creating the parent window_class.
        :MAXIMIZE,         0x01000000, # is initially maximized.

        :TILEDWINDOW,      0x00CF0000, # is an overlapped window_class. Same as the :OVERLAPPEDWINDOW style.
        :OVERLAPPEDWINDOW, 0x00CF0000, # is an overlapped window_class. Same as the :TILEDWINDOW style.
        # OVERLAPPED | CAPTION | SYSMENU | THICKFRAME | MINIMIZEBOX | WS_MAXIMIZEBOX

        :CAPTION,          0x00C00000, # has a title bar (includes the WS_BORDER style). :BORDER | :DLGFRAME

        :BORDER,           0x00800000, # has a thin-line border.
        :DLGFRAME,         0x00400000, #has a border of a style typically used with dialog boxes. A window_class with this style
        # cannot have a title bar. [Doesn't work]
        :VSCROLL,          0x00200000,  # has a vertical scroll bar.
        :HSCROLL,          0x00100000, # has a horizontal scroll bar.
        :SYSMENU,          0x00080000, # has a window_class menu on its title bar. [ The :CAPTION style must also be specified. ]->should
        :SIZEBOX,          0x00040000, # has a sizing border. Same as the :THICKFRAME style.
        :THICKFRAME,       0x00040000, # has a sizing border. Same as the :SIZEBOX style.
        :GROUP,            0x00020000, # is the first control of a group of controls. The group consists of this first
        # control and all controls defined after it, up to the next control with the WS_GROUP style. The first control
        # in each group usually has the WS_TABSTOP style so that the user can move from group to group. The user can
        # subsequently change the keyboard focus from one control in the group to the next control in the group by using
        # the direction keys. You can turn this style on and off to change dialog box navigation. To change this style
        # after a window_class has been created, use the SetWindowLong function.
        :TABSTOP,          0x00010000, # is a control that can receive the keyboard focus when the user presses the TAB
        # key. Pressing the TAB key changes the keyboard focus to the next control with the WS_TABSTOP style. You can turn
        # this style on and off to change dialog box navigation. To change this style after a window_class has been created, use
        # the SetWindowLong function. For user-created windows and modeless dialogs to work with tab stops, alter the
        # message loop to call the IsDialogMessage function.

        :MINIMIZEBOX,      0x00020000, # has a minimize button. Cannot be combined with the WS_EX_CONTEXTHELP style. The
        # WS_SYSMENU style must also be specified.
        :MAXIMIZEBOX,      0x00010000, # has a maximize button. Cannot be combined with the WS_EX_CONTEXTHELP style. The
    # WS_SYSMENU style must also be specified.
    ]
  end
end