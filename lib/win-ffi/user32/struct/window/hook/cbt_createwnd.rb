require 'win-ffi/user32/struct/window/create_struct'

module WinFFI
  module User32
    # HCBT_CREATEWND parameters pointed to by lParam
    class CBT_CREATEWND < FFIStruct
      layout :lpcs,            CREATESTRUCT,
             :hwndInsertAfter, :hwnd
    end
  end
end