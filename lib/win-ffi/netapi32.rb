require 'win-ffi/lib_base'

module WinFFI
  module Netapi32
    extend WinFFI::LibBase

    ffi_lib 'netapi32'
  end
end