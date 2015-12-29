require 'win-ffi/shell32/struct/guid'

module WinFFI
  module Shell32

    class NOTIFYICONDATA_UNION < FFI::Union
      layout :uTimeout, :uint,
             :uVersion, :uint
    end

    class NOTIFYICONDATA < FFIStruct
      layout :cbSize,           :dword,
             :hWnd,             :hwnd,
             :uID,              :uint,
             :uFlags,           :uint,
             :uCallbackMessage, :uint,
             :hicon,            :hicon,
             :szTip,            [:char, 64],
             :dwState,          :dword,
             :dwStateMask,      :dword,
             :szInfo,           [:char, 256],
             :union,            NOTIFYICONDATA_UNION,
             :szInfoTitle,      [:char, 64],
             :dwInfoFlags,      :dword,
             :guidItem,         GUID,
             :hBalloonIcon,     :hicon

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end