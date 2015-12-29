module WinFFI
  module Winmm
    extend LibBase

    ffi_lib 'winmm'

    typedef :pointer, :hwaveout
    typedef :pointer, :hwavein
    typedef :uint,    :mmversion

  end
end