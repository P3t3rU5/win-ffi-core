module WinFFI
  module User32
    MenuGetObjectInfoFlags = enum :menu_get_object_info_flags, [
        :TOPGAP,    0x00000001,
        :BOTTOMGAP, 0x00000002
    ]
  end
end