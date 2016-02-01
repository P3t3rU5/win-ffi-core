require 'win-ffi/user32'

module WinFFI
  module User32
    # Flags for TrackPopupMenu
    buffer =  [
        # Use one of the following flags to specify which mouse button the shortcut menu tracks.
        :LEFTBUTTON,  0x0000, # The user can select menu items with only the left mouse button.
        :RIGHTBUTTON, 0x0002, # The user can select menu items with both the left and right mouse buttons.

        # Use one of the following flags to specify how the function positions the pop-up window_class horizontally.
        :LEFTALIGN,   0x0000, # Positions the pop-up window_class so that its left edge is aligned with the coordinate
        # specified by the anchorPoint->x parameter.
        :CENTERALIGN, 0x0004, # Centers pop-up window_class horizontally relative to the coordinate specified by the
        # anchorPoint->x parameter.
        :RIGHTALIGN,  0x0008, # Positions the pop-up window_class so that its right edge is aligned with the coordinate
        # specified by the anchorPoint->x parameter.

        # Use one of the following flags to specify how the function positions the pop-up window_class vertically.
        :TOPALIGN,     0x0000, #Positions the pop-up window_class so that its left edge is aligned with the coordinate
        # specified by the anchorPoint->y parameter.
        :VCENTERALIGN, 0x0010, #Centers the pop-up window_class vertically relative to the coordinate specified by the
        # anchorPoint->y parameter.
        :BOTTOMALIGN,  0x0020, # Positions the pop-up window_class so that its bottom edge is aligned with the coordinate
        # specified by the anchorPoint->y parameter.

        #Use one of the following flags to specify whether to accommodate horizontal or vertical alignment.
        :HORIZONTAL, 0x0000, # If the menu cannot be shown at the specified location without overlapping the excluded
        # rectangle, the system tries to accommodate the requested horizontal alignment before the requested vertical
        # alignment.
        :VERTICAL, 0x0040, # If the menu cannot be shown at the specified location without overlapping the excluded
        # rectangle, the system tries to accommodate the requested vertical alignment before the requested horizontal
        # alignment.

        # Use the following flags to control discovery of the user selection without having to set up a parent window_class
        # for the menu.
        :NONOTIFY,  0x0080, # The function does not send notification messages when the user clicks a menu item.
        :RETURNCMD, 0x0100, # The function returns the menu item identifier of the user's selection in the return value.

        # Use any reasonable combination of the following flags to modify the animation of a menu. For example, by
        # selecting a horizontal and a vertical flag, you can achieve diagonal animation.
        :RECURSE,         0x0001,
        :HORPOSANIMATION, 0x0400, # Animates the menu from left to right.
        :HORNEGANIMATION, 0x0800, # Animates the menu from right to left.
        :VERPOSANIMATION, 0x1000, # Animates the menu from top to bottom.
        :VERNEGANIMATION, 0x2000, # Animates the menu from bottom to top.
        :NOANIMATION,     0x4000, # Displays menu without animation.
        # For any animation to occur, the SystemParametersInfo function must set SPI_SETMENUANIMATION. Also, all
        # the :*ANIMATION flags, except :NOANIMATION, are ignored if menu fade animation is on. For more information,
        # see the SPI_GETMENUFADE flag in SystemParametersInfo.
        # Use the :RECURSE flag to display a menu when another menu is already displayed. This is intended to support
        # context menus within a menu.


    ]

    if WindowsVersion >= :xp
      buffer += [:LAYOUTRTL, 0x8000]
      if WindowsVersion >= 7
        buffer += [
            # The following flag is available starting with Windows 7.
            :WORKAREA, 0x10000, # Restricts the pop-up window_class to within the work area. If this flag is not set, the pop-up
            # window_class is restricted to the work area only if the input point is within the work area. For more information,
            # see the rcWork and rcMonitor members of the MONITORINFO structure.
        ]
      end
    end

    TrackPopupMenuFlags = enum :track_popup_menu_flags, buffer
  end
end