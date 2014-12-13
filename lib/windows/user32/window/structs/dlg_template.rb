module WinFFI
  module User32
    module Dialog
      class DLGTEMPLATE < FFI::Struct
        layout :style,           :dword,
               :dwExtendedStyle, :dword,
               :cdit,            :word,
               :x,               :short,
               :y,               :short,
               :cx,              :short,
               :cy,              :short
      end
    end
  end
end
