require 'win-ffi/user32'

module WinFFI
  module User32
    MapVirtualKey = enum :map_virtual_key,
    [
      :VK_TO_VSC, 0, # uCode is a virtual-key code and is translated into a scan code. If it is a virtual-key code t
      # hat does not distinguish between left- and right-hand keys, the left-hand scan code is returned. If there is
      # no translation, the function returns 0.

      :VSC_TO_VK, 1, #uCode is a scan code and is translated into a virtual-key code that does not distinguish between
      # left-hand right-hand keys. If there is no translation, the function returns 0.

      :VK_TO_CHAR, 2, # uCode is a virtual-key code and is translated into an unshifted character value in the
      # low-order word of the return value. Dead keys (diacritics) are indicated by setting the top bit of the return
      # value. If there is no translation, the function returns 0.

      :VSC_TO_VK_EX, 3, # uCode is a scan code and is translated into a virtual-key code that distinguishes between
      # left- and right-hand keys. If there is no translation, the function returns 0.
    ]
  end
end