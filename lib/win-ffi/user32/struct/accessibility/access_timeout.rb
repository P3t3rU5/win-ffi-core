require 'win-ffi/user32/enum/accessibility/flag/access_timeout_flag'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317982(v=vs.85).aspx
    class ACCESSTIMEOUT < FFIStruct
      layout :cbSize,       :uint,
             :dwFlags,      AccessTimeoutFlag,
             :iTimeOutMSec, :dword

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end