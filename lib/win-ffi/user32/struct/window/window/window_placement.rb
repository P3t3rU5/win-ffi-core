require 'win-ffi/user32/enum/window/flag/window_placement_flags'
require 'win-ffi/user32/enum/window/flag/show_window_flags'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632611(v=vs.85).aspx
    class WINDOWPLACEMENT < FFIStruct
      layout :length,           :uint,
             :flags,            WindowPlacementFlags,
             :showCmd,          :uint,
             :ptMinPosition,    POINT,
             :ptMaxPosition,    POINT,
             :rcNormalPosition, RECT

      def initialize
        super
        self.length = self.size
      end

      def showCmd
        User32.ShowWindowFlags[self[:showCmd]]
      end

      def showCmd=(v)
        self.showCmd = v.is_a?(Integer) ? v : User32::ShowWindowFlags[v]
      end

      def to_s
        "showCmd = #{showCmd}, min = #{ptMinPosition}, max = #{ptMaxPosition}, normal = #{rcNormalPosition}"
      end
    end
  end
end
