require 'win-ffi/user32/enum/resource/menu/menu_get_object_info_flag'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms647572(v=vs.85).aspx
    class MENUGETOBJECTINFO < FFIStruct
      layout :dwFlags, MenuGetObjectInfoFlag,
             :uPos,    :uint,
             :hmenu,   :hmenu,
             :riid,    :pointer,
             :pvObj,   :pointer
    end
  end
end