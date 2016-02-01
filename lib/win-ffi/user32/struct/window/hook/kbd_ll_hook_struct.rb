require 'win-ffi/user32/enum/interaction/keyboard/virtual_key_code'

module WinFFI
  module User32
    # Structure used by WH_KEYBOARD_LL
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644967(v=vs.85).aspx
    class KBDLLHOOKSTRUCT < FFIStruct
      layout :vkCode, VirtualKeyCode,
             :scanCode, :dword,
             :flags, :dword,
             :time, :dword,
             :dwExtraInfo, :ulong
    end
  end
end
