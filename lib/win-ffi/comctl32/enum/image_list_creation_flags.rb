require 'win-ffi/comctl32'

module WinFFI
  module Comctl32
    buffer = [
        :MASK,     0x00000001,
        :COLOR,    0x00000000,
        :COLORDDB, 0x000000FE,
        :COLOR4,   0x00000004,
        :COLOR8,   0x00000008,
        :COLOR16,  0x00000010,
        :COLOR24,  0x00000018,
        :COLOR32,  0x00000020,
        :PALETTE,  0x00000800  # (not implemented)
    ]

    if WindowsVersion >= :xp
      buffer += [
          :MIRROR,        0x00002000, # Mirror the icons contained, if the process is mirrored
          :PERITEMMIRROR, 0x00008000  # Causes the mirroring code to mirror each item when inserting a set of images, verses the whole strip
      ]
      if WindowsVersion >= :vista
        buffer += [
            :ORIGINALSIZE,     0x00010000, # Imagelist should accept smaller than set images and apply OriginalSize based on image added
            :HIGHQUALITYSCALE, 0x00020000 # Imagelist should enable use of the high quality scaler.
        ]
      end
    end

    ImageListCreationFlags = enum :image_list_creation_flags, buffer
  end
end