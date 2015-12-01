require 'win-ffi/structs/rect'

module WinFFI
  module User32
    class SCROLLBARINFO < FFIStruct
      layout :cbSize,        :dword,
             :rcScrollBar,   RECT,
             :dxyLineButton, :int,
             :xyThumbTop,    :int,
             :xyThumbBottom, :int,
             :reserved,      :int,
             :rgstate,       :dword
    end
  end
end