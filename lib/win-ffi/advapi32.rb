require 'win-ffi/lib_base'

module WinFFI
  module Advapi32
    extend LibBase

    ffi_lib 'advapi32'
  end
end