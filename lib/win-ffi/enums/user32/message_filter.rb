module WinFFI
  module User32
    MessageFilter = enum :message_filter,
    [
      :ADD,    1,
      :REMOVE, 2
    ]
  end
end