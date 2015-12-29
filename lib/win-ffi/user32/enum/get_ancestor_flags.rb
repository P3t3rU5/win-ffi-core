require 'win-ffi/user32'

module WinFFI
  module User32
    GetAncestorFlags = enum :get_ancestor_flags,
    [
      :PARENT,    1,
      :ROOT,      2,
      :ROOTOWNER, 3
    ]
  end
end