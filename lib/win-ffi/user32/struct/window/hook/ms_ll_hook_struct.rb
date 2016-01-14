require 'win-ffi/user32/enum/xbutton'
require 'win-ffi/user32/enum/low_level_mouse_hook_flags'

require 'win-ffi/general/struct/point'

module WinFFI
  module User32
    # Structure used by WH_MOUSE_LL
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644970(v=vs.85).aspx
    class MSLLHOOKSTRUCT < FFIStruct
      layout :pt,          POINT,
             :mouseData,   XButton,
             :flags,       LowLevelMouseHookFlags,
             :time,        :dword,
             :dwExtraInfo, :ulong
    end
  end
end
