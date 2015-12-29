require 'win-ffi/winmm'

module WinFFI
  module Winmm
    class Smpte < FFIStruct
      layout :hour,   :byte,
             :min,    :byte,
             :sec,    :byte,
             :frame,  :byte,
             :fps,    :byte,
             :dummy,  :byte,
             :pad,    [:byte, 2]
    end

    class Midi < FFIStruct
      layout :songptrpos, :dword
    end

    class MMTIME_UNION < FFI::Union
      layout :ms,     :dword,
             :sample, :dword,
             :cb,     :dword,
             :ticks,  :dword,
             :smpte,  Smpte,
             :midi,   Midi
    end

    class MMTIME < FFIStruct
      layout :wType, :uint,
             :u,     MMTIME_UNION
    end
  end
end