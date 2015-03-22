module WinFFI
  module User32
    class TitleBarInfo < FFIStruct
      layout :cbSize,        :dword,
             :rcTitleBar,    RECT,
             :rgstate,       :dword
    end
  end
end