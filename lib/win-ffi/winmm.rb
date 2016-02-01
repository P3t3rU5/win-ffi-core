require 'win-ffi/lib_base'

module WinFFI
  module Winmm
    extend WinFFI::LibBase

    ffi_lib 'winmm'

    typedef :pointer, :hwaveout
    typedef :pointer, :hwavein
    typedef :uint,    :mmversion

  end
end