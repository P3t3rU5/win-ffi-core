require 'win-ffi/user32'

module WinFFI
  module User32
    buffer = [
        :GDIOBJECTS,  0, # Count of GDI objects
        :USEROBJECTS, 1  # Count of USER objects
    ]

    if WindowsVersion >= 7
      buffer += [
          :GDIOBJECTS_PEAK,  2, # Peak count of GDI objects
          :USEROBJECTS_PEAK, 4  # Peak count of USER objects
      ]
    end

    GuiResourcesFlags = enum :gui_resources_flags, buffer
  end
end