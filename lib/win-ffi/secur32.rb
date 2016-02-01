require 'win-ffi/lib_base'

module WinFFI
  module Secur32
    extend WinFFI::LibBase

    ffi_lib 'secur32'
  end
end