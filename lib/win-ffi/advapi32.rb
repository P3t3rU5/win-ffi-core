require 'win-ffi/lib_base'

module WinFFI
  module Advapi32
    extend WinFFI::LibBase

    ffi_lib 'advapi32'
  end
end