require 'win-ffi/user32/enum/accessibility/flag/mouse_keys_flag'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd373593(v=vs.85).aspx
    class MOUSEKEYS < FFIStruct
      layout :cbSize,          :uint,
             :dwFlags,         MouseKeysFlag,
             :iMaxSpeed,       :dword,
             :iTimeToMaxSpeed, :dword,
             :iCtrlSpeed,      :dword,
             :dwReserved1,     :dword,
             :dwReserved2,     :dword

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end