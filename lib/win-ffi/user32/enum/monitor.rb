module WinFFI
  module User32
    Monitor = enum :monitor, [
        :DEFAULTTONULL,    0x00000000,
        :DEFAULTTOPRIMARY, 0x00000001,
        :DEFAULTTONEAREST, 0x00000002
    ]
  end
end