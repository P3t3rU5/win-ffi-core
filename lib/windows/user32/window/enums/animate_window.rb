module WinFFI
  module User32
    module Window
      AnimateWindowFlags = enum :animate_window, [
          :HOR_POSITIVE, 0x00000001, # Animates the window from left to right. This flag can be used with roll or slide
          # animation. It is ignored when used with AW_CENTER or AW_BLEND.

          :HOR_NEGATIVE, 0x00000002, # Animates the window from right to left. This flag can be used with roll or slide
          # animation. It is ignored when used with AW_CENTER or AW_BLEND.

          :SLIDE, 0x00040000, # Uses slide animation. By default, roll animation is used. This flag is ignored when used
          # with AW_CENTER.

          :VER_POSITIVE, 0x00000004, # Animates the window from top to bottom. This flag can be used with roll or slide
          # animation. It is ignored when used with AW_CENTER or AW_BLEND.

          :VER_NEGATIVE, 0x00000008, # Animates the window from bottom to top. This flag can be used with roll or slide
          # animation. It is ignored when used with AW_CENTER or AW_BLEND.

          :CENTER, 0x00000010, # Makes the window appear to collapse inward if AW_HIDE is used or expand outward if the
          # AW_HIDE is not used. The various direction flags have no effect.

          :HIDE,     0x00010000, # Hides the window. By default, the window is shown.

          :ACTIVATE, 0x00020000, # Activates the window. Do not use this value with AW_HIDE.

          :BLEND,    0x00080000, # Uses a fade effect. This flag can be used only if hwnd is a top-level window.
      ]
    end
  end
end