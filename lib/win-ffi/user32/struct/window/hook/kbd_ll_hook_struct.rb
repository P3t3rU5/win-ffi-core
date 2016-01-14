require 'win-ffi/user32/enum/virtual_key_flags'

require 'win-ffi/user32/enum/low_level_keyboard_hook_flags'

module WinFFI
  module User32
    # Structure used by WH_KEYBOARD_LL
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644967(v=vs.85).aspx
    class KBDLLHOOKSTRUCT < FFIStruct
      layout :vkCode,      LowLevelKeyboardHookFlags,
             :scanCode,    :dword,
             :flags,       :dword,
             :time,        :dword,
             :dwExtraInfo, :ulong
    end
  end
end
