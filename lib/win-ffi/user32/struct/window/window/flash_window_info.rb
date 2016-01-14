require 'win-ffi/user32/enum/window/flag/flash_window_flags'

module WinFFI
  module User32
    if WIndowsVersion >= :xp
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679348(v=vs.85).aspx
      class FLASHWINFO < FFIStruct
        layout :cbSize,    :uint,
               :hwnd,      :hwnd,
               :dwFlags,   FlashWindowFlags,
               :uCount,    :uint,
               :dwTimeout, :dword

        def initialize
          super
          self.cbSize = self.size
        end
      end
    end
  end
end
