require 'win-ffi/user32'

module WinFFI
  module User32
    buffer = [
        :CXSCREEN, 0, # The width of the screen of the primary display monitor in pixels. This is the same value
        # obtained by calling GetDeviceCaps as follows: GetDeviceCaps( hdcPrimaryMonitor, HORZRES).
        :CYSCREEN, 1, # The height of the screen of the primary display monitor, in pixels. This is the same value
        # obtained by calling GetDeviceCaps as follows: GetDeviceCaps( hdcPrimaryMonitor, VERTRES)
        :CXVSCROLL, 2, # The width of a vertical scroll bar, in pixels.
        :CYHSCROLL, 3, # The height of a horizontal scroll bar, in pixels.
        :CYCAPTION, 4, # The height of a caption area, in pixels.
        :CXBORDER, 5, # The width of a window_class border, in pixels. This is equivalent to  the :CXEDGE value for
        # windows with the 3-D look.
        :CYBORDER, 6, #The height of a window_class border, in pixels. This is equivalent to the :CYEDGE value for windows
        # with the 3-D look.
        :CXDLGFRAME, 7, # This value is the same as :CXFIXEDFRAME.
        :CXFIXEDFRAME, 7, # The thickness of the frame around the perimeter of a window_class that has a caption but is
        # not sizable, in pixels. :CXFIXEDFRAME is the height of the horizontal border, and :CYFIXEDFRAME is the
        # width of the vertical border. This value is the same as :CXDLGFRAME.
        :CYDLGFRAME, 8, # This value is the same as :CYFIXEDFRAME.
        :CYFIXEDFRAME, 8, # The thickness of the frame around the perimeter of a window_class that has a caption but is
        # not sizable, in pixels. :CXFIXEDFRAME is the height of the horizontal border, and :CYFIXEDFRAME is the
        # width of the vertical border. This value is the same as :CYDLGFRAME.
        :CYVTHUMB, 9, # The height of the thumb box in a vertical scroll bar, in pixels.
        :CXHTHUMB, 10, # The width of the thumb box in a horizontal scroll bar,
        # in pixels.
        :CXICON, 11, # The default width of an icon, in pixels. The LoadIcon
        # function can load only icons with the dimensions that :CXICON and
        # :CYICON specifies.
        :CYICON, 12, # The default height of an icon, in pixels. The LoadIconfunction can load only icons with the
        # dimensions :CXICON and :CYICON
        :CXCURSOR, 13, # The width of a cursor, in pixels. The system cannot create cursors of other sizes.
        :CYCURSOR, 14, # The height of a cursor, in pixels. The system cannot create cursors of other sizes.
        :CYMENU, 15, # The height of a single-line menu bar, in pixels.
        :CXFULLSCREEN, 16, # The width of the client area for a full-screen window_class on the primary display monitor,
        # in pixels. To get the coordinates of the portion of the screen that is not obscured by the system taskbar
        # or by application desktop toolbars, call the SystemParametersInfo function with the SPI_GETWORKAREA value.
        :CYFULLSCREEN, 17, # The height of the client area for a full-screen window_class on the primary display monitor,
        # in pixels. To get the coordinates of the portion of the screen not obscured by the system taskbar or by
        # application desktop toolbars, call the SystemParametersInfo function with the SPI_GETWORKAREA value.
        :CYKANJIWINDOW, 18, # For double byte character set versions of the system, this is the height of the Kanji
        # window_class at the bottom of the screen, in pixels.
        :MOUSEPRESENT, 19, # Nonzero if a mouse is installed; otherwise, 0. This value is rarely zero, because of
        # support for virtual mice and because some systems detect the presence of the port instead of the presence
        # of a mouse.
        :CYVSCROLL, 20, # The height of the arrow bitmap on a vertical scroll bar, in pixels.
        :CXHSCROLL, 21, # The width of the arrow bitmap on a horizontal scroll bar, in pixels.
        :DEBUG, 22, # Nonzero if the debug version of User.exe is installed; otherwise, 0.
        :SWAPBUTTON, 23, # Nonzero if the meanings of the left and right mouse buttons are swapped; otherwise, 0.
        :RESERVED1, 24,
        :RESERVED2, 25,
        :RESERVED3, 26,
        :RESERVED4, 27,
        :CXMIN, 28, # The minimum width of a window_class, in pixels.
        :CYMIN, 29, # The minimum height of a window_class, in pixels.
        :CXSIZE, 30, # The width of a button in a window_class caption or title bar, in pixels
        :CYSIZE, 31, # The height of a button in a window_class caption or title bar, in pixels.
        :CXFRAME, 32, # This value is the same as :CXSIZEFRAME.
        :CXSIZEFRAME, 32, # The thickness of the sizing border around the perimeter of a window_class that can be resized,
        # in pixels. :CXSIZEFRAME is the width of the horizontal border, and :CYSIZEFRAME is the height of the
        # vertical border. This value is the same as :CXFRAME.
        :CYFRAME, 33, # This value is the same as :CYSIZEFRAME.
        :CYSIZEFRAME, 33, # The thickness of the sizing border around the perimeter of a window_class that can be resized,
        # in pixels. :CXSIZEFRAME is the width of the horizontal border, and :CYSIZEFRAME is the# height of the
        # vertical border. This value is the same as :CYFRAME.
        :CXMINTRACK, 34, # The minimum tracking width of a window_class, in pixels. The user cannot drag the window_class frame
        # to a size smaller than these dimensions. A window_class  can override this value by processing the
        # WM_GETMINMAXINFO message.
        :CYMINTRACK, 35, # The minimum tracking height of a window_class, in pixels. The user cannot drag the window_class frame
        # to a size smaller than these dimensions. A window_class can override this value by processing the
        # WM_GETMINMAXINFO message.
        :CXDOUBLECLK, 36, # The width of the rectangle around the location of a first  click in a double-click
        # sequence, in pixels. The second click must occur within the rectangle that is defined by :CXDOUBLECLK and
        # :CYDOUBLECLK for the system to consider the two clicks a double-click. The two clicks must also occur
        # within a specified time. To set the width of the double-click rectangle, call SystemParametersInfo with
        # :SETDOUBLECLKWIDTH.
        :CYDOUBLECLK, 37, # The height of the rectangle around the location of a first click in a double-click
        # sequence, in pixels. The second click must occur within the rectangle defined by :CXDOUBLECLK and
        # :CYDOUBLECLK for the system to consider the two clicks a double-click. The two clicks must also occur
        #  within a specified time. To set the height of the double-click rectangle, call SystemParametersInfo with
        # SPI_SETDOUBLECLKHEIGHT.
        :CXICONSPACING, 38, # The width of a grid cell for items in large icon view, in pixels. Each item fits into
        # a rectangle of size :CXICONSPACING by :CYICONSPACING when arranged. This value is always greater than or
        # equal to :CXICON.
        :CYICONSPACING, 39, # The height of a grid cell for items in large icon view, in pixels. Each item fits into
        # a rectangle of size :CXICONSPACING by :CYICONSPACING when arranged. This value is always greater than or
        # equal to :CYICON.
        :MENUDROPALIGNMENT, 40, # Nonzero if drop-down menus are right-aligned with the corresponding menu-bar item;
        # 0 if the menus are left-aligned.
        :PENWINDOWS, 41, # Nonzero if the Microsoft Windows for Pen computing extensions are installed; zero otherwise.
        :DBCSENABLED, 42, # Nonzero if User32.dll supports DBCS; otherwise, 0.
        :CMOUSEBUTTONS, 43, # The number of buttons on a mouse, or zero if no
        # mouse is installed.
        :SECURE, 44, # This system metric should be ignored; it always returns 0.
        :CXEDGE, 45, # The width of a 3-D border, in pixels. This metric is the 3-D counterpart of :CXBORDER.
        :CYEDGE, 46, # The height of a 3-D border, in pixels. This is the 3-D counterpart of :CYBORDER.
        :CXMINSPACING, 47, # The width of a grid cell for a minimized window_class, in pixels. Each minimized window_class fits
        # into a rectangle this size when arranged. This # value is always greater than or equal to :CXMINIMIZED.
        :CYMINSPACING, 48, # The height of a grid cell for a minimized window_class, in pixels.Each minimized window_class fits
        # into a rectangle this size when arranged. This value is always greater than or equal to :CYMINIMIZED.
        :CXSMICON, 49, # The recommended width of a small icon, in pixels. Small icons typically appear in window_class
        # captions and in small icon view.
        :CYSMICON, 50, # The recommended height of a small icon, in pixels. Small icons typically appear in window_class
        # captions and in small icon view.
        :CYSMCAPTION, 51, # The height of a small caption, in pixels.
        :CXSMSIZE, 52, # The width of small caption buttons, in pixels.
        :CYSMSIZE, 53, # The height of small caption buttons, in pixels.
        :CXMENUSIZE, 54, # The width of menu bar buttons, such as the child window_class close button that is used in the
        # multiple document interface, in pixels.
        :CYMENUSIZE, 55, # The height of menu bar buttons, such as the child window_class close button that is used in the
        # multiple document interface, in pixels.
        :ARRANGE, 56, # The flags that specify how the system arranged minimized windows.
        :CXMINIMIZED, 57, # The width of a minimized window_class, in pixels.
        :CYMINIMIZED, 58, # The height of a minimized window_class, in pixels.
        :CXMAXTRACK, 59, # The default maximum width of a window_class that has a
        # caption and  sizing borders, in pixels. This metric refers to the
        # entire desktop. The user cannot drag the window_class frame to a size
        # larger than these dimensions. A window_class can override this value by
        # processing the WM_GETMINMAXINFO message.
        :CYMAXTRACK, 60, # The default maximum height of a window_class that has a caption and sizing borders, in pixels.
        # This metric refers to the entire desktop. The user cannot drag the window_class frame to a size larger than
        # these dimensions. A window_class can override this value by# processing the WM_GETMINMAXINFO message.
        :CXMAXIMIZED, 61, # The default width, in pixels, of a maximized top-level window_class, on the primary display
        # monitor.
        :CYMAXIMIZED, 62, # The default height, in pixels, of a maximized top-level window_class on the primary display
        # monitor.
        :NETWORK, 63, # The least significant bit is set if a network is present; otherwise, it is cleared. The
        # other bits are reserved for future use.

        :CLEANBOOT, 67,
        # The value that specifies how the system is started:
        # 0 Normal boot
        # 1 Fail-safe boot
        # 2 Fail-safe with network boot
        # A fail-safe boot (also called SafeBoot, Safe Mode, or Clean Boot)
        # bypasses the user startup files.
        :CXDRAG, 68, # The number of pixels on either side of a mouse-down point that the mouse pointer can move
        # before a drag operation begins This allows the user to click and release the mouse button easily without
        # unintentionally starting a drag operation. If this value is negative, it is subtracted from the left of
        # the mouse-down point and added to the right of it.
        :CYDRAG, 69, # The number of pixels above and below a mouse-down point that the mouse pointer can move
        # before a drag operation begins. This allows the user to click and release the mouse button easily without
        # unintentionally starting a drag operation. If this value is negative, it is subtracted from above the
        # mouse-down point and added below it.
        :SHOWSOUNDS, 70, # Nonzero if the user requires an application to present information visually in situations
        # where it would otherwise present the information only in audible form; otherwise, 0.
        :CXMENUCHECK, 71, # The width of the default menu check-mark bitmap, in pixels.
        :CYMENUCHECK, 72, # The height of the default menu check-mark bitmap, in pixels.
        :SLOWMACHINE, 73, # Nonzero if the computer has a low-end (slow) processor; otherwise, 0.
        :MIDEASTENABLED, 74, # Nonzero if the system is enabled for Hebrew and Arabic languages, 0 if not.

        :MOUSEWHEELPRESENT, 75, # Nonzero if a mouse with a vertical scroll wheel is installed; otherwise 0.
        :XVIRTUALSCREEN, 76, # The coordinates for the left side of the virtual screen. The virtual screen is the
        # bounding rectangle of all display monitors. The :CXVIRTUALSCREEN metric is the width of the virtual screen
        :YVIRTUALSCREEN, 77, # The coordinates for the top of the virtual screen. The virtual screen is the bounding
        # rectangle of all display monitors. The :CYVIRTUALSCREEN metric is the height of the virtual screen.
        :CXVIRTUALSCREEN, 78, # The width of the virtual screen, in pixels.
        # The virtual screen is the bounding rectangle of all display monitors
        # The :XVIRTUALSCREEN metric is the coordinates for the left side of
        # the virtual screen.
        :CYVIRTUALSCREEN, 79, # The height of the virtual screen, in pixels.
        # The virtual screen is the bounding rectangle of all display monitors.
        # The :YVIRTUALSCREEN metric is the coordinates for the top of the virtual screen.
        :CMONITORS, 80, # The number of display monitors on a desktop.
        :SAMEDISPLAYFORMAT, 81, # Nonzero if all the display monitors have the same color format, otherwise, 0.
        # Two displays can have the same bit depth, but different color formats. For example, the red, green, and
        # blue pixels can be encoded with different numbers of bits, or those bits can be located in different
        # places in a pixel color value.
        :IMMENABLED, 82, # Nonzero if Input Method Manager/Input Method Editor features are enabled; otherwise, 0.
        # :IMMENABLED indicates whether the system is ready to use a Unicode-based IME on a Unicode application.
        # To ensure that a language-dependent IME works, check :DBCSENABLED and the system ANSI code page.
        # Otherwise the ANSI-to-Unicode conversion may not be performed correctly, or some components like fonts or
        # registry settings may not be present.

        :REMOTESESSION, 0x1000, # This system metric is used in a Terminal Services environment. If the calling process
        # is associated with a Terminal Services client session, the return value is nonzero. If the calling process is
        # associated with the Terminal Services console session, the return value is 0.
        # Windows Server 2003 and Windows XP:  The console session is not necessarily the physical console. For more
        # information, see WTSGetActiveConsoleSessionId.
    ]

    if WindowsVersion >= :xp
      buffer += [
          :CXFOCUSBORDER, 83, # The width of the left and right edges of the focus rectangle that the DrawFocusRect
          # draws. This value is in pixels.
          :CYFOCUSBORDER, 84, # The height of the top and bottom edges of the focus rectangle drawn by
          # DrawFocusRect. This value is in pixels.
          :TABLETPC, 86, # Nonzero if the current operating system is the Windows XP Tablet PC edition or if the
          # current operating system is Windows Vista or Windows 7 and the Tablet PC Input service is started;
          # otherwise, 0. The :DIGITIZER setting indicates the type of digitizer input supported by a device running
          # Windows 7 or Windows Server 2008 R2. For more information, see Remarks.
          :MEDIACENTER, 87, # Nonzero if the current operating system is the Windows XP, Media Center Edition, 0 if not.
          :STARTER, 88, # Nonzero if the current operating system is Windows 7 Starter Edition, Windows Vista Starter,
          # or Windows XP Starter Edition; otherwise, 0.
          :SERVERR2, 89, # The build number if the system is Windows Server 2003R2; otherwise, 0.
          :SHUTTINGDOWN, 0x2000, # Nonzero if the current session is shutting down; otherwise, 0.
          :REMOTECONTROL, 0x2001, # This system metric is used in a Terminal Services environment to determine if the
          # current Terminal Server session is being remotely controlled. Its value is nonzero if the current session is
          # remotely controlled; otherwise, 0. You can use terminal services management tools such as Terminal Services
          # Manager (tsadmin.msc) and shadow.exe to control a remote session. When a session is being remotely
          # controlled, another user can view the contents of that session and potentially interact with it.
          :CARETBLINKINGENABLED, 0x2002
      ]
      if WindowsVersion >= :vista
        buffer += [
            :MOUSEHORIZONTALWHEELPRESENT, 91, # Nonzero if a mouse with a
            # horizontal scroll wheel is installed; otherwise 0.
            :CXPADDEDBORDER, 92, # The amount of border padding for captioned windows, in pixels.
        ]
        if WindowsVersion >= 7
          buffer += [
              :DIGITIZER, 94, # Nonzero if the current operating system is Windows 7 or Windows Server 2008 R2 and the
              # Tablet PC Input service is started; otherwise, 0. The return value is a bitmask that specifies the type
              # of digitizer input supported by the device.
              :MAXIMUMTOUCHES, 95, # Nonzero if there are digitizers in the system;# otherwise, 0. :MAXIMUMTOUCHES
              # returns the aggregate maximum of the maximum number of contacts supported by every digitizer in the
              # system. If the system has only single-touch digitizers, the return value is 1. If the system has
              # multi-touch digitizers, the returnvalue is the number of simultaneous contacts the hardware can provide.
              :CMETRICS, 97
          ]
          if WindowsVersion >= 8
            buffer += [
                :CONVERTIBLESLATEMODE, 0x2003, # Reflects the state of the laptop or slate mode, 0 for Slate Mode and
                # non-zero otherwise. When this system metric changes, the system sends a broadcast message via
                # WM_SETTINGCHANGE with "ConvertibleSlateMode" in the LPARAM.
                :SYSTEMDOCKED, 0x2004, # Reflects the state of the docking mode, 0 for Undocked Mode and non-zero
                # otherwise. When this system metric changes, the system sends a broadcast message via WM_SETTINGCHANGE
                # with "SystemDockMode" in the LPARAM.
            ]
          end
        else
          buffer += [:CMETRICS, 93]
        end
      else

      end
    else
      buffer += [:CMETRICS, 83]
    end

    SystemMetricsFlags = enum :system_metrics, buffer
  end
end