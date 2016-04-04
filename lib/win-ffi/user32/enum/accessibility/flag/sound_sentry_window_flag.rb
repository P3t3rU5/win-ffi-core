module WinFFI
  module User32
    # values for SOUNDSENTRY iWindowsEffect field
    SoundSentryWindowFlag = enum :sound_sentry_window_flag, [
        :NONE,    0,
        :TITLE,   1,
        :WINDOW,  2,
        :DISPLAY, 3,
        :CUSTOM,  4
    ]
  end
end