require 'win-ffi/lib_base'

module WinFFI
  module Kernel32
    extend WinFFI::LibBase

    ffi_lib 'kernel32'
  end
end

