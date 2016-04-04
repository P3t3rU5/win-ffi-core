require 'win-ffi/lib_base'

module WinFFI
  module Kernel32
    extend WinFFI::LibBase

    ffi_lib 'kernel32'

    # Standard Access Rights
    # The following are masks for the predefined standard access types
    DELETE                   = 0x00010000
    READ_CONTROL             = 0x00020000
    WRITE_DAC                = 0x00040000
    WRITE_OWNER              = 0x00080000
    SYNCHRONIZE              = 0x00100000

    STILL_ACTIVE = 259
  end
end

