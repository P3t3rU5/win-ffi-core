require 'win-ffi/gdi32'

module WinFFI
  module Gdi32
    PanXHeight = enum :pan_x_height, [
        :ANY,            0, # Any
        :NO_FIT,         1, # No Fit
        :CONSTANT_SMALL, 2, # Constant/Small
        :CONSTANT_STD,   3, # Constant/Standard
        :CONSTANT_LARGE, 4, # Constant/Large
        :DUCKING_SMALL,  5, # Ducking/Small
        :DUCKING_STD,    6, # Ducking/Standard
        :DUCKING_LARGE,  7, # Ducking/Large
    ]
  end
end