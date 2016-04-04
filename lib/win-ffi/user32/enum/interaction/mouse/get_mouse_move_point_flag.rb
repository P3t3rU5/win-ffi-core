module WinFFI
  module User32
    # Values for resolution parameter of GetMouseMovePointsEx
    GetMouseMovePointsFlag = enum :get_mouse_move_point_flag, [
        :USE_DISPLAY_POINTS,         1, # Retrieves the points using the display resolution.
        :USE_HIGH_RESOLUTION_POINTS, 2  # Retrieves high resolution points. Points can range from zero to 65,535
        # (0xFFFF) in both x- and y-coordinates. This is the resolution provided by absolute coordinate pointing devices
        # such as drawing tablets.
    ]
  end
end