require 'win-ffi/winmm'

module WinFFI
  module Winmm
    SoundFlags = enum :sound_flags, [
        :SYNC,      0x0000,
        :ASYNC,     0x0001,
        :NODEFAULT, 0x0002,
        :MEMORY,    0x0004,

        #loop the sound until next sndPlaySound
        :LOOP,      0x0008,
        :NOSTOP,    0x0010,
        :PURGE,     0x40,

        #The pszSound parameter is an application-specific alias in the registry. You can combine this flag with the
        # SND_ALIAS or SND_ALIAS_ID flag to specify an application-defined sound alias.
        :APPLICATION, 0x80,
        :NOWAIT,      0x00002000,
        :ALIAS,       0x00010000,
        :ALIAS_ID,    0x00110000,
        :FILENAME,    0x00020000,
        :RESOURCE,    0x00040004
    ]
  end
end