module WinFFI
  module User32
    # values for SOUNDSENTRY iWindowsEffect field
    SoundSentryWindowFlags = enum :sound_sentry_window_flags, [
        :NONE,    0,
        :TITLE,   1,
        :WINDOW,  2,
        :DISPLAY, 3,
        :CUSTOM,  4
    ]
  end
end