require 'win-ffi/lib_base'

module WinFFI
  module Msvcrt
    extend WinFFI::LibBase

    ffi_lib 'msvcrt'
  end
end
