module WinFFI
  module User32
    if WindowsVersion >= :vista
      class NMHDR < FFIStruct
        layout :hwnd,    :pointer,
               :idFrom,  :uint,
               :code,    :uint
      end
    end
  end
end