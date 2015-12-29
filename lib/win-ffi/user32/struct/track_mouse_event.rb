module WinFFI
  module User32
    class TRACKMOUSEEVENT < FFIStruct
      layout :cbSize,      :dword,
             :dwFlags,     :dword,
             :hwndTrack,   :hwnd,
             :dwHoverTime, :dword

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end