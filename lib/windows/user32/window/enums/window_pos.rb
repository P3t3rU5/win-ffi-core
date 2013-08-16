module WinFFI
  module User32
    module Window

      SetWindowPosFlags = enum :window_pos_flags, [
          :NOSIZE,          0x0001, #Retains the current size (ignores the cx and cy members).

          :NOMOVE,          0x0002, #Retains the current position (ignores the x and y members).

          :NOZORDER,        0x0004, #Retains the current Z order (ignores the hwndInsertAfter member).

          :NOREDRAW,        0x0008, #Does not redraw changes. If this flag is set, no repainting of any kind occurs. This
          # applies to the client area, the nonclient area (including the title bar and scroll bars), and any part of the
          # parent window uncovered as a result of the window being moved. When this flag is set, the application must
          # explicitly invalidate or redraw any parts of the window and parent window that need redrawing.

          :NOACTIVATE,      0x0010, #Does not activate the window. If this flag is not set, the window is activated and
          # moved to the top of either the topmost or non-topmost group (depending on the setting of the hwndInsertAfter
          # member).

          :DRAWFRAME,       0x0020, #Draws a frame (defined in the window's class description) around the window. Same as
          # the SWP_FRAMECHANGED flag.

          :FRAMECHANGED,    0x0020, #Sends a WM_NCCALCSIZE message to the window, even if the window's size is not being
          # changed. If this flag is not specified, WM_NCCALCSIZE is sent only when the window's size is being changed.

          :SHOWWINDOW,      0x0040, #Displays the window.

          :HIDEWINDOW,      0x0080, #Hides the window.

          :NOCOPYBITS,      0x0100, #Discards the entire contents of the client area. If this flag is not specified, the
          # valid contents of the client area are saved and copied back into the client area after the window is sized or
          # repositioned.

          :NOOWNERZORDER,   0x0200, #Does not change the owner window's position in the Z order.

          :NOREPOSITION,    0x0200, #Does not change the owner window's position in the Z order. Same as the
          # SWP_NOOWNERZORDER flag.

          :NOSENDCHANGING,  0x0400, #Prevents the window from receiving the WM_WINDOWPOSCHANGING message.
      ]
    end
  end
end