require 'win-ffi/winmm'

module WinFFI
  module Winmm
    WHDR = enum :whdr_flags, [
        :DONE,      1,
        :PREPARED,  2,
        :BEGINLOOP, 4,
        :ENDLOOP,   8,
        :INQUEUE,   16
    ]
  end
end