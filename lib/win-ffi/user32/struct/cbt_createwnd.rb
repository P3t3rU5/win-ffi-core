module WinFFI
  module User32
    # HCBT_CREATEWND parameters pointed to by lParam
    class CBT_CREATEWND < FFIStruct
      layout :tagCREATESTRUCTA, :struct,
             :hwndInsertAfter,  :hwnd
    end
  end
end