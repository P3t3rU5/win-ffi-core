require 'win-ffi/enums/user32'

module WinFFI
  module User32
    OCR = enum :ocr,
    [
        :NORMAL,     32512,
        :IBEAM,      32513,
        :WAIT,       32514,
        :CROSS,      32515,
        :UP,         32516,
        :SIZE,       32640,   # OBSOLETE: use OCR_SIZEALL
        :ICON,       32641,   # OBSOLETE: use OCR_NORMAL
        :SIZENWSE,   32642,
        :SIZENESW,   32643,
        :SIZEWE,     32644,
        :SIZENS,     32645,
        :SIZEALL,    32646,
        :ICOCUR,     32647,   # OBSOLETE: use OIC_WINLOGO
        :NO,         32648,
        :APPSTARTING,32650
    ]

    #if(WINVER >= 0x0500)
    #define OCR_HAND            32649
    #endif /* WINVER >= 0x0500 */
    if WindowsVersion >= 2000
      OCR.instance_variable_get(:@kv_map)[:HAND] = 32649
      OCR.instance_variable_get(:@vk_map)[32649] = :HAND
    end
  end
end