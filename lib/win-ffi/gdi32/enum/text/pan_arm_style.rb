require 'win-ffi/gdi32'

module WinFFI
  module Gdi32
    PanArmStyle = enum :pan_arm_style, [
        :ANY,                        0, # Any
        :NO_FIT,                     1, # No Fit
        :STRAIGHT_ARMS_HORZ,         2, # Straight Arms/Horizontal
        :STRAIGHT_ARMS_WEDGE,        3, # Straight Arms/Wedge
        :STRAIGHT_ARMS_VERT,         4, # Straight Arms/Vertical
        :STRAIGHT_ARMS_SINGLE_SERIF, 5, # Straight Arms/Single-Serif
        :STRAIGHT_ARMS_DOUBLE_SERIF, 6, # Straight Arms/Double-Serif
        :BENT_ARMS_HORZ,             7, # Non-Straight Arms/Horizontal
        :BENT_ARMS_WEDGE,            8, # Non-Straight Arms/Wedge
        :BENT_ARMS_VERT,             9, # Non-Straight Arms/Vertical
        :BENT_ARMS_SINGLE_SERIF,    10, # Non-Straight Arms/Single-Serif
        :BENT_ARMS_DOUBLE_SERIF,    11, # Non-Straight Arms/Double-Serif
    ]
  end
end