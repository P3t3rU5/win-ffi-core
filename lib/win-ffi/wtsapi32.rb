require 'win-ffi/lib_base'

module WinFFI
  module Wtsapi32
    extend WinFFI::LibBase

    ffi_lib 'wtsapi32'
  end
end