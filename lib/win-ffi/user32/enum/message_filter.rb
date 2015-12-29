require 'win-ffi/user32'

module WinFFI
  module User32
    MessageFilter = enum :message_filter,
    [
      :ADD,    1,
      :REMOVE, 2
    ]
  end
end