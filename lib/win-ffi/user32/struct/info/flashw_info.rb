module WinFFI
  module User32
    class FLASHWINFO < FFIStruct
      layout :cbSize,    :uint,
             :hwnd,      :hwnd,
             :dwFlags,   :dword,
             :uCount,    :uint,
             :dwTimeout, :dword

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end
