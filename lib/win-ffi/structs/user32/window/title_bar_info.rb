require 'win-ffi/structs/rect'

module WinFFI
  module User32
    class TITLEBARINFO < FFIStruct
      layout :cbSize,        :dword,
             :rcTitleBar,    RECT,
             :rgstate,       :dword
    end
  end
end