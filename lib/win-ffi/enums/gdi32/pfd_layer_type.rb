require 'win-ffi/enums/gdi32'

module WinFFI
  module Gdi32
    PFD_LAYER_TYPE = enum :pfd_layer_type, [:MAIN_PLANE, :OVERLAY_PLANE, :UNDERLAY_PLANE, -1]
  end
end