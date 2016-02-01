require 'win-ffi/user32/struct/window/hook/mouse_hook_struct'

module WinFFI
  module User32

    class MOUSEHOOKSTRUCTEX < FFIStruct
      layout :DUMMYSTRUCTNAME, MOUSEHOOKSTRUCT,
             :mouseData,       :dword
    end
  end
end
