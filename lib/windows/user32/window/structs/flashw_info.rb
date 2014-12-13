module WinFFI
  module User32
    module Window

      class FlashwInfo < FFI::Struct
        layout :cbSize,    :uint,
               :hwnd,      :hwnd,
               :dwFlags,   :dword,
               :uCount,    :uint,
               :dwTimeout, :dword
      end

    end
  end
end