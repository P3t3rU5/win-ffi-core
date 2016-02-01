module WinFFI
  module User32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648732(v=vs.85).aspx
    class DDEML_MSG_HOOK_DATA < FFIStruct
      layout :uiLo,   :uint, # unpacked lo and hi parts of lParam,
             :uiHi,   :uint,
             :cbData, :dword, # amount of data in message, if any. May be > than 32 bytes.,
             :Data,   [:dword, 8] # data peeking by DDESPY is limited to 32 bytes.
    end
  end
end