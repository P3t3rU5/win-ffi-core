# MM_MAX_NUMAXES = 16

module WinFFI
  module Gdi32
    class DESIGNVECTOR < FFIStruct
      layout :dvReserved, :dword,
             :dvNumAxes,  :dword,
             :dvValues,   [:long, 16]
    end
  end
end