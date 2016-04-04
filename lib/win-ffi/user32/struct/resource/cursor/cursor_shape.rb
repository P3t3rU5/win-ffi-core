module WinFFI
  module User32
    # Icon/Cursor header
    class CURSORSHAPE < FFIStruct
      layout :xHotSpot,  :int,
             :yHotSpot,  :int,
             :cx,        :int,
             :cy,        :int,
             :cbWidth,   :int,
             :Planes,    :byte,
             :BitsPixel, :byte
    end
  end
end
