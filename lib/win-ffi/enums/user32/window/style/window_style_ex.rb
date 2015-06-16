module WinFFI
  module User32
      WindowStyleEx = enum :window_style_ex,
      [
          :ACCEPTFILES,      0x00000010, # accepts drag-drop files.

          :APPWINDOW,        0x00040000, # Forces a top-level window onto the taskbar when the window is visible.

          :CLIENTEDGE,       0x00000200, # has a border with a sunken edge.

          :COMPOSITED,       0x02000000, # Paints all descendants of a window in bottom-to-top painting order using
          # double-buffering. For more information, see Remarks. This cannot be used if the window has a class style of
          # either :OWNDC or :CLASSDC.

          :CONTEXTHELP,      0x00000400, # The title bar of the window includes a question mark. When the user clicks the
          # question mark, the cursor changes to a question mark with a pointer. If the user then clicks a child window, the
          # child receives a WM_HELP message. The child window should pass the message to the parent window procedure, which
          # should call the WinHelp function using the HELP_WM_HELP command. The Help application displays a pop-up window
          # that typically contains help for the child window.
          #WS_EX_CONTEXTHELP cannot be used with the :MAXIMIZEBOX or :MINIMIZEBOX styles.

          :CONTROLPARENT,    0x00010000, # contains child windows that should take part in dialog box navigation. If this
          # style is specified, the dialog manager recurses into children of this window when performing navigation
          # operations such as handling the TAB key, an arrow key, or a keyboard mnemonic.

          :DLGMODALFRAME,    0x00000001, # has a double border; the window can, optionally, be created with a title bar by
          # specifying the WS_CAPTION style in the dwStyle parameter.

          :LAYERED,          0x00080000, # is a layered window. This style cannot be used if the window has a class style of
          # either CS_OWNDC or CS_CLASSDC.

          :LAYOUTRTL,        0x00400000, # If the shell language is Hebrew, Arabic, or another language that supports
          # reading order alignment, the horizontal origin of the window is on the right edge. Increasing horizontal values
          # advance to the left.

          :LEFT,             0x00000000, #has generic left-aligned properties. This is the default.

          :LEFTSCROLLBAR,    0x00004000, #If the shell language is Hebrew, Arabic, or another language that supports reading
          # order alignment, the vertical scroll bar (if present) is to the left of the client area. For other languages,
          # the style is ignored.

          :LTRREADING,       0x00000000, #text is displayed using left-to-right reading-order properties. This is the
          # default.

          :MDICHILD,         0x00000040, #is a MDI child window.

          :NOACTIVATE,       0x08000000, #A top-level window created with this style does not become the foreground window
          # when the user clicks it. The system does not bring this window to the foreground when the user minimizes or
          # closes the foreground window. To activate the window, use the SetActiveWindow or SetForegroundWindow function.
          # The window does not appear on the taskbar by default. To force the window to appear on the taskbar, use the
          # WS_EX_APPWINDOW style.

          :NOINHERITLAYOUT,  0x00100000, # does not pass its window layout to its child windows.

          :NOPARENTNOTIFY,   0x00000004, # The child window created with this style does not send the WM_PARENTNOTIFY message
          # to its parent window when it is created or destroyed.

          :OVERLAPPEDWINDOW, 0x00000300, # is an overlapped window.

          :PALETTEWINDOW,    0x00000188, # is palette window, which is a modeless dialog box that presents an array of
          # commands.

          :RIGHT,            0x00001000, # has generic "right-aligned" properties. This depends on the window class.
          # This style has an effect only if the shell language is Hebrew, Arabic, or another language that supports
          # reading-order alignment; otherwise, the style is ignored. Using the WS_EX_RIGHT style for static or edit
          # controls has the same effect as using the SS_RIGHT or ES_RIGHT style, respectively. Using this style with
          # button controls has the same effect as using BS_RIGHT and BS_RIGHTBUTTON styles.

          :RIGHTSCROLLBAR,   0x00000000, # The vertical scroll bar (if present) is to the right of the client area. This is
          # the default.

          :RTLREADING,       0x00002000, # If the shell language is Hebrew, Arabic, or another language that supports
          # reading-order alignment, the window text is displayed using right-to-left reading-order properties. For other
          # languages, the style is ignored.

          :STATICEDGE,       0x00020000, # has a three-dimensional border style intended to be used for items that do not
          # accept user input.

          :TOOLWINDOW,       0x00000080, # is intended to be used as a floating toolbar. A tool window has a title bar that
          # is shorter than a normal title bar, and the window title is drawn using a smaller font. A tool window does not
          # appear in the taskbar or in the dialog that appears when the user presses ALT+TAB. If a tool window has a system
          # menu, its icon is not displayed on the title bar. However, you can display the system menu by right-clicking or
          # by typing ALT+SPACE.

          :TOPMOST,          0x00000008, # should be placed above all non-topmost windows and should stay above them, even
          # when the window is deactivated. To add or remove this style, use the SetWindowPos function.

          :TRANSPARENT,      0x00000020, # should not be painted until siblings beneath the window (that were created by the
          # same thread) have been painted. The window appears transparent because the bits of underlying sibling windows
          # have already been painted.
          #To achieve transparency without these restrictions, use the SetWindowRgn function.

          :WINDOWEDGE,       0x00000100  #has a border with a raised edge.
      ]
  end
end