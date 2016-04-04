module WinFFI
  module User32
    buffer = [
        :CARETBLINKING,  0x00000001,
        :INMOVESIZE,     0x00000002,
        :INMENUMODE,     0x00000004,
        :SYSTEMMENUMODE, 0x00000008,
        :POPUPMENUMODE,  0x00000010,
    ]

    buffer += WindowsVersion >= :xp ? [:'16BITTASK', 0x00000000] : [:'16BITTASK', 0x00000020]

    GUIFlag = enum :gui_flag, buffer
  end
end