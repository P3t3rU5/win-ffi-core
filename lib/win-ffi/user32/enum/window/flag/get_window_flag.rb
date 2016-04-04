require 'win-ffi/user32'

module WinFFI
  module User32
    GetWindowFlag = enum :get_window_flag, [
        :HWNDFIRST, 0, # The retrieved handle identifies the window_class of the same type that is highest in the Z
        # order. If the specified window_class is a topmost window_class, the handle identifies a topmost window_class.
        # If the specified window_class is a top-level window_class, the handle identifies a top-level window_class. If
        # the specified window_class is a child window_class, the handle identifies a sibling window_class.

        :HWNDLAST, 1, # The retrieved handle identifies the window_class of the same type that is lowest in the Z order.
        # If the specified window_class is a topmost window_class, the handle identifies a topmost window_class. If the
        # specified window_class is a top-level window_class, the handle identifies a top-level window_class. If the
        # specified window_class is a child window_class, the handle identifies a sibling window_class.

        :HWNDNEXT, 2, # The retrieved handle identifies the window_class below the specified window_class in the Z
        # order. If the specified window_class is a topmost window_class, the handle identifies a topmost window_class.
        # If the specified window_class is a top-level window_class, the handle identifies a top-level window_class. If
        # the specified window_class is a child window_class, the handle identifies a sibling window_class.

        :HWNDPREV, 3, # The retrieved handle identifies the window_class above the specified window_class in the Z
        # order. If the specified window_class is a topmost window_class, the handle identifies a topmost window_class.
        # If the specified window_class is a top-level window_class, the handle identifies a top-level window_class. If
        # the specified window_class is a child window_class, the handle identifies a sibling window_class.

        :OWNER, 4, # The retrieved handle identifies the specified window_class's owner window_class, if any. For more
        # information, see Owned Windows.

        :CHILD, 5, # The retrieved handle identifies the child window_class at the top of the Z order, if the specified
        # window_class is a parent window_class; otherwise, the retrieved handle is NULL. The function examines only
        # child windows of the specified window_class. It does not examine descendant windows.

        :ENABLEDPOPUP, 6, # The retrieved handle identifies the enabled popup window_class owned by the specified
        # window_class (the search uses the first such window_class found using :HWNDNEXT); otherwise, if there are no
        # enabled popup windows, the retrieved handle is that of the specified window_class.
        :MAX, 6
    ]
  end
end
