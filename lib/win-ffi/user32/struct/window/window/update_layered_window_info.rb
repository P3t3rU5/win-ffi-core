require 'win-ffi/user32/enum/window/flag/layered_window_attributes_flags'

require 'win-ffi/general/struct/point'
require 'win-ffi/general/struct/size'
require 'win-ffi/general/struct/rect'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms632609(v=vs.85).aspx
    class UPDATELAYEREDWINDOWINFO < FFIStruct
      layout :cbSize,   :dword,
             :hdcDst,   :hdc,
             :pptDst,   POINT.ptr,
             :psize,    SIZE.ptr,
             :hdcSrc,   :hdc,
             :pptSrc,   POINT.ptr,
             :crKey,    :dword,
             :pblend,   :pointer,
             :dwFlags,  LayeredWindowAttributesFlags,
             :prcDirty, RECT.ptr

      def initialize
        super
        self.cbSize = self.size
      end
    end
  end
end