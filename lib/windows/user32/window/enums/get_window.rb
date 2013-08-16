module WinFFI
  module User32
    module Window
      GetWindowFlags = enum :get_window_flags, [
          :HWNDFIRST, 0, # The retrieved handle identifies the window of the same type that is highest in the Z order.
          # If the specified window is a topmost window, the handle identifies a topmost window. If the specified window
          # is a top-level window, the handle identifies a top-level window. If the specified window is a child window,
          # the handle identifies a sibling window.

          :HWNDLAST, 1, # The retrieved handle identifies the window of the same type that is lowest in the Z order.
          # If the specified window is a topmost window, the handle identifies a topmost window. If the specified window
          # is a top-level window, the handle identifies a top-level window. If the specified window is a child window,
          # the handle identifies a sibling window.

          :HWNDNEXT, 2, # The retrieved handle identifies the window below the specified window in the Z order.
          # If the specified window is a topmost window, the handle identifies a topmost window. If the specified window
          # is a top-level window, the handle identifies a top-level window. If the specified window is a child window,
          # the handle identifies a sibling window.

          :HWNDPREV, 3, # The retrieved handle identifies the window above the specified window in the Z order.
          # If the specified window is a topmost window, the handle identifies a topmost window. If the specified window
          # is a top-level window, the handle identifies a top-level window. If the specified window is a child window,
          # the handle identifies a sibling window.

          :OWNER, 4, # The retrieved handle identifies the specified window's owner window, if any. For more information,
          # see Owned Windows.

          :CHILD, 5, # The retrieved handle identifies the child window at the top of the Z order, if the specified window
          # is a parent window; otherwise, the retrieved handle is NULL. The function examines only child windows of the
          # specified window. It does not examine descendant windows.

          :ENABLEDPOPUP, 6, # The retrieved handle identifies the enabled popup window owned by the specified window
                            # (the search uses the first such window found using :HWNDNEXT); otherwise, if there are no enabled popup
                            # windows, the retrieved handle is that of the specified window.
      ]
    end
  end
end
