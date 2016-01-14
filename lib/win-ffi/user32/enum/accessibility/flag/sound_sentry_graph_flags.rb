module WinFFI
  module User32
    # values for SOUNDSENTRY iFSGrafEffect field
    SoundSentryGraphFlags = enum :sound_sentry_graph_flags, [
        :NONE,    0,
        :DISPLAY, 3
    ]
  end
end