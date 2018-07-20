require 'win-ffi/core'
require 'win-ffi/core/lib_base'

module WinFFI
  module Gdi32
    extend WinFFI::LibBase

    ffi_lib 'gdi32'

    typedef :dword, :flong
  end
end