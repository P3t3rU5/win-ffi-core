module WinFFI
  module User32
    # Owner draw control types
    OwnerDrawnControlType = enum :owner_drawn_control_type, [
        :MENU,     1,
        :LISTBOX,  2,
        :COMBOBOX, 3,
        :BUTTON,   4,
        :STATIC,   5,
    ]
  end
end