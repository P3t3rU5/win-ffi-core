module WinFFI
  module User32
    module Window

      class AltTabInfo < FFI::Struct
        layout :cbSize,    :dword,
               :cItems,    :int,
               :cColumns,  :int,
               :cRows,     :int,
               :iColFocus, :int,
               :iRowFocus, :int,
               :cxItem,    :int,
               :cyItem,    :int,
               :ptStart,    POINT
      end

    end
  end
end