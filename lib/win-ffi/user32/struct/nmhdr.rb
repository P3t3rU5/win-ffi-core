module WinFFI
  module User32
    class NMHDR < FFIStruct
      layout :hwnd,    :pointer,
             :idFrom,  :uint,
             :code,    :uint

    end
  end
end