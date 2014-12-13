module WinFFI
  module User32
    module Window
      SystemMetricsFlags = enum :system_metrics, [
          :ARRANGE, 56, # The flags that specify how the system arranged
          # minimized windows For more information, see the Remarks section in this topic.
          :CLEANBOOT, 67,
          # The value that specifies how the system is started:
          # 0 Normal boot
          # 1 Fail-safe boot
          # 2 Fail-safe with network boot
          # A fail-safe boot (also called SafeBoot, Safe Mode, or Clean Boot)
          # bypasses the user startup files.
          :CMONITORS, 80, # The number of display monitors on a desktop. For
          # more information, see the Remarks section in this topic.
          :CMOUSEBUTTONS, 43, # The number of buttons on a mouse, or zero if no
          # mouse is installed.
          :CONVERTIBLESLATEMODE, 0x2003, # Reflects the state of the laptop or
          # slate mode, 0 for Slate Mode and non-zero otherwise. When this
          # system metric changes, the system sends a broadcast message via
          # WM_SETTINGCHANGE with "ConvertibleSlateMode" in the LPARAM.
          :CXBORDER, 5, # The width of a window border, in pixels. This is
          # equivalent to  the :CXEDGE value for windows with the 3-D look.
          :CXCURSOR, 13, # The width of a cursor, in pixels. The system cannot
          # create cursors of other sizes.
          :CXDLGFRAME, 7, # This value is the same as :CXFIXEDFRAME.
          :CXDOUBLECLK, 36, # The width of the rectangle around the location of
          # a first  click in a double-click sequence, in pixels. The second
          # click must occur within the rectangle that is defined by
          # :CXDOUBLECLK and :CYDOUBLECLK for the system to consider the two
          # clicks a double-click. The two clicks must also occur within a
          # specified time. To set the width of the double-click rectangle, call
          # SystemParametersInfo with SPI_SETDOUBLECLKWIDTH.
          :CXDRAG, 68, # The number of pixels on either side of a mouse-down
          # point that the mouse pointer can move before a drag operation begins
          # This allows the user to click and release the mouse button easily
          # without unintentionally starting a drag operation. If this value is
          # negative, it is subtracted from the left of the mouse-down point and
          # added to the right of it.
          :CXEDGE, 45, # The width of a 3-D border, in pixels. This metric is
          # the 3-D counterpart of :CXBORDER.
          :CXFIXEDFRAME, 7, # The thickness of the frame around the perimeter of
          # a window that has a caption but is not sizable, in pixels.
          # :CXFIXEDFRAME is the height of the horizontal border, and
          # :CYFIXEDFRAME is the width of the vertical border. This value is the
          # same as :CXDLGFRAME.
          :CXFOCUSBORDER, 83, # The width of the left and right edges of the
          # focus rectangle that the DrawFocusRect draws. This value is in pixels.
          # Windows 2000:  This value is not supported.
          :CXFRAME, 32, # This value is the same as :CXSIZEFRAME.
          :CXFULLSCREEN, 16, # The width of the client area for a full-screen
          # window on the primary display monitor, in pixels. To get the
          # coordinates of the portion of the screen that is not obscured by the
          # system taskbar or by application desktop toolbars, call the
          # SystemParametersInfo function with the SPI_GETWORKAREA value.
          :CXHSCROLL, 21, # The width of the arrow bitmap on a horizontal scroll
          # bar, in pixels.
          :CXHTHUMB, 10, # The width of the thumb box in a horizontal scroll bar,
          # in pixels.
          :CXICON, 11, # The default width of an icon, in pixels. The LoadIcon
          # function can load only icons with the dimensions that :CXICON and
          # :CYICON specifies.
          :CXICONSPACING, 38, # The width of a grid cell for items in large icon
          # view, in pixels. Each item fits into a rectangle of size
          # :CXICONSPACING by :CYICONSPACING when arranged. This value is always
          # greater than or equal to :CXICON.
          :CXMAXIMIZED, 61, # The default width, in pixels, of a maximized
          # top-level window, on the primary display monitor.
          :CXMAXTRACK, 59, # The default maximum width of a window that has a
          # caption and  sizing borders, in pixels. This metric refers to the
          # entire desktop. The user cannot drag the window frame to a size
          # larger than these dimensions. A window can override this value by
          # processing the WM_GETMINMAXINFO message.
          :CXMENUCHECK, 71, # The width of the default menu check-mark bitmap,
          # in pixels.
          :CXMENUSIZE, 54, # The width of menu bar buttons, such as the child
          # window close button that is used in the multiple document interface,
          # in pixels.
          :CXMIN, 28, # The minimum width of a window, in pixels.
          :CXMINIMIZED, 57, # The width of a minimized window, in pixels.
          :CXMINSPACING, 47, # The width of a grid cell for a minimized window,
          # in pixels. Each minimized window fits into a rectangle this size
          # when arranged. This # value is always greater than or equal to
          # :CXMINIMIZED.
          :CXMINTRACK, 34, # The minimum tracking width of a window, in pixels.
          # The user cannot drag the window frame to a size smaller than these
          # dimensions. A window  can override this value by processing the
          # WM_GETMINMAXINFO message.
          :CXPADDEDBORDER, 92, # The amount of border padding for captioned
          # windows, in pixels.
          # Windows XP/2000:  This value is not supported.
          :CXSCREEN, 0, # The width of the screen of the primary display monitor,
          # in pixels. This is the same value obtained by calling GetDeviceCaps
          # as follows: GetDeviceCaps( hdcPrimaryMonitor, HORZRES).
          :CXSIZE, 30, # The width of a button in a window caption or title bar,
          # in pixels
          :CXSIZEFRAME, 32, # The thickness of the sizing border around the
          # perimeter of a  window that can be resized, in pixels. :CXSIZEFRAME
          # is the width of the horizontal border, and :CYSIZEFRAME is the
          # height of the vertical border. This value is the same as :CXFRAME.
          :CXSMICON, 49, # The recommended width of a small icon, in pixels.
          # Small icons typically appear in window captions and in small icon view.
          :CXSMSIZE, 52, # The width of small caption buttons, in pixels.
          :CXVIRTUALSCREEN, 78, # The width of the virtual screen, in pixels.
          # The virtual screen is the bounding rectangle of all display monitors
          # The :XVIRTUALSCREEN metric is the coordinates for the left side of
          # the virtual screen.
          :CXVSCROLL, 2, # The width of a vertical scroll bar, in pixels.
          :CYBORDER, 6, #The height of a window border, in pixels. This is
          # equivalent to the :CYEDGE value for windows with the 3-D look.
          :CYCAPTION, 4, # The height of a caption area, in pixels.
          :CYCURSOR, 14, # The height of a cursor, in pixels. The system cannot
          # create cursors of other sizes.
          :CYDLGFRAME, 8, # This value is the same as :CYFIXEDFRAME.
          :CYDOUBLECLK, 37, # The height of the rectangle around the location of
          # a first click in a double-click sequence, in pixels. The second click
          # must occur within the rectangle defined by :CXDOUBLECLK and
          # :CYDOUBLECLK for the system to consider the two clicks a
          # double-click. The two clicks must also occur  within a specified
          # time. To set the height of the double-click rectangle,
          # call SystemParametersInfo with SPI_SETDOUBLECLKHEIGHT.
          :CYDRAG, 69, # The number of pixels above and below a mouse-down point
          # that the mouse pointer can move before a drag operation begins. This
          # allows the user to click and release the mouse button easily without
          # unintentionally starting a drag operation. If this value is negative,
          # it is subtracted from above the mouse-down point and added below it.
          :CYEDGE, 46, # The height of a 3-D border, in pixels. This is the 3-D
          # counterpart of :CYBORDER.
          :CYFIXEDFRAME, 8, # The thickness of the frame around the perimeter of
          # a window that has a caption but is not sizable, in pixels.
          # :CXFIXEDFRAME is the height of the horizontal border, and
          # :CYFIXEDFRAME is the width of the vertical border. This value is the
          # same as :CYDLGFRAME.
          :CYFOCUSBORDER, 84, # The height of the top and bottom edges of the
          # focus rectangle drawn by DrawFocusRect. This value is in pixels.
          # Windows 2000:  This value is not supported.
          :CYFRAME, 33, # This value is the same as :CYSIZEFRAME.
          :CYFULLSCREEN, 17, # The height of the client area for a full-screen
          # window on the primary display monitor, in pixels. To get the
          # coordinates of the portion of the screen not obscured by the system
          # taskbar or by application desktop toolbars, call the
          # SystemParametersInfo function with the SPI_GETWORKAREA value.
          :CYHSCROLL, 3, # The height of a horizontal scroll bar, in pixels.
          :CYICON, 12, # The default height of an icon, in pixels. The LoadIcon
          # function can load only icons with the dimensions :CXICON and :CYICON
          :CYICONSPACING, 39, # The height of a grid cell for items in large
          # icon view, in pixels. Each item fits into a rectangle of size
          # :CXICONSPACING by :CYICONSPACING when arranged. This value is always
          # greater than or equal to :CYICON.
          :CYKANJIWINDOW, 18, # For double byte character set versions of the
          # system, this is the height of the Kanji window at the bottom of the
          # screen, in pixels.
          :CYMAXIMIZED, 62, # The default height, in pixels, of a maximized
          # top-level window on the primary display monitor.
          :CYMAXTRACK, 60, # The default maximum height of a window that has a
          # caption and sizing borders, in pixels. This metric refers to the
          # entire desktop. The user cannot drag the window frame to a size
          # larger than these dimensions. A window can override this value by
          # processing the WM_GETMINMAXINFO message.
          :CYMENU, 15, # The height of a single-line menu bar, in pixels.
          :CYMENUCHECK, 72, # The height of the default menu check-mark bitmap,
          # in pixels.
          :CYMENUSIZE, 55, # The height of menu bar buttons, such as the child
          # window close button that is used in the multiple document interface,
          # in pixels.
          :CYMIN, 29, # The minimum height of a window, in pixels.
          :CYMINIMIZED, 58, # The height of a minimized window, in pixels.
          :CYMINSPACING, 48, # The height of a grid cell for a minimized window,
          # in pixels.Each minimized window fits into a rectangle this size
          # when arranged. This value is always greater than or equal to
          # :CYMINIMIZED.
          :CYMINTRACK, 35, # The minimum tracking height of a window, in pixels.
          # The user cannot drag the window frame to a size smaller than these
          # dimensions. A window can override this value by processing the
          # WM_GETMINMAXINFO message.
          :CYSCREEN, 1, # The height of the screen of the primary display
          # monitor, in pixels. This is the same value obtained by calling
          # GetDeviceCaps as follows: GetDeviceCaps( hdcPrimaryMonitor, VERTRES)
          :CYSIZE, 31, # The height of a button in a window caption or title
          # bar, in pixels.
          :CYSIZEFRAME, 33, # The thickness of the sizing border around the
          # perimeter of a window that can be resized, in pixels. :CXSIZEFRAME
          # is the width of the horizontal border, and :CYSIZEFRAME is the
          # height of the vertical border. This value is the same as :CYFRAME.
          :CYSMCAPTION, 51, # The height of a small caption, in pixels.
          :CYSMICON, 50, # The recommended height of a small icon, in pixels.
          # Small icons typically appear in window captions and in small icon view.
          :CYSMSIZE, 53, # The height of small caption buttons, in pixels.
          :CYVIRTUALSCREEN, 79, # The height of the virtual screen, in pixels.
          # The virtual screen is the bounding rectangle of all display monitors.
          # The :YVIRTUALSCREEN metric is the coordinates for the top of the virtual screen.
          :CYVSCROLL, 20, # The height of the arrow bitmap on a vertical scroll
          # bar, in pixels.
          :CYVTHUMB, 9, # The height of the thumb box in a vertical scroll bar,
          # in pixels.
          :DBCSENABLED, 42, # Nonzero if User32.dll supports DBCS; otherwise, 0.
          :DEBUG, 22, # Nonzero if the debug version of User.exe is installed;
          # otherwise, 0.
          :DIGITIZER, 94, # Nonzero if the current operating system is Windows 7
          # or Windows Server 2008 R2 and the Tablet PC Input service is started;
          # otherwise, 0. The return value is a bitmask that specifies the type
          # of digitizer input supported by the device. For more information,
          # see Remarks.
          # Windows Server 2008, Windows Vista, and Windows XP/2000:  This value
          # is not supported.
          :IMMENABLED, 82, # Nonzero if Input Method Manager/Input Method Editor
          # features are enabled; otherwise, 0. :IMMENABLED indicates whether
          # the system is ready to use a Unicode-based IME on a Unicode
          # application. To ensure that a language-dependent IME works, check
          # :DBCSENABLED and the system ANSI code page. Otherwise the
          # ANSI-to-Unicode conversion may not be performed correctly, or some
          # components like fonts or registry settings may not be present.
          :MAXIMUMTOUCHES, 95, # Nonzero if there are digitizers in the system;
          # otherwise, 0. :MAXIMUMTOUCHES returns the aggregate maximum of the
          # maximum number of contacts supported by every digitizer in the
          # system. If the system has only single-touch digitizers, the return
          # value is 1. If the system has multi-touch digitizers, the return
          # value is the number of simultaneous contacts the hardware can provide.
          # Windows Server 2008, Windows Vista, and Windows XP/2000:  This value
          # is not supported.
          :MEDIACENTER, 87, # Nonzero if the current operating system is the
          # Windows XP, Media Center Edition, 0 if not.
          :MENUDROPALIGNMENT, 40, # Nonzero if drop-down menus are right-aligned
          # with the corresponding menu-bar item; 0 if the menus are left-aligned.
          :MIDEASTENABLED, 74, # Nonzero if the system is enabled for Hebrew and
          # Arabic languages, 0 if not.
          :MOUSEPRESENT, 19, # Nonzero if a mouse is installed; otherwise, 0.
          # This value is rarely zero, because of support for virtual mice and
          # because some systems detect the presence of the port instead of the
          # presence of a mouse.
          :MOUSEHORIZONTALWHEELPRESENT, 91, # Nonzero if a mouse with a
          # horizontal scroll wheel is installed; otherwise 0.
          :MOUSEWHEELPRESENT, 75, # Nonzero if a mouse with a vertical scroll
          # wheel is installed; otherwise 0.
          :NETWORK, 63, # The least significant bit is set if a network is
          # present; otherwise, it is cleared. The other bits are reserved for
          # future use.
          :PENWINDOWS, 41, # Nonzero if the Microsoft Windows for Pen computing
          # extensions are installed; zero otherwise.
          :REMOTECONTROL, 0x2001, # This system metric is used in a Terminal
          # Services environment to determine if the current Terminal Server
          # session is being remotely controlled. Its value is nonzero if the
          # current session is remotely controlled; otherwise, 0.
          # You can use terminal services management tools such as Terminal
          # Services Manager (tsadmin.msc) and shadow.exe to control a remote
          # session. When a session is being remotely controlled, another user
          # can view the contents of that session and potentially interact with
          # it.
          :REMOTESESSION, 0x1000, # This system metric is used in a Terminal
          # Services environment. If the calling process is associated with a
          # Terminal Services client session, the return value is nonzero. If
          # the calling process is associated with the Terminal Services console
          # session, the return value is 0.
          # Windows Server 2003 and Windows XP:  The console session is not
          # necessarily the physical console. For more information, see
          # WTSGetActiveConsoleSessionId.
          :SAMEDISPLAYFORMAT, 81, # Nonzero if all the display monitors have the
          # same color format, otherwise, 0. Two displays can have the same bit
          # depth, but different color formats. For example, the red, green, and
          # blue pixels can be encoded with different numbers of bits, or those
          # bits can be located in different places in a pixel color value.
          :SECURE, 44, # This system metric should be ignored; it always returns
          # 0.
          :SERVERR2, 89, # The build number if the system is Windows Server 2003
          # R2; otherwise, 0.
          :SHOWSOUNDS, 70, # Nonzero if the user requires an application to
          # present information visually in situations where it would otherwise
          # present the information only in audible form; otherwise, 0.
          :SHUTTINGDOWN, 0x2000, # Nonzero if the current session is shutting
          # down; otherwise, 0. Windows 2000:  This value is not supported.
          :SLOWMACHINE, 73, # Nonzero if the computer has a low-end (slow)
          # processor; otherwise, 0.
          :STARTER, 88, # Nonzero if the current operating system is Windows 7
          # Starter Edition, Windows Vista Starter, or Windows XP Starter
          # Edition; otherwise, 0.
          :SWAPBUTTON, 23, # Nonzero if the meanings of the left and right mouse
          # buttons are swapped; otherwise, 0.
          :SYSTEMDOCKED, 0x2004, # Reflects the state of the docking mode, 0 for
          # Undocked Mode and non-zero otherwise. When this system metric
          # changes, the system sends a broadcast message via WM_SETTINGCHANGE
          # with "SystemDockMode" in the LPARAM.
          :TABLETPC, 86, # Nonzero if the current operating system is the
          # Windows XP Tablet PC edition or if the current operating system is
          # Windows Vista or Windows 7 and the Tablet PC Input service is
          # started; otherwise, 0. The :DIGITIZER setting indicates the type of
          # digitizer input supported by a device running Windows 7 or Windows
          # Server 2008 R2. For more information, see Remarks.
          :XVIRTUALSCREEN, 76, # The coordinates for the left side of the
          # virtual screen. The virtual screen is the bounding rectangle of all
          # display monitors. The :CXVIRTUALSCREEN metric is the width of the
          # virtual screen.
          :YVIRTUALSCREEN, 77, # The coordinates for the top of the virtual
          # screen. The virtual screen is the bounding rectangle of all display
          # monitors. The :CYVIRTUALSCREEN metric is the height of the virtual
          # screen.
      ]
    end
  end
end