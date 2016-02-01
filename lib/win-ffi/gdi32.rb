require 'win-ffi/lib_base'

module WinFFI
  module Gdi32
    extend WinFFI::LibBase

    ffi_lib 'gdi32'

    LOGPIXELSX = 88
    LOGPIXELSY = 90

  end
end