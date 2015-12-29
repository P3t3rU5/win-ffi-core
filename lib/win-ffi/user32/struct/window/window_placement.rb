module WinFFI
  module User32
    class WINDOWPLACEMENT < FFIStruct
      layout :length,           :uint,
             :flags,            :uint,
             :showCmd,          :uint,
             :ptMinPosition,    POINT,
             :ptMaxPosition,    POINT,
             :rcNormalPosition, RECT

      #TODO
      #remove_method :length=

      def initialize
        super
        self[:length] = self.size
      end

      def showCmd
        User32::ShowWindowEnum[self[:showCmd]]
      end

      def showCmd=(v)
        self[:showCmd] = v.is_a?(Integer) ? v : User32::ShowWindowEnum[v]
      end

      def to_s
        "showCmd = #{showCmd}, min = #{ptMinPosition}, max = #{ptMaxPosition}, normal = #{rcNormalPosition}"
      end
    end
  end
end
