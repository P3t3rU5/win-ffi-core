require 'win-ffi/lib_base'

module WinFFI
  module Msimg32
    extend WinFFI::LibBase

    ffi_lib 'msimg32'
  end
end