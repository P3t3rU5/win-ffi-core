module WinFFI
  module Gdi32
    class BITMAPINFOHEADER < FFIStruct
      layout :biSize,          :dword,
             :biWidth,         :long,
             :biHeight,        :long,
             :biPlanes,        :word,
             :biBitCount,      :word,
             :biCompression,   :dword,
             :biSizeImage,     :dword,
             :biXPelsPerMeter, :long,
             :biYPelsPerMeter, :long,
             :biClrUsed,       :dword,
             :biClrImportant,  :dword
    end
  end
end