require 'win-ffi/user32/enum/accessibility/flag/sticky_keys_flag'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd373652(v=vs.85).aspx
    class STICKYKEYS < FFIStruct
      layout :cbSize,  :uint,
             :dwFlags, StickyKeysFlag

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end
