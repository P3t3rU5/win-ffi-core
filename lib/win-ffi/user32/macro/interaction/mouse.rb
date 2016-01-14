module WinFFI
  module User32
    class << self
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646247(v=vs.85).aspx
      def GET_APPCOMMAND_LPARAM(lParam)
        HIWORD(lParam) & ~FAPPCOMMAND_MASK
      end

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646248(v=vs.85).aspx
      def GET_DEVICE_LPARAM(lParam)
        HIWORD(lParam) & FAPPCOMMAND_MASK
      end

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646249(v=vs.85).aspx
      def GET_FLAGS_LPARAM(lParam)
        LOWORD(lParam)
      end

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646250(v=vs.85).aspx
      def GET_KEYSTATE_LPARAM(lParam)
        GET_FLAGS_LPARAM(lParam)
      end

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646251(v=vs.85).aspx
      def GET_KEYSTATE_WPARAM(wParam)
        LOWORD(wParam)
      end

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646252(v=vs.85).aspx
      def GET_MOUSEORKEY_LPARAM
        GET_DEVICE_LPARAM
      end

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646253(v=vs.85).aspx
      def GET_NCHITTEST_WPARAM(wParam)
        LOWORD(wParam)
      end

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646254(v=vs.85).aspx
      def GET_WHEEL_DELTA_WPARAM(wParam)
        HIWORD(wParam)
      end

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms646255(v=vs.85).aspx
      def GET_XBUTTON_WPARAM(wParam)
        HIWORD(wParam)
      end
    end
  end
end