module WinFFI
  module User32
    class MSG < FFIStruct
      layout :hwnd,    :pointer,
             :message, :uint,
             :ulong,   :ulong,
             :long,    :long,
             :time,    :uint,
             :pt,      POINT

      def to_s
        "<User32::MSG #{members.map { |m| "#{m} = #{self[m]}" }.join(', ')}>"
      end
    end
  end
end
