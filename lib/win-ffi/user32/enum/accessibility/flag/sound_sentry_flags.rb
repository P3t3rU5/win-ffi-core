module WinFFI
  module User32
    # SOUNDSENTRY dwFlags field
    SoundSentryFlags = enum :sound_sentry_flags, [
        :SOUNDSENTRYON, 0x00000001,
        :AVAILABLE,     0x00000002,
        :INDICATOR,     0x00000004,
    ]
  end
end