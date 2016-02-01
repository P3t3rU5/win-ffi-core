require 'win-ffi/user32/struct/data_exchange/dde/dynamic_data_exchange_management_library_message_hook_data'

module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648738(v=vs.85).aspx
    class MONMSGSTRUCT < FFIStruct
      layout :cb,     :uint,
             :hwndTo, :hwnd,
             :dwTime, :dword,
             :hTask,  :handle,
             :wMsg,   :uint,
             :wParam, :wparam,
             :lParam, :lparam,
             :dmhd,   DDEML_MSG_HOOK_DATA # new for NT
    end
  end
end
