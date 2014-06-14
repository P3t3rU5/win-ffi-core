module WinFFI
  module User32
    module Window

      class TitleBarInfo < FFI::Struct
        layout :cbSize,        :dword,
               :rcTitleBar,    RECT,
               :rgstate,       :dword
      end

    end
  end
end