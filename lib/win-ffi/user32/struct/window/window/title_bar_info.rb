require 'win-ffi/general/struct/rect'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632608(v=vs.85).aspx
    class TITLEBARINFO < FFIStruct
      layout :cbSize,        :dword,
             :rcTitleBar,    RECT,
             :rgstate,       [:dword, 6]  # ARRAY rgstate[CCHILDREN_TITLEBAR + 1];

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end