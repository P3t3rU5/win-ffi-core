module WinFFI
  module Kernel32
    module Sound
      extend LibBase

      typedef :pointer, :hwaveout

      SoundFlags = enum :sound_flags, [
        :SYNC,        0x0000, # play synchronously (default)
        :ASYNC,       0x0001, # play asynchronously
        :NODEFAULT,   0x0002, # silence (!default) if sound not found
        :MEMORY,      0x0004, # pszSound points to a memory file
        :LOOP,        0x0008, # loop the sound until next sndPlaySound
        :NOSTOP,      0x0010, # don:t stop any currently playing sound

        :NOWAIT,      8192,   # don:t wait if the driver is busy
        :ALIAS,       65536,  # name is a registry alias
        :ALIAS_ID,    1114112,# alias is a predefined ID
        :FILENAME,    131072, # name is file name
        :RESOURCE,    262148, # name is resource name or atom

        :PURGE,       0x0040, # purge non-static events for task
        :APPLICATION, 0x0080, # look for application specific association
      ]

      ffi_lib 'kernel32'

      #BOOL WINAPI Beep(
      #  _In_  DWORD dwFreq,
      #  _In_  DWORD dwDuration )
      (attach_function :Beep, [:ulong, :ulong], :bool) if WindowsVersion >= :xp

      ffi_lib 'winmm'

      #BOOL PlaySound(
      #  LPCTSTR pszSound,
      #  HMODULE hmod,
      #  DWORD fdwSound )
      attach_function :PlaySound,  [:string, :hmodule, SoundFlags], :bool
      attach_function :PlaySoundA, [:string, :hmodule, SoundFlags], :bool
      attach_function :PlaySoundW, [:string, :hmodule, SoundFlags], :bool

      #MMRESULT waveOutSetVolume(
      #  HWAVEOUT hwo,
      #  DWORD dwVolume )
      attach_function :waveOutSetVolume, [:hwaveout, :dword], :int

      #MMRESULT waveOutGetVolume(
      #  HWAVEOUT hwo,
      #  LPDWORD pdwVolume )
      attach_function :waveOutGetVolume, [:hwaveout, :pointer], :int

      #UINT waveOutGetNumDevs(void)
      attach_function :waveOutGetNumDevs, [], :uint

      #UINT waveInGetNumDevs(void)
      attach_function :waveInGetNumDevs, [], :uint

      #UINT midiOutGetNumDevs(void)
      attach_function :midiOutGetNumDevs, [], :uint

      #UINT midiInGetNumDevs(void)
      attach_function :midiInGetNumDevs, [], :uint

      #UINT auxGetNumDevs(void)
      attach_function :auxGetNumDevs, [], :uint

      #UINT mixerGetNumDevs(void)
      attach_function :mixerGetNumDevs, [], :int
    end
  end
end