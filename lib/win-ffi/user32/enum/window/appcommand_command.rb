module WinFFI
  module User32
    buffer = [
        :KEY,                  0,
        :BROWSER_BACKWARD,     1,
        :BROWSER_FORWARD,      2,
        :BROWSER_REFRESH,      3,
        :BROWSER_STOP,         4,
        :BROWSER_SEARCH,       5,
        :BROWSER_FAVORITES,    6,
        :BROWSER_HOME,         7,
        :VOLUME_MUTE,          8,
        :VOLUME_DOWN,          9,
        :VOLUME_UP,           10,
        :MEDIA_NEXTTRACK,     11,
        :MEDIA_PREVIOUSTRACK, 12,
        :MEDIA_STOP,          13,
        :MEDIA_PLAY_PAUSE,    14,
        :LAUNCH_MAIL,         15,
        :LAUNCH_MEDIA_SELECT, 16,
        :LAUNCH_APP1,         17,
        :LAUNCH_APP2,         18,
        :BASS_DOWN,           19,
        :BASS_BOOST,          20,
        :BASS_UP,             21,
        :TREBLE_DOWN,         22,
        :TREBLE_UP,           23,
        :OEM,             0x1000,
        :MOUSE,           0x8000,
        :MASK,            0xF000,
    ]

    if WindowsVersion >= :xp
      buffer += [
          :MICROPHONE_VOLUME_MUTE,            24,
          :MICROPHONE_VOLUME_DOWN,            25,
          :MICROPHONE_VOLUME_UP,              26,
          :HELP,                              27,
          :FIND,                              28,
          :NEW,                               29,
          :OPEN,                              30,
          :CLOSE,                             31,
          :SAVE,                              32,
          :PRINT,                             33,
          :UNDO,                              34,
          :REDO,                              35,
          :COPY,                              36,
          :CUT,                               37,
          :PASTE,                             38,
          :REPLY_TO_MAIL,                     39,
          :FORWARD_MAIL,                      40,
          :SEND_MAIL,                         41,
          :SPELL_CHECK,                       42,
          :DICTATE_OR_COMMAND_CONTROL_TOGGLE, 43,
          :MIC_ON_OFF_TOGGLE,                 44,
          :CORRECTION_LIST,                   45,
          :MEDIA_PLAY,                        46,
          :MEDIA_PAUSE,                       47,
          :MEDIA_RECORD,                      48,
          :MEDIA_FAST_FORWARD,                49,
          :MEDIA_REWIND,                      50,
          :MEDIA_CHANNEL_UP,                  51,
          :MEDIA_CHANNEL_DOWN,                52
      ]
      if WindowsVersion >= :vista
        buffer += [
            :DELETE,     53,
            :DWM_FLIP3D, 54,
        ]
      end

    end
    # cmd for HSHELL_APPCOMMAND and WM_APPCOMMAND
    APPCOMMAND_Command = enum :appcommand_command, buffer
  end
end
