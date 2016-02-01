require 'win-ffi/lib_base'

module WinFFI
  module Avrt
    extend WinFFI::LibBase

    ffi_lib 'Avrt'
  end
end