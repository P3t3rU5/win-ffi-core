require 'win-ffi/structs/point'

module WinFFI
  module User32
    class ALTTABINFO < FFIStruct
      layout :cbSize,    :dword,
             :cItems,    :int,
             :cColumns,  :int,
             :cRows,     :int,
             :iColFocus, :int,
             :iRowFocus, :int,
             :cxItem,    :int,
             :cyItem,    :int,
             :ptStart,   POINT
    end
  end
end
