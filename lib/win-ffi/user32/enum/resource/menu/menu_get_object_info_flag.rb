module WinFFI
  module User32
    MenuGetObjectInfoFlag = enum :menu_get_object_info_flag, [
        :TOPGAP,    0x00000001,
        :BOTTOMGAP, 0x00000002
    ]
  end
end