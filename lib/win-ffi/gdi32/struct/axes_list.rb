require 'win-ffi/gdi32/struct/axis_info'

module WinFFI
  module Gdi32
    class AXESLIST < FFIStruct
      layout :axlReserved, :dword,
             :axlNumAxes,  :dword,
             :axlAxisInfo, AXISINFO.ptr
    end
  end
end