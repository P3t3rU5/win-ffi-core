require 'win-ffi/gdi32'

module WinFFI
  module Gdi32
    buffer = [
        :DEFAULT,        0,
        :DRAFT,          1,
        :PROOF,          2,
        :NONANTIALIASED, 3,
        :ANTIALIASED,    4
    ]

    if WindowsVersion >= :xp
      buffer += [
          :CLEARTYPE,                 5,
          :CLEARTYPE_NATURAL_QUALITY, 6,
      ]
    end

    FontQuality = enum FFI::Type::UINT8, :font_quality, buffer

  end
end