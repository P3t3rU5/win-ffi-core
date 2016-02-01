require 'win-ffi/lib_base'

module WinFFI
  module Shell32
    extend WinFFI::LibBase

    ffi_lib 'shell32'
  end
end
