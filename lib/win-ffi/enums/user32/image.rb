require 'win-ffi/enums/user32'

module WinFFI
  module User32
    Image = enum :image,
    [
      :BITMAP, 0, # Loads a bitmap.
      :ICON,   1, # Loads an icon.
      :CURSOR, 2 # Loads a cursor.
    ]
  end
end