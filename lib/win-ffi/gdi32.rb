module WinFFI
  module Gdi32
    extend LibBase

    ffi_lib 'gdi32'

    LOGPIXELSX = 88
    LOGPIXELSY = 90

  end
end