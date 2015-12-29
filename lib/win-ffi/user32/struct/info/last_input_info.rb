module WinFFI
  module User32
    class LASTINPUTINFO < FFIStruct
      layout :cbSize, :uint,
             :dwTime, :dword
    end

    def initialize
      super
      self.cbSize = self.size
    end
  end
end