require 'win-ffi/general/struct/point'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644958(v=vs.85).aspx
    class MSG < FFIStruct
      layout :hwnd,    :hwnd,
             :message, :uint,
             :wParam,  :ulong,
             :lParam,  :long,
             :time,    :dword,
             :pt,      POINT

      def to_s
        "<User32::MSG #{members.map { |m| "#{m} = #{self[m]}" }.join(', ')}>"
      end
    end
  end
end
