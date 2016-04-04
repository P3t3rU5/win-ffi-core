module WinFFI
  module User32
    # values for SOUNDSENTRY iFSGrafEffect field
    SoundSentryGraphFlag = enum :sound_sentry_graph_flag, [
        :NONE,    0,
        :DISPLAY, 3
    ]
  end
end