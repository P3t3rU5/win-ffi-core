module WinFFI
  module User32
    EditStyle = enum :edit_style,
    [
      :AUTOHSCROLL,
      :AUTOVSCROLL,
      :CENTER,
      :LEFT,
      :LOWERCASE,
      :MULTILINE,
      :NOHIDESEL,
      :NUMBER,
      :OEMCONVERT,
      :PASSWORD,
      :READONLY,
      :RIGHT,
      :UPPERCASE,
      :WANTRETURN
    ]
  end
end