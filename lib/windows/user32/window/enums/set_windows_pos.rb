module WinFFI
  module User32
    module Window
      SetWindowsPosFlags = enum :set_windows_pos_flags, [
          :NOSIZE, 0x0001, # Retains the current size (ignores the cx and cy parameters).

          :NOMOVE, 0x0002, # Retains the current position (ignores X and Y parameters).

          :NOZORDER, 0x0004, # Retains the current Z order (ignores the hWndInsertAfter parameter).

          :NOREDRAW, 0x0008, # Does not redraw changes. If this flag is set, no repainting of any kind occurs. This
          # applies to the client area, the nonclient area (including the title bar and scroll bars), and any part of the
          # parent window uncovered as a result of the window being moved. When this flag is set, the application must
          # explicitly invalidate or redraw any parts of the window and parent window that need redrawing.

          :NOACTIVATE, 0x0010, # Does not activate the window. If this flag is not set, the window is activated and moved
          # to the top of either the topmost or non-topmost group (depending on the setting of the hWndInsertAfter
          # parameter).

          :DRAWFRAME, 0x0020, # Draws a frame (defined in the window's class description) around the window.

          :FRAMECHANGED, 0x0020, # Applies new frame styles set using the SetWindowLong function. Sends a WM_NCCALCSIZE
          # message to the window, even if the window's size is not being changed. If this flag is not specified,
          # WM_NCCALCSIZE is sent only when the window's size is being changed.

          :SHOWWINDOW, 0x0040, # Displays the window.

          :HIDEWINDOW, 0x0080, # Hides the window.

          :NOCOPYBITS, 0x0100, # Discards the entire contents of the client area. If this flag is not specified, the valid
          # contents of the client area are saved and copied back into the client area after the window is sized or
          # repositioned.

          :NOOWNERZORDER, 0x0200, # Does not change the owner window's position in the Z order.

          :NOREPOSITION, 0x0200, # Same as the :NOOWNERZORDER flag.

          :NOSENDCHANGING, 0x0400, # Prevents the window from receiving the WM_WINDOWPOSCHANGING message.

          :DEFERERASE, 0x2000, # Prevents generation of the WM_SYNCPAINT message.

          :ASYNCWINDOWPOS, 0x4000, # If the calling thread and the thread that owns the window are attached to different
                                   # input queues, the system posts the request to the thread that owns the window. This prevents the calling
                                   # thread from blocking its execution while other threads process the request.

      ]
    end
  end
end