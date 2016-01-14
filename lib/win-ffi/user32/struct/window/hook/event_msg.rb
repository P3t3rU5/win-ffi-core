module WinFFI
  module User32
    # Message Structure used in Journaling
    class EVENTMSG < FFIStruct
      layout :message, :uint,
             :paramL,  :uint,
             :paramH,  :uint,
             :time,    :dword,
             :hwnd,    :hwnd
    end
  end
end