module WinFFI
  module User32
    class COMBOBOXINFO < FFIStruct
      layout :cbSize,      :dword,
             :rcItem,      RECT,
             :rcButton,    RECT,
             :stateButton, :dword,
             :hwndCombo,   :hwnd,
             :hwndItem,    :hwnd,
             :hwndList,    :hwnd
    end
  end
end