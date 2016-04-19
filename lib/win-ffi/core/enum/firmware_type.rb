require 'win-ffi/core/lib_base'

module WinFFI
  extend LibBase

  FirmwareType = enum :firmware_type,
  [
    :Unknown, 0,
    :Bios,    1,
    :Uefi,    2,
    :Max,     3
  ]
end